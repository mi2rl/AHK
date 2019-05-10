;AHK macro. Hot key settings for MIRL. ;ctrl=^, alt=!, shift=+
;레이블링. 가이드라인 없애고 풀스크린 만드는 핫키. 빈 마스크 레이어들을 "C-F, T-F, L-F" 이름으로 생성하는 핫키 등.
zx := 0 	;글로벌 변수 초기화. (하지만 딱히 초기화할 필요가 없기도 함.)
zy := 0
zsThisAhkName := "Aview4Trauma"
zsSavePath := ""
zsMaskFolderName := "Mask_DataSet"

#s::	;원래 윈도우 기능에서, 윈도우키와 s를 누르면 Search 관련 기능일 수 있으나, 본 핫키로 대채하게 됨.
 ;AHK의 매크로를 잠시 중단하고 AHK제어 메뉴를 띄움. 매크로 동작이 잘못되고 있거나 매크로를 수정하였을 때에 주로 Reload를 선택함. (즉, 윈키+s누른후R누르기)
  Menu, Tray, Show 	;AHK명령어 Menu Tray는 복잡다양한 구성으로 동작할 수 있으나, 아무 인자없이 show를 부르면 AHK 핫키 스스로의 메뉴를 띄움.
  Return

#IfWinActive, ahk_exe AView2010.exe ; 이하 핫키들은 Aview가 포커스일 때에만 동작함.

#1::	;원래 윈도우 기능에서, 윈도우키와 숫자1을 누르면 TaskBar 첫째 항목을 클릭하는 기능이나, 본 핫키로 대채하게 됨.
 ;메뉴 View에서 가이드라인 없앰, 주작업창을 Full, Preset을 Bone, 작업용 마스크 이름을 자동 생성.
  BlockInput, MouseMove		;핫키 동작 중에 마우스를 잠금.
  CoordMode, Mouse, Window 	;마우스 관련 동작의 기준점을 Aview 창 내부로 설정.

  WinActivate, AView		;Aview창을 최상단으로 활성화.
  Send, {esc}			;다른 대화창이 떠있거나 포커스가 잡혀 있을까봐 일단 ESC 키를 눌러 해제함.
  MouseMove, 100, 10, 5		;Aview 프로그램 타이틀바 제목 위치로 마우스 커서를 이동함.
  ;윗행의 MouseMove에 이어 아래행 MouseClick을 하는 기작은 실은 MouseClick(좌표 지정) 한 행으로도 가능하나, 휴먼퍼셉션 및 디버그의 편의성을 위해 분리했음.
  MouseClick,  left		;타이틀바를 한번 클릭하는 이유는, 메인메뉴 단축키를 확실하게 입력시키기 위한 안전장치임.
  Send, !v			;메인메뉴의 단축키인 Alt+V를 눌러 View 항목을 띄움.
  Sleep, 100			;0.1초 대기. 시스템이 느린 경우 약간의 딜레이가 필요함.
  Send, g			;View메뉴 안에서 GuideLine을 토글하는 키는 "g"만 눌러도 실행되므로 g키를 침.

  WinGetPos, zx, zy, zw, zh, AView	;주작업창의 위치를 찾음.
  if (zx = "")			;안찾아지면 종료.
  {
    BlockInput, MouseMoveOff	;종료전 마우스 잠금 풀기.
    Return
  }
  zx := (zw/2)			;주작업창 내부 클릭을 위해 가운데 위치를 추산함.
  ;아래 행의 ControlGetPos는 Mask Control의 위치를 찾기 위함. 사지탈 작업용. 사지탈 이외 작업자 AHK에서는 commentout할것.
  ControlGetPos, zx, zy, zw, zh, Mask Control, AView	;우측 마스크콘트롤 위치를 찾음.
  if (zx = "")			;안찾아지면 종료.
  {
    BlockInput, MouseMoveOff	;종료전 마우스 잠금 풀기.
    Return
  }
  MouseMove, zx-300, zy+300, 5	;찾아진 위치에서 적정 픽셀 좌측하단 이동하여 주작업 편집창에 마우스를 이동함.
  Click, right			;마우스 오른쪽 버튼을 클릭하여 콘텍스트메뉴를 띄움.
  Send, {down}{right}{enter}	;콘텍스트 메뉴의 첫번째(down키) 메뉴를 옆으로(right) 펼쳐서 나온 첫번째 메뉴인 Full screen을 실행(enter)함.
  BlockInput, MouseMoveOff	;종료전 마우스 잠금 풀기.
  Return

#2::
  BlockInput, MouseMove		;핫키 동작 중에 마우스를 잠금.
  SetTitleMatchMode, 1		;WinGetPos 로 찾을 때에 시작 문자열 포함 방식.
  CoordMode, Mouse, Window 	;마우스 관련 동작의 기준점을 Aview 창 내부로 설정.
  Send, {esc}			;다른 대화창이 떠있거나 포커스가 잡혀 있을까봐 일단 ESC 키를 눌러 해제함.
  WinGetPos, zx, zy, zw, zh, AView	;Aview 프로그램 창의 위치를 찾아냄.
  if (zx = "")			;안찾아지면 종료.
  {
    BlockInput, MouseMoveOff	;종료전 마우스 잠금 풀기.
    Return
  }
;msgbox,1:%zx%,%zy%,%zw%,%zh%
  zx := (zw/2)			;주작업창 위치를 추산하기 위해 창 크기의 절반을 계산함.
  MouseMove, zx-300, zy+300, 5	;적정 픽셀을 이동하여 주작업 편집창에 마우스를 이동함.
  Click, right			;마우스 오른쪽 버튼을 클릭하여 콘텍스트메뉴를 띄움.
  Sleep, 100			;0.1초 대기. 시스템이 느린 경우 약간의 딜레이가 필요함.
  Send, {up}{up}{up}{right}	;콘텍스트 메뉴에서 preset
  Sleep, 100			;0.1초 대기. 시스템이 느린 경우 약간의 딜레이가 필요함.
  Send, {up}{up}{enter}		;콘텍스트 메뉴에서 bone

  ControlGetPos, zx, zy, zw, zh, Mask Control, AView
  if (zx = "")			;마스크콘트롤을 찾음. 없으면 종료.
  {
    MsgBox, Can't find mask control window.
    BlockInput, MouseMoveOff	;종료전 마우스 잠금 풀기.
    Return
  }
  MouseMove, zx+10, zy+10, 5	;찾아진 마스크콘트롤의 뿌리위치(좌상단 코너)에서 10 픽셀씩 우측하단을 노려 클릭하기 위해 이동함.
  MouseClick,  left		;클릭하여 포커스를 줌

  WinGetClass, zClass, A	;활성화된 윈도우의 클래스명을 알아냄.
  MouseGetPos, zx, zy, zWin, zControl, 1	;마우스 위치의 콘트롤을 알아냄.
  ControlGetText, zText, %zControl%, ahk_class %zClass%	;콘트롤의 이름을 알아냄.
  if (zText <> "Mask Control")	;Mask control이 최상 콘트롤이 아니면 종료
  {
    MsgBox, Can't find mask control window.
    BlockInput, MouseMoveOff	;종료전 마우스 잠금 풀기.
    Return
  }
  ;아래 행의 ControlGetPos 마지막 두개의 인자는 AView 화면 내에 title label이 &(앰퍼센드에 의해 밑줄이 붙음)Create인 버튼의 위치를 찾기 위함.
  ControlGetPos, zx, zy, zw, zh, &Create, AView
  if (zx = "")			;안찾아지면 종료.
  {
    BlockInput, MouseMoveOff	;종료전 마우스 잠금 풀기.
    Return
  }
  MouseMove, zx+10, zy+10, 5	;찾아진 Create 비튼 뿌리위치(좌상단 코너)에서 10 픽셀씩 우측하단을 노려 클릭하기 위해 이동함.
  MouseClick,  left		;버튼을 누름. (위에 말했듯이, MouseClick(좌표) 1행으로 해결 가능하나, 어떤 편의성을 위해 2행으로 코딩함.)
  Sleep, 500			;마스크를 생성하는 대화창이 뜨기를 잠시 기다려 줌.
  Send, 10000{tab}	;키보드입력 포커스가 가 있는 LowerBound 입력란에 숫자 일만을 입력하고 tab키를 눌러 다음 입력칸으로 이동함.
  Sleep, 300
  Send, 10000{tab}	;UpperBound 입력란에 숫자 일만을 입력하고 tab키를 눌러 다음 입력칸으로 이동함.
  Sleep, 300
  Send, C-F{enter}	;마스크 이름 입력란에 적절한 이름을 입력하고 enter를 누르면 대화창이 닫히면서 마스크가 생성됨.
;  Send, Th{enter}	;마스크 이름 입력란에 적절한 이름을 입력하고 enter를 누르면 대화창이 닫히면서 마스크가 생성됨.
;  Send, P{enter}	;마스크 이름 입력란에 적절한 이름을 입력하고 enter를 누르면 대화창이 닫히면서 마스크가 생성됨.
  Sleep, 500
  
  MouseClick,  left
  Sleep, 500
  Send, 10000{tab}	;키보드입력 포커스가 가 있는 LowerBound 입력란에 숫자 일만을 입력하고 tab키를 눌러 다음 입력칸으로 이동함.
  Sleep, 300
  Send, 10000{tab}	;UpperBound 입력란에 숫자 일만을 입력하고 tab키를 눌러 다음 입력칸으로 이동함.
  Sleep, 300
  Send, T-F{enter}	;마스크 이름 입력란에 적절한 이름을 입력하고 enter를 누르면 대화창이 닫히면서 마스크가 생성됨.
  Sleep, 500
  
  MouseClick,  left
  Sleep, 500
  Send, 10000{tab}	;키보드입력 포커스가 가 있는 LowerBound 입력란에 숫자 일만을 입력하고 tab키를 눌러 다음 입력칸으로 이동함.
  Sleep, 300
  Send, 10000{tab}	;UpperBound 입력란에 숫자 일만을 입력하고 tab키를 눌러 다음 입력칸으로 이동함.
  Sleep, 300
  Send, L-F{enter}	;마스크 이름 입력란에 적절한 이름을 입력하고 enter를 누르면 대화창이 닫히면서 마스크가 생성됨.
  Sleep, 500
  
  ControlGetPos, zx, zy, zw, zh, Mask Control, AView
  MouseClick,  left, zx+40, zy+75	;필요한 마스크를 만들었으니, MaskControl 위치에서 리스트 중 첫번째 마스크를 클릭하여 선택함.
  BlockInput, MouseMoveOff	;종료전 마우스 잠금 풀기.
  Return

!0::	;Save to path 설정을 위한 핫키
 ;Save to current path 기능을 ahk로 구성해봄
  ;InputBox, zsSavePath, Path setting, Enter save path
  CoordMode, Mouse, Window 	;마우스 관련 동작의 기준점을 Aview 창 내부로 설정.
  Send, {esc}			;다른 대화창이 떠있거나 포커스가 잡혀 있을까봐 일단 ESC 키를 눌러 해제함.
  MouseMove, 100, 10, 5		;Aview 프로그램 타이틀바 제목 위치로 마우스 커서를 이동함.
  ;윗행의 MouseMove에 이어 아래행 MouseClick을 하는 기작은 실은 MouseClick(좌표 지정) 한 행으로도 가능하나, 휴먼퍼셉션 및 디버그의 편의성을 위해 분리했음.
  MouseClick,  left		;타이틀바를 한번 클릭하는 이유는, 메인메뉴 단축키를 확실하게 입력시키기 위한 안전장치임.
  Send, !f			;메인메뉴의 단축키인 Alt+F를 눌러 File 항목을 띄움.
  Sleep, 100			;0.1초 대기.
  Send, l			;load 선택
  Sleep, 500			;0.5초 대기.
  Send, {esc}			;
  Sleep, 100			;0.1초 대기.
  Send, ^c			;
  zsSavePath := clipboard

  zsSavePath := zsSavePath . "\" . zsMaskFolderName	;"\Mask_DataSet"
  if !FileExist(zsSavePath)
  {
MsgBox, make: %zsSavePath%
    FileCreateDir, zsSavePath
MsgBox, %ErrorLevel%
  }
  if !InStr(FileExist(zsSavePath), "D")
  {
    MsgBox, Path unavailable
  }

  BlockInput, MouseMoveOff	;종료전 마우스 잠금 풀기.
  Return

!9::	;Save to path 활용을 위한 핫키
  if !InStr(FileExist(zsSavePath), "D")
  {
    MsgBox, Path unavailable
    Return
  }		;마스크콘트롤을 찾아봄. 없으면 종료.
  Sleep, 300
  Send, !d
  Sleep, 300
  Send, %zsSavePath%{enter}
  Sleep, 300
  Send, {tab}{tab}{tab}!n
  BlockInput, MouseMoveOff	;종료전 마우스 잠금 풀기.
  Return

#IfWinActive ; 이하 핫키들은 AView뿐만 아니라 윈도우 전역에서 동작함.


#m::
 ;To disable "global minimize key" and replace with "mouse click" on current position.
  Click
  Return
