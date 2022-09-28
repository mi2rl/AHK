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

;파일 설명: AHK sample. v.0.98.

zsThisAhkName := "Aview4Trauma"
;--------------------------------------------------------------------------------
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

#IfWinActive ; 이하 핫키들은 AView뿐만 아니라 윈도우 전역에서 동작함.


#c::
 ;To disable win10 "cotana" hotkey, and replace with "mouse click" on current position.
  Click
  Return
