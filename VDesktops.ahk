#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3 ; Necessary to set exact process name matching
SetTitleMatchMode, Fast
DetectHiddenWindows, off
DetectHiddenText, off

#§:: sendevent {LWin down}{LCtrl down}{Right down}{LWin up}{LCtrl up}{Right up} ;Go to left virtual desktop
#Capslock:: sendevent {LWin down}{LCtrl down}{Left down}{Lwin up}{LCtrl up}{Left up} ;Go to right virtual desktop

; Cycle same exe windows
#d::NextWindow()	; Next Window
#a::PreviousWindow()	; Previous Window

; Cycle all windows
#s::CycleDown()
#w::CycleUp()


; TODO:
; Fix Clover conflict bug. Ignore explorer? 

CycleDown(){
	Send !{Esc}
}

CycleUp(){
	Send !+{Esc}
}


; TODO:
; Ignore windows on other virtual desktops

PreviousWindow(){
    ;WinGetClass, CurrentActive, A
	local CurrentActive, CurrentActiveClass, Instances
	WinGetClass, CurrentActiveClass, A
	WinGet, CurrentActive, ProcessName, A
	WinGet, Instances, Count, ahk_exe %CurrentActive% ahk_class %CurrentActiveClass%
	; MsgBox %CurrentActive% %Instances%
	If Instances > 1
		WinActivateBottom, ahk_exe %CurrentActive%
}

NextWindow(){
	local CurrentActive, CurrentActiveClass, Instances
	WinGetClass, CurrentActiveClass, A
	WinGet, CurrentActive, ProcessName, A
	WinGet, Instances, Count, ahk_exe %CurrentActive% ahk_class %CurrentActiveClass%
	; MsgBox %CurrentActive% %Instances%
	If Instances > 1
		WinSet, Bottom,, A
	WinActivate, ahk_exe %CurrentActive%
}

; TODO:
; Add hotkeys for sending to and switching to virtual desktops with number keys