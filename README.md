# AHK
AHK는 Auto Hot Key 라는 이름으로, 윈도우 상에서 자동화 작업을 용이하게 해주는 도구입니다.  
* GUI기반의 매크로 프로그램보다는 사용법이 복잡하지만,  
* 다른 프로그래밍언어 수준의 자동화 툴보다는 사용하기 쉽고,  
* 명령어 문법이 인간언어(영어)와 유사하여 초심자 접근성이 좋습니다.  

수작업이 많은 프로젝트에 있어서, 반복되는 작업 부분을 쪼갠 뒤 각기의 핫키로 지정하여 부분적으로 활용하면서 넘어가거나, 
혹은 자동화 진행 후 멈추어 기다리도록 해두고 수동 작업을 속계하여 마친 후 자동화를 계속 루프하는 등의 활용도 가능합니다.  

AHK는 오랜 기간 수많은 그룹들에 의해 개조되거나 파편화/통폐합을 거쳐왔어서 다양한 버젼과 솔루션이 존재합니다.  
다운로드 및 사용시에 자잘한 바이러스 및 악성코드를 유의하여 사용하시기 바랍니다.  
Global 공식 사이트는 autohotkey.com 이고 인스톨러 등 바이너리를 공식사이트에서 받아야 클린한 사용이 가능합니다.  

사용자 질답란 및 포럼도 같은 사이트에서 운영되고 있으며, stackoverflow 에서도 랭귀지 일종으로 취급되어 활발한 질답란이 가동됩니다.  
한국어 컨텐츠를 모아놓은 많은 한국 사이트들도 있으나, 파편화되어 있는 상황에서 굳건한 공식 사이트가 희미한 상태이므로, 
본진의 영어 컨텐츠를 보는 것을 추천합니다.  

## 사용법 
AHK를 사용하는 방법은 크게 두가지입니다.  
* AHK를 설치한 뒤 사용하기.  
* 컴파일된 실행파일(exe)만 받아 사용하기.  

작업 스크립트(매크로)를 작성하거나 수정해가며 사용해야한다면 AHK 본체를 설치 후 사용해야 합니다.  
AHK 스크립트는 일반 텍스트 파일로 작성한 뒤 확장자를 ```*.ahk```로 저장하게 되는데,  
디버깅 후 완성된 스크립트를 컴파일하게 되면 exe 실행파일이 됩니다.  
exe 파일을 타인의 컴퓨터에 가져가 실행하면 시스템 tray에 아이콘으로 등록되어 사용 가능한 상태가 됩니다.  
실행파일만 받아서 사용하는 사용자 측 컴퓨터에는 AHK 본체를 설치할 필요가 전혀 없는 편리함이 있지만, 
스크립트를 수정하여 사용하고 싶어도 수정이 불가능하다는 단점이 있습니다.  

참고 | 스샷
|---|---|
작성된 스크립트 (확장자 ahk) 파일을 실행하거나 (설치 필요) 혹은 컴파일된 실행파일(확장자 exe)을 받아 실행하면, 윈도우 화면 우하단 시스템 트레이에 녹색 H자 아이콘으로 자리 잡습니다. | ![image](https://user-images.githubusercontent.com/49431924/192215298-f6c2635d-d6ce-4d9d-9c96-a626d4d7043e.png)

* 트레이 아이콘의 색상 등으로 상태를 알 수 있습니다. 
  * 녹색H : 정상. / 녹색S : 핫키 동작 안함(suspend). / 붉은 색 : 잠시 중지(Pause). / 노랑 등 : 에러
* 여러개의 각기 ahk들을 실행하면 각자의 녹색H 아이콘으로 띄워집니다.  
  * 여러개 각기의 아이콘에 마우스 커서를 올려놓으면 파일 이름을 알려주므로 구분이 가능합니다.  
* 트레이 아이콘에서 오른쪽 버튼을 누르면 AHK 매크로를 제어하는 메뉴가 나옵니다.  
  * Reload는 누르면 모든 동작을 멈추고 (취소됨) 처음 상태로 다시 시작됩니다.  
  * Pause는 스크립트의 실행 흐름을 멈추고 기다리도록 합니다.  
  * Suspend는 스크립트 실행 흐름을 방해하지 않으나, 등록된 핫키가 잠시 동작하지 않습니다.  
    * 예를 들어 win+1 눌릴 때의 핫키가 정의된 스크립트 및 루프는 실행중이나, suspend 중에는 win+1키를 눌러도 핫키 기작은 없으며, 원래의 윈도우즈에서 win+1이 눌렸을 때 기본 동작이 발생됩니다.  
* 메뉴에서 Exit를 누르면 모든게 종료되고 ahk가 사라집니다.  
* 참고로, 본원에서 작성하는 대부분의 ahk 스크립트에서 win+s 키를 ahk 제어 핫키로 사용합니다.  
  * 자동화 기능 진행이 이상하게 꼬인 경우 win+s와 r을 빠르게 눌러 리셋시키거나 wind+s와 x를 눌러 종료 가능합니다.  

## 주의할 점 
* 버젼 
AHK에는 다양한 버젼들이 존재해 왔고, 버젼별로 문법 및 안티패턴이 조금씩 다를 수 있습니다.  
타인이 작성한 스크립트에 오픈 마인드로 다가가면 새로운 문법을 익히고 과거형 안티패턴을 줄일 수 있습니다.  
* 주석 
스크립트 소스에서 어느 위치에서든 세미콜론(;)이 나오게 되면 그로부터 행끝까지는 "주석"으로 인식됩니다.  
많은 경우 행 자체를 세미콜론으로 시작하여 코드를 설명하는 문장을 쓰게 되기도 하며,  
짜여진 코드 맨 뒤에 세미콜론을 붙인 뒤 문장을 서술하여, 앞쪽 코드를 설명하기도 합니다.  
AHK는 동양어권 문자열 (CJK) 처리에 약한 면모가 있어서, 코드와 같은 행 끝에 한국어 주석을 붙이면 오류가 나기도 합니다.  
* ANSI 저장
아직도 utf8 등 유니코드 인코딩이 지원되지 않습니다. 윈도우즈 연동 한계점이기도 하니, 코드에 되도록 한글을 쓰지 않아야 합니다.  
한글이 포함된 텍스트 파일은 반드시 앤시 방식(ANSI) 인코딩으로 저장해야 문제없이 인식됩니다.  

## 예제 AHK 스크립트  
아래 내용을 텍스트 파일로 저장하면서 이름을 "ahktest.ahk"로 저장하면 사용이 가능합니다.  
```
;AHK test code; Send(key) guide: ctrl=^, alt=!, shift=+, winkey=#. ex: alt+win+z will be "!#z"
SetTitleMatchMode, 2
CoordMode, Mouse, Client
;-------------------------------------------------------------------------------------------------
#s::
  Menu, Tray, Show
  Return
;-------------------------------------------------------------------------------------------------
#c::
 ;To disable "cotana" and replace with "mouse click" on current position.
  Click ; calling "click" with no args will make a mouse click at current mouse cursor.
  TrayTip, AHK example, "Mouse click sent!"
  Return

```
스크립트 코드의 설명은 아래와 같습니다.  
* ```;AHK test code; Send(key) guide: ctrl=^, alt=!, shift=+, winkey=#. ex: alt+win+z will be "!#z"```
  * 세미콜론으로 시작되었으니 기계 입장에서 실행할 것이 없음. 사람 보기 위한 send 함수 사용법 요약.  
* ```SetTitleMatchMode, 2```
  * 자동화 작업에서 대상 윈도우 창을 찾을 때에, 일부 문자열만 지정해도 찾아지는 모드(2번)를 설정함.  
* ```CoordMode, Mouse, Client```
  * 마우스 포인터 관련 기능 실행할 때에 기준 범위를 "client" 모드로 설정.  
* ```#s::```  
  * 단축키를 앞에 쓰고 뒤에 콜론 두개를 쓴 "단축키 정의" 블록이 시작됨.  
* ```Menu, Tray, Show```  
  * 윈도우키와 s키 조합이 눌리면 "Menu"라는 함수가 실행되는데, 더이상 복잡한 대상이나 메뉴리소스가 없으므로 AHK 트레이 아이콘 자신을 대상으로, 메뉴를 show하는 기능만 실행되도록 하는 코드.  
* ```Return```  
  * 원하는 동작을 모두 했으므로 단축키 종료(return). 첫째 단축키 정의 블록이 끝났음.  
* ```#c::```  
  * 윈도우키와 c키 조합이 눌려졌을 때의 "단툭키 정의" 블록이 시작됨.  
* ```;To disable "cotana" and replace with "mouse click" on current position.```  
  * 해당 핫키의 의미 및 상황 등을 설명한 인간 문장 (주석)
* ```Click ; calling "click" with no args will make a mouse click at current mouse cursor.```  
  * 실행할 함수는 "Click"으로 단순히 끝. 뒤에 세미콜론 이후 문장을 사람을 위한 주석 문장.  
* ```TrayTip, AHK example, "Mouse click sent!"```
  * 윈도우 툴팁(트레이 쪽 토스트 메시지)으로 마우스 클릭이 눌렸다는 메시지를 출력함.  
* ```Return```  
  * 원하는 동작을 모두 했으므로 단축키 종료(return). 둘째 단축키 정의 블록이 끝났음.  

위 스크립트를 실행하여 트레이에 녹색H 아이콘이 떠있다면, 두가지 핫키가 등록되어 사용 가능하게 됩니다.  
윈도우키와 s를 누르면 ahk 설정 메뉴가 뜨게 됩니다. 윈도우키와 c를 누르면 현재 마우스 커서 자리에 그대로 "클릭"을 한 효과가 납니다. (마우스에 손을 대지 않고 키보드만으로 클릭을 하는 핫키)  
