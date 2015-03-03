-- http://www.haskell.org/haskellwiki/Xmonad/Config_archive/adamvo%27s_xmonad.hs

{-# LANGUAGE
     DeriveDataTypeable,
     FlexibleContexts,
     FlexibleInstances,
     MultiParamTypeClasses,
     NoMonomorphismRestriction,
     PatternGuards,
     ScopedTypeVariables,
     TypeSynonymInstances,
     UndecidableInstances
     #-}
{-# OPTIONS_GHC -W -fwarn-unused-imports -fno-warn-missing-signatures #-}

import Control.Applicative
import Control.Monad
import Control.Monad.Instances ()
import Control.Monad.Writer
import Data.List
import Data.Maybe
import Data.Traversable(traverse)
import Graphics.X11.Xinerama
import System.Exit
import System.IO
import XMonad
import XMonad.Actions.CopyWindow
import XMonad.Actions.CycleWS
import XMonad.Actions.DwmPromote
import XMonad.Actions.FloatSnap
import XMonad.Actions.GridSelect
import XMonad.Actions.Search
import XMonad.Actions.SpawnOn
import XMonad.Actions.Submap
import XMonad.Actions.SwapWorkspaces
import XMonad.Actions.UpdatePointer
import XMonad.Actions.Warp
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.BoringWindows
import XMonad.Layout.Drawer
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.LayoutHints
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Magnifier
import XMonad.Layout.Master
import XMonad.Layout.Mosaic
import XMonad.Layout.MosaicAlt
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Layout.Tabbed
import XMonad.Layout.TrackFloating
import XMonad.Layout.WindowNavigation
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Ssh
import XMonad.Prompt.Window
import XMonad.Prompt.XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Replace
import XMonad.Util.Run
import XMonad.Util.WorkspaceCompare
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import qualified XMonad.Util.ExtensibleState as XS

myWorkSpaces = [ "T" , "2" , "3" , "4", "5", "6", "7", "8", "9" ]

main :: IO ()
main = do
    replace
    let urgency
            | True = withUrgencyHook FocusHook
            | True = withUrgencyHook NoUrgencyHook
    xmonad . ewmh . urgency . myConfig
        =<< mapM xmobarScreen =<< getScreens

myConfig hs = let c = gnomeConfig {
      focusFollowsMouse = True
    , focusedBorderColor = "red"
    , borderWidth = 5
    , startupHook = do
        setWMName "LG3D"
        takeTopFocus
    , terminal = "urxvt"
    , modMask = mod4Mask
    , logHook = do
        takeTopFocus
        multiPP'
            (mergePPOutputs [ dynamicLogString ]) -- onlyTitle
            focusedPP
            nonFocusedPP
            hs
        takeTopFocus
        -- updatePointer (TowardsCentre 0.2 0.2)
    , handleEventHook = ewmhDesktopsEventHook <+> fullscreenEventHook
    , workspaces = myWorkSpaces
    , manageHook = composeAll [
                      (className =? "Google-chrome") <&&> (stringProperty "WM_WINDOW_ROLE" =? "app") --> doFloat -- does not work
                    , (className =? "gvim") --> doFloat
                    , (className =? "gnubby_ssh_prompt") --> doFloat
                    , (className =? "Xfce4-notifyd") --> doF W.focusDown <+> doF copyToAll
                    , manageSpawn
                    , manageDocks
                    ]
    } in additionalKeysP c (myKeys c)

-------------------- Keys ------------------------------------
myKeys c = [
  ("M-p", shellPromptHere greenXPConfig),
  ("M-S-q", io (exitWith ExitSuccess)),
  ("M-t", swapTerminal)
  ]

swapTerminal = do
  -- toggleWS' ["4", "5", "6", "7", "8", "9"]
  toggleOrView "T"
  -- windows $ W.greedyView "T"

-------------------- Support for per-screen xmobars ---------
-- Some parts of this should be merged into contrib sometime
getScreens :: IO [Int]
getScreens = openDisplay "" >>= liftA2 (<*) f closeDisplay
    where f = fmap (zipWith const [0..]) . getScreenInfo

multiPP :: PP -- ^ The PP to use if the screen is focused
        -> PP -- ^ The PP to use otherwise
        -> [Handle] -- ^ Handles for the status bars, in order of increasing X screen number
        -> X ()
multiPP = multiPP' dynamicLogString

multiPP' :: (PP -> X String) -> PP -> PP -> [Handle] -> X ()
multiPP' dynlStr focusPP unfocusPP handles = do
    state <- get
    let pickPP :: WorkspaceId -> WriterT (Last XState) X String
        pickPP ws = do
            let isFoc = (ws ==) . W.tag . W.workspace . W.current $ windowset state
            put state{ windowset = W.view ws $ windowset state }
            out <- lift $ dynlStr $ if isFoc then focusPP else unfocusPP
            when isFoc $ get >>= tell . Last . Just
            return out
    traverse put . getLast
        =<< execWriterT . (io . zipWithM_ hPutStrLn handles <=< mapM pickPP) . catMaybes
        =<< mapM screenWorkspace (zipWith const [0..] handles)
    return ()

mergePPOutputs :: [PP -> X String] -> PP -> X String
mergePPOutputs x pp = fmap (intercalate (ppSep pp)) . sequence . sequence x $ pp

onlyTitle :: PP -> PP
onlyTitle pp = defaultPP { ppCurrent = const ""
                         , ppHidden = const ""
                         , ppVisible = const ""
                         , ppLayout = ppLayout pp
                         , ppTitle = ppTitle pp }

-- | Requires a recent addition to xmobar (>0.9.2), otherwise you have to use
-- multiple configuration files, which gets messy
xmobarScreen :: Int -> IO Handle
xmobarScreen = spawnPipe . ("xmobar -x " ++) . show

nonFocusedPP :: PP
nonFocusedPP = xmobarPP { ppLayout = xmobarColor "orange" ""
                        , ppUrgent = xmobarColor "red" "" . ('^':)
                        , ppSort = getSortByXineramaPhysicalRule
                        }

focusedPP :: PP
focusedPP = nonFocusedPP
