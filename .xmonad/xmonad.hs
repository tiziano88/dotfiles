import XMonad
import XMonad.Config.Kde
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ICCCMFocus
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig

myWorkSpaces =
  [ "1:tmux"
  , "2:web"
  , "3:IDE"
  ]

myManageHook = composeAll
  [ className =? "google-chrome" --> doFloat
  , className =? "intellij" --> doShift "3:IDE"
  , className =? "eclipse" --> doShift "3:IDE"
  ]

--myKeys conf@(Xconfig {Xmonad.modMask = modm}) = M.fromList $
myKeys = \conf -> mkKeymap conf $
  [ ("M-S-l",    spawn $ "gnome_screensaver_command -l") ]

main = xmonad =<< xmobar defaultConfig
  { terminal = "terminator"
  , borderWidth = 2
  , modMask = mod4Mask
--  , keys = myKeys
  , startupHook = setWMName "LG3D"
  , logHook = takeTopFocus
--  , workspaces = myWorkSpaces
  , manageHook = myManageHook <+> manageHook defaultConfig
  } --`additionalKeys`
--  [ ((mod4Mask .|. shiftMask, xK_l), spawn "gnome-screensaver-command -l")
--  ]