;Global hot key settings for MIRL. ; ctrl=^, alt=!, shift=+, win=#, for example "ctrl + alt + v" definition(::) will start with "^!v::"
SetTitleMatchMode, 2               ; SetTitleMatchMode arg meaning 1:start, 2:inside, 3:exact

#s::
 ;This code will show AHK itself's menu. Important cuz the script will be paused by this key, and we can "reload" to reset AHK.
  Menu, Tray, Show
  ;Menu, Tray, Click, 4 ;Click 4th menu (maybe "reload")
  Return

#m::
 ;To disable "global minimize key" and replace with "mouse click" on current position.
  Click
  Return

{F1}::
 ;To disable anoying help keys as F1 everywhere.
  TrayTip, F1Disabler, "You pressed F1 in vain."

MButton::
 ;Mouse middle button (wheel press) will be remapped as {Enter} key.
  Send, {enter}
  Return

#1::
 ;Replace WIN key number combo.
  MsgBox, Hello
  Return

#2::
 ;Replace WIN key number combo.
  SetTitleMatchMode, 2
  WinActivate, ahk_exe Explorer.EXE
  Send, {lwin}
  Return

#3::
 ;Replace WIN key number combo.
  CoordMode, Mouse, Client
  mouspeed1 = 10 ;fast
  mouspeed2 = 30 ;slow
  WinActivate, Chrome
  MouseClick, left,   80, 280, 1, mouspeed1 		;click
  Sleep, 1000
  MouseClickDrag, left, 100, 200, 500, 600, mouspeed1 	;drag
  Return

#4::
 ;Replace WIN key number combo.
  Return

#5::
 ;Replace WIN key number combo.
  Return
