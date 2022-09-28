;AHK hot key settings.    ; Send(key) guide: ctrl=^, alt=!, shift=+, winkey=#. ex: alt+win+z will be "!#z"
igap1 := 100, igap2 := 400 ; Global variables for "delay gap" used on "Sleep func"
SetTitleMatchMode, 2       ; SetTitleMatchMode arg means... 1:start, 2:inside, 3:exact
CoordMode, Mouse, Client ; CoordMode arg means... full Screen, this Window, only Client ...
;기본 윈도우키+s 단축키는 Search 관련 기능이나, AHK로 아래 핫키 대체.
;-------------------------------------------------------------------------------------------------
#s::
;AHK 매크로 진행을 잠시 중단하고 AHK 제어 메뉴를 띄우는 키. 매크로 동작이 잘못되고 있거나 매크로를 수정하였을 때에 
;  본 핫키로 Reload를 선택 (즉, "윈키+s"누른 후 R을누름). 참고: 한글 포함 ahk 소스는 텍스트형식을 ANSI로 저장해야 함.
  Menu, Tray, Show
 ;AHK명령어 Menu Tray는 복잡다양하나, 윗행처럼 아무 인자없이 show를 부르면 AHK 핫키 스스로의 메뉴를 띄움.
  Return
;_-_- Please Edit from below. (for CJK double-byte, must save this text file as ANSI mode especially on MS-Windows.) -_-_

;파일 설명: ITK-snap 사용중 메뉴-File-Export-Slice_Axial로 저장 대화창을 띄워 파일명 지정하는 작업의 단순화 도움. v.0.98.

;원래 윈도우 기능에서, 윈도우키와 숫자1을 누르면 TaskBar 첫째 항목을 클릭하는 기능이나, 아래 핫키로 대체 진행.
;-------------------------------------------------------------------------------------------------
#1::
;핫키 설명: ITK-snap 사용중, 시작 부분에서 본 핫키를 누르면 파일이름 끝에 _b를 붙여 스냅샷을 저장하도록 도움.
theProgram := "ahk_exe ITK-SNAP.exe"
IfWinNotExist, %theProgram%
{
  TrayTip, AHK Auto1, No %theProgram%
  return
}
else
{
  WinActivate, Segmentation
}
Sleep, igap1
Click, 90, 220 ; axial coord number box.
Sleep, igap1
Send, ^a^c ; select all(^a=ctrl+a), copy to clipboard(^c=ctrl+c).
Sleep, igap1
Click, 20, 10  ; click menu "File"
Sleep, igap2
SetKeyDelay, 5
Send, {Down 5} ; menu "Export" (arrow key down * 5 times)
Send, {RIght 2}{Enter} ; "Image Slice > Axial"
theWinName := "Save"
WinWait, Save,, 5
IfWinNotExist, %theWinName%
{
  TrayTip, AHK Auto1, No "Save" dialog.
  return
}
else
{
  WinActivate ; Pop to top the window found by above IfWinNotExist.
}
WinMove, Save,, 300, 80
Send, %clipboard%
Send, _b{Home}
Sleep, igap1
Return

;-------------------------------------------------------------------------------------------------
#2::
;핫키 설명: ITK-snap 사용중, 끝 부분에서 본 핫키를 누르면 파일이름 끝에 _e를 붙여 스냅샷을 저장하도록 도움.
theProgram := "ahk_exe ITK-SNAP.exe"
IfWinNotExist, %theProgram%
{
  TrayTip, AHK Auto1, No %theProgram%
  return
}
else
{
  WinActivate, Segmentation
}
Sleep, igap1
Click, 90, 220 ; axial coord number box.
Sleep, igap1
Send, ^a^c ; select all(^a=ctrl+a), copy to clipboard(^c=ctrl+c).
Sleep, igap1
Click, 20, 10  ; click menu "File"
Sleep, igap2
SetKeyDelay, 5
Send, {Down 5} ; menu "Export" (arrow key down * 5 times)
Send, {RIght 2}{Enter} ; "Image Slice > Axial"
theWinName := "Save"
WinWait, Save,, 5
IfWinNotExist, %theWinName%
{
  TrayTip, AHK Auto1, No "Save" dialog.
  return
}
else
{
  WinActivate ; Pop to top the window found by above IfWinNotExist.
}
WinMove, Save,, 300, 80
Send, %clipboard%
Send, _e{Home}
Sleep, igap1
Return

;-------------------------------------------------------------------------------------------------
#3::
;핫키 설명: ITK-snap 사용중, 한 케이스(볼륨) 끝내고 새이미지로드(ctrl+g)에서 다음 케이스로 넘어가는 단축키.
theProgram := "ahk_exe ITK-SNAP.exe"
IfWinNotExist, %theProgram%
{
  TrayTip, AHK Auto1, No %theProgram%
  return
}
else
{
  WinActivate, Segmentation
}
SetKeyDelay, 5
Sleep, igap1
Send, ^g            ; bring dialog box "open main image" (^g=ctrl+g)
Sleep, igap2
Send, {Tab}{Enter}  ; press "browse" button
Sleep, igap1
Send, +{Tab}{Backspace}{Backspace} ; "focus to file view, go back back to parent folder."
Sleep, igap1
Send, {Down}{Enter} ; "next folder, go into."
Sleep, igap1
Send, {Up}t1{Enter} ; keyboard type "t1" to locate the folder, and enter.
Sleep, igap1
Send, {PgDn}{Enter} ; choose target file and "enter".
Sleep, igap1
Send, {Tab}{Tab}{Tab}{Enter} ; focus "Next" and "enter".
Sleep, igap1
Send, {Enter} ; enter for "Next".
Sleep, igap2
Send, {Enter} ; enter for "Next".
Sleep, igap1
Send, {Enter} ; enter for "Next".

;-------------------------------------------------------------------------------------------------
#c::
 ;To disable "cotana" and replace with "mouse click" on current position.
  Click
  Return
