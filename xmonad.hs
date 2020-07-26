import XMonad
import XMonad.Hooks.DynamicLog
import System.IO

import XMonad.Layout
import XMonad.Layout.DragPane          -- see only two window
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.PerWorkspace      -- Configure layouts on a per-workspace
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ThreeColumns
import XMonad.Layout.OneBig
import XMonad.Layout.Circle
import XMonad.Layout.Cross
import XMonad.Layout.Reflect
import XMonad.Layout.Roledex
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Layout.TwoPane
import XMonad.Util.EZConfig            -- additionalKeys
import XMonad.Util.Run(spawnPipe)

import XMonad.Hooks.DynamicLog

myLayout = spacing 10 $ gaps [(U, 5),(D, 5),(L, 5),(R, 5)]
           $ (ResizableTall 1 (1/204) (119/204) [])

main = do
    xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"

-- Color Setting
colorBlue      = "#868bae"
colorGreen     = "#00d700"
colorRed       = "#ff005f"
colorGray      = "#666666"
colorWhite     = "#bdbdbd"
colorNormalbg  = "#1c1c1c"
colorfg        = "#a8b6b8"

myPP = xmobarPP { ppOrder = \(ws:l:t:_)  -> [ws,t]
, ppCurrent = xmobarColor colorRed     colorNormalbg . \s -> "●"
, ppUrgent = xmobarColor colorGray    colorNormalbg . \s -> "●"
, ppVisible = xmobarColor colorRed     colorNormalbg . \s -> "⦿"
, ppHidden = xmobarColor colorGray    colorNormalbg . \s -> "●"
, ppHiddenNoWindows = xmobarColor colorGray    colorNormalbg . \s -> "○"
, ppTitle = xmobarColor colorRed     colorNormalbg
, ppOutput = putStrLn
, ppWsSep = " "
, ppSep = "  "
}

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig
        { terminal = "tilix"
        , modMask = mod4Mask
        , borderWidth = 1
        , focusFollowsMouse = False
        , focusedBorderColor = "#00ff00"
        , layoutHook = myLayout
        ||| Mirror myLayout
        ||| reflectVert (Mirror myLayout)
        ||| reflectHoriz myLayout
        ||| Simplest
        ||| ThreeColMid 1 (3/100) (1/2)
        ||| OneBig (3/4) (3/4)
        ||| Circle
        ||| simpleCross
        ||| Roledex
        ||| spiral (6/7) }
        `additionalKeys`
        [ ((0 , 0x1008FF11), spawn "amixer -q sset Master 2%+")
        , ((0 , 0x1008FF13), spawn "amixer -q sset Master 2%-")
        , ((0 , 0x1008FF12), spawn "amixer set Master toggle") ]
