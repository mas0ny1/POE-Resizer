#Persistent
window := "ahk_class POEWindowClass"

#If WinActive(window) 
*F10::
	WinGetPos,,,, H, % window
	if (H = A_ScreenHeight) {
		WinMove, % window,,, A_ScreenHeight / 12,, (A_ScreenHeight/1.35) ; 1.35 is "zoom" modifier. If you get black bars on your game's sides, put it to 1.3, save & retest till satisfaction. double comma = skip parameter. Para order is X, Y, width, Height
		CreateBlackBars()
        SetTimer, CheckWindow, 200 	
	}
    if not (H = A_ScreenHeight) {
        WinMove, % window,, 0, 0,, A_ScreenHeight
        RemoveBlackBars()
		SetTimer, CheckWindow, Off   
    }
return

;Close the script if the game is closed
CheckWindow:
if !WinExist(window) {
    Esc::ExitApp
}
return

CreateBlackBars() {
    global
    ; Remove the ";" before ;+AlwaysOnTop to have the bars always on top, including when you alt tab and try to use other applications on the same monitor
    Gui, TopBar:New, +ToolWindow -caption ;+AlwaysOnTop
    Gui, TopBar:Color, 000000

	Gui, BottomBar:New, +ToolWindow -caption ;+AlwaysOnTop
    Gui, BottomBar:Color, 000000
	
    ; These values were manually tweeked by hand. Works with a 1080p Monitor
	TopBarBoxHeight := A_ScreenHeight / 12
	BottomBarBoxHeight := A_ScreenHeight / 12 + 60
	BottomBarYCoordinate := A_ScreenHeight * 10 / 12 - 10

    Gui, TopBar:Show, x0 y0 h%TopBarBoxHeight% w%A_ScreenWidth%, TopBar
    Gui, BottomBar:Show, x0 y%BottomBarYCoordinate% h%BottomBarBoxHeight% w%A_ScreenWidth%, BottomBar
}

RemoveBlackBars() {
    Gui, TopBar:Destroy
	Gui, BottomBar:Destroy
}

