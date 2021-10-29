#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

InputBox, Line, Line Number, What Line number Would you like to start at?

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

F10::
	MsgBox, Line %Line%
	Return
	
^+F9::Exitapp

Randomizer:
Random, Delay, 20, 60
Return