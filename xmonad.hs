import XMonad
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.Simplest
import XMonad.Layout.ThreeColumns
import XMonad.Layout.OneBig
import XMonad.Layout.Circle
import XMonad.Layout.Cross
import XMonad.Layout.Roledex
import XMonad.Layout.Spiral
import XMonad.Layout.Reflect
import XMonad.Hooks.DynamicLog

modm = mod4Mask

myLayout = Mirror tiled
  ||| tiled
  ||| reflectHoriz tiled
  ||| Simplest
  ||| ThreeColMid 1 (3/100) (1/2)
  ||| OneBig (3/4) (3/4)
  ||| Circle
  ||| simpleCross
  ||| Roledex
  ||| spiral (6/7)
  where
      tiled = spacing 10
          $ gaps [(U, 5), (D, 5), (L, 10), (R, 10)]
          $ Tall 1 (3/100) (2/3)

main = xmonad =<< xmobar def
    { borderWidth = 3
    , modMask     = modm
    , terminal    = "tilix"
    , focusFollowsMouse    = False
    , layoutHook = myLayout
    }

