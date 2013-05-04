import XMonad
import XMonad.Config.Kde
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ICCCMFocus
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import qualified Data.Map as Map

myWorkSpaces =
  [ "1:tmux"
  , "2:web"
  , "3:IDE"
  , "4"
  , "5"
  , "6"
  , "7"
  , "8"
  , "9"
  ]

myManageHook = composeAll
  [ className =? "google-chrome" --> doShift "2:web"
  , className =? "intellij" --> doShift "3:IDE"
  , className =? "eclipse" --> doShift "3:IDE"
  ]

--myKeys conf@(Xconfig {Xmonad.modMask = modm}) = M.fromList $
myKeys conf = Map.fromList $
  [ ((mod4Mask .|. shiftMask, xK_l), spawn $ "gnome_screensaver_command -l") ]

main = xmonad =<< xmobar defaultConfig
  { terminal = "terminator"
  , borderWidth = 5
  , modMask = mod4Mask
--  , keys = myKeys
  , startupHook = setWMName "LG3D"
  , logHook = takeTopFocus
  , workspaces = myWorkSpaces
  , manageHook = myManageHook <+> manageHook defaultConfig
  } --`additionalKeys`
--  [ ((mod4Mask .|. shiftMask, xK_l), spawn "gnome-screensaver-command -l")
--  ]
