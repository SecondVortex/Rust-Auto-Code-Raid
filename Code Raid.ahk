#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Line := 1

;Gui

	;Title
	Gui, Font, s25 cWhite
	Gui, Add, Text, x200 y20, Rust Code Raid Script
	
	;Text
	Gui, Font, S7 cWhite
	Gui, Add, Text, x220 y70, Welcome to FirstVortex's Rust Code Raiding Script 
	Gui, Add, Text, x300 y85, Main Menu Bind = F11
	Gui, Add, Text, x300 y100, Open GUI Bind = F10
	;Buttons
	Gui, Font, s10 w1000, Cwhite, 
	Gui, Add, Button, x260 y140 w70 h60 g2Close, Close
	Gui, Add, Button, x360 y140 w70 h60 gSet_Line_Num, Set Line number
	Gui, Add, Button, x310 y220 w70 h60 gHide, Hide

	;Create
	Gui, +AlwaysOnTop -MinimizeBox
	Gui, Color, Black
	Gui, Show, w700 h300 x200 y50,Code Raid Script

F9::
	FileReadLine, Current_Code, Assets\Codes.txt, %Line%
	;MsgBox, line %Line%, Code %Current_Code% 
	OutputArray := StrSplit(Current_Code) 
	;MsgBox, % OutputArray.3
	
	Send, % OutputArray[1]
	Gosub, Randomizer
	Sleep, %Delay%
	Send, % OutputArray[2]
	Gosub, Randomizer
	Sleep, %Delay%
	Send, % OutputArray[3]
	Gosub, Randomizer
	Sleep, %Delay%
	Send, % OutputArray[4]
	Gosub, Randomizer
	Sleep, %Delay%
	Send {Enter}
	Line +=1
	return
	
;Set line number
Set_Line_Num:
	InputBox, Line, Set Starting line number
	Return
	
F10::
	LC1_Line := Line-1
	LC2_Line := Line-2
	LC3_Line := Line-3
	FileReadLine, last_Code1, Assets\Codes.txt, %LC1_Line%
	FileReadLine, last_Code2, Assets\Codes.txt, %LC2_Line%
	FileReadLine, last_Code3, Assets\Codes.txt, %LC3_Line%
	MsgBox, 0, Current Info, Line %Line%`, Last Code's %Last_Code1%`, %Last_Code2%`, %Last_Code3%, 10
	Return
	
^+F9::Exitapp
Hide:
	
2Close:
	MsgBox, 0, Exit, Last Line %Line%, 5
	Exitapp
	Return
Randomizer:
Random, Delay, 20, 60
Return
