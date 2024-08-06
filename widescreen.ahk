#Persistent
window := "ahk_class POEWindowClass"

#If WinActive(window) 
*F10::
	WinGetPos,,,, H, % window
	if (H = A_ScreenHeight) {
		WinMove, % window,,, A_ScreenHeight / 12,, (A_ScreenHeight/1.35) ; 1.35 is "zoom" modifier. If you get black bars on your game's sides, put it to 1.3, save & retest till satisfaction. double comma = skip parameter. Para order is X, Y, width, Height
		CreateBlackBars()
		
	}
    if not (H = A_ScreenHeight) {
        WinMove, % window,, 0, 0,, A_ScreenHeight
        RemoveBlackBars()
		
    }
return

CreateBlackBars() {
    global
    Gui, TopBar:New, +ToolWindow -caption
    Gui, TopBar:Color, 000000

	Gui, BottomBar:New, +ToolWindow -caption
    Gui, BottomBar:Color, 000000
	
	hs := A_ScreenHeight / 12
	he := A_ScreenHeight / 12 + 60
	hse := A_ScreenHeight * 10 / 12 - 10


    Gui, TopBar:Show, x0 y0 h%hs% w%A_ScreenWidth%, TopBar
    Gui, BottomBar:Show, x0 y%hse% h%he% w%A_ScreenWidth%, BottomBar
}

RemoveBlackBars() {
    Gui, TopBar:Destroy
	Gui, BottomBar:Destroy
}

