#SingleInstance, force
#NoEnv
SetBatchLines -1

;给快捷搜索使用，平常不启用
;每添加一个按键命令需要修改四处
;这是第一处
Hotkey, b, Off
Hotkey, g, Off
Hotkey, f, Off
Hotkey, q, Off
Hotkey, r, Off

CoordMode, Mouse, Screen ;指定鼠标坐标以屏幕为基准
a:=10 ;a=最多离开边缘多少像素
x:= "" ;鼠标位置获取变量x
y:= "" ;鼠标位置获取变量y
SetTimer, MouseHOVER, 250

MOUSEHOVER(){ ;鼠标位置函数调用
	global x,y,winId, ControlClass
	MouseGetPos, OutputVarX, OutputVarY
	x:=OutputVarX
	y:= OutputVarY
}

;_______[左边缘]_______
#If x<a && y>=a && y<A_ScreenHeight-(a+1)
;$MButton::
;return
;$WheelUp::
;return
;$WheelDown::
;return
#If

;_______[左上角]_______
#If x<a&&y<a
$MButton:: ;切换静音
Send {Volume_Mute}
return
$WheelUp:: ;增大音量
Send {Volume_Up}
return
$WheelDown:: ;减小音量
Send {Volume_Down}
return

;_______[上边缘]_______
#If x>=a && x<A_ScreenWidth-(a+1) && y<a
;$MButton::
;return
;$WheelUp::
;return
;$WheelDown::
;return
#If

;_______[右上角]_______
#If x>=A_ScreenWidth-(a+1) && y<a
;$MButton::
;return
;$WheelUp::
;return
;$WheelDown::
;return
#If

;_______[右边缘]_______
#If x>=A_ScreenWidth-(a+1) && y>=a && y<A_ScreenHeight-(a+1)
;$MButton::
;return
$WheelUp::
Send {PgUp}
return
$WheelDown::
Send {PgDn}
return
#If

;_______[右下角]_______
#If x>=A_ScreenWidth-(a+1) && y>=A_ScreenHeight-(a+1)
;$MButton::
;return
;$WheelUp::
;return
;$WheelDown::
;return
#If

;_______[下边缘]_______
#If x>=a && x<A_ScreenWidth-(a+1) && y>=A_ScreenHeight-(a+1)
$^MButton::
Send #{Tab}
return
$^WheelUp::
Send ^#{Left}
return
$^WheelDown::
Send ^#{Right}
return
#If

;_______[左下角]_______
#If x<a && y>=A_ScreenHeight-(a+1)
;$MButton::
;return
;$WheelUp::
;return
;$WheelDown::
;return
#If

;定义快捷搜索的各按键命令
;这是第二处
b:: Run https://www.baidu.com/s?wd=%clipboard%
g:: Run https://google.com/search?q=%clipboard%
f:: Run https://fanyi.baidu.com/translate?aldtype=16047&query=%clipboard%&keyfrom=baidu&smartresult=dict&lang=auto2zh
q::
UrlDownloadToFile, http://api.qrserver.com/v1/create-qr-code/?data=%clipboard%, C:\Windows\Temp\qrcode_ahk.png
Run C:\Windows\Temp\qrcode_ahk.png
;Sleep 2000
;FileDelete, C:\Windows\Temp\qrcode_ahk.png
return
r::
Run, %clipboard%,, UseErrorLevel
If (UseErrorLevel != 0)
    Msgbox,16 , Error, Wrong Command !
return

~^c::
if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 500) ; 检测双击
{
;这是第三处
Hotkey, b, On
Hotkey, g, On
Hotkey, f, On
Hotkey, q, On
Hotkey, r, On
;KeyWait, b, D T2
;If ErrorLevel = 0
;If (%A_ThisHotkey% = b)
Sleep 2000
;这是第四处
Hotkey, b, Off
Hotkey, g, Off
Hotkey, f, Off
Hotkey, q, Off
Hotkey, r, Off
}
return
