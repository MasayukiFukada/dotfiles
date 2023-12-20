import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import System.IO

import XMonad.Layout
import XMonad.Layout.DragPane          -- see only two window
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.PerWorkspace      -- Configure layouts on a per-workspace
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Accordion
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ThreeColumns
import XMonad.Layout.OneBig
import XMonad.Layout.Circle
import XMonad.Layout.Reflect
import XMonad.Layout.Roledex
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Layout.TwoPane
import XMonad.Util.EZConfig            -- additionalKeys
import XMonad.Util.Run(spawnPipe)

import XMonad.Hooks.DynamicLog

myLayout = spacing gapwidth $ gaps [(U, gwU),(D, gwD),(L, gwL),(R, gwR)]
           $ (ResizableTall 1 (1/205) (120/205) [])

main = do
    xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"

-- Border width
borderwidth = 4

-- gapwidth
gapwidth  = 4
gwU = 2
gwD = 1
gwL = 18
gwR = 17

-- Color Setting
colorBlue      = "#868bae"
colorGreen     = "#00d700"
colorRed       = "#ff005f"
colorGray      = "#666666"
colorWhite     = "#bdbdbd"
colorNormalbg  = "#1c1c1c"
colorfg        = "#a8b6b8"

myPP = xmobarPP { ppOrder = \(ws:l:t:_)  -> [ws,t]
, ppCurrent         = xmobarColor colorRed   colorNormalbg . \s -> "●"
, ppUrgent          = xmobarColor colorGray  colorNormalbg . \s -> "●"
, ppVisible         = xmobarColor colorGreen colorNormalbg . \s -> "⦿"
, ppHidden          = xmobarColor colorGray  colorNormalbg . \s -> "●"
, ppHiddenNoWindows = xmobarColor colorGray  colorNormalbg . \s -> "○"
, ppTitle           = xmobarColor colorRed   colorNormalbg
, ppOutput          = putStrLn
, ppWsSep           = " "
, ppSep             = "  "
}

myStartup = do
    setWMName "LG3D"

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = def
        { terminal = "xfce4-terminal"
        , modMask = mod4Mask
        , borderWidth = borderwidth
        , focusFollowsMouse = False
        , focusedBorderColor = "#ff0000"
        , startupHook = myStartup
        , layoutHook = reflectVert Accordion
        ||| Simplest
        ||| Circle
        ||| myLayout
        ||| reflectHoriz myLayout
        ||| Mirror myLayout
        ||| reflectVert (Mirror myLayout)
        ||| ThreeColMid 1 (3/100) (1/2)
        ||| OneBig (3/4) (3/4)
        ||| spiral (6/7) }
        `additionalKeys`
        [ ((0 , 0x1008FF11), spawn "amixer -q sset Master 2%+")
        , ((0 , 0x1008FF13), spawn "amixer -q sset Master 2%-")
        , ((0 , 0x1008FF12), spawn "amixer set Master toggle") ]
