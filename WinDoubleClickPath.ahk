#LButton:: ;Win+左键双击打开鼠标所指进程的路径
if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 300) ; 检测双击
{
MouseGetPos,,, winuid
WinGet, winpath, ProcessPath, ahk_id %winuid%
; WinGet, winname, ProcessName, ahk_id %winuid%
; WinGetTitle, wintitle, ahk_id %winuid%
;
; StringGetPos, pos, winpath, \, R
; StringTrimRight, winpath, winpath, StrLen(winpath)-pos-1
;clipboard = %winpath%
; tooltip copied path of %winname%
; sleep 1000
; tooltip
Run explorer /select`, %winpath%
}
return
;
;特别地，在Notepad2-mod中Win+左键双击会打开当前文件的路径
#IfWinActive ahk_class Notepad2U
#LButton::
if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 300) ; 检测双击
{
WinGetActiveTitle, notetitle
StringSplit, notepath, notetitle, :
;处理文件目录
IfInString, notepath2, - Notepad2-mod (管理员)
    StringTrimRight, notepath2, notepath2, 6
StringTrimRight, notepath2, notepath2, 16
StringRight, disk, notepath1, 1
notepath2= %disk%:%notepath2%`\
;处理文件名
IfInString, notepath1, *
    StringTrimLeft, notepath1, notepath1, 2
StringTrimRight, notepath1, notepath1, 3
notepath= %notepath2%%notepath1%
Run explorer /select`, %notepath%
}
return
#IfWinActive ahk_class Notepad2
#LButton::
if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 300) ; 检测双击
{
WinGetActiveTitle, notetitle
StringSplit, notepath, notetitle, :
;处理文件目录
IfInString, notepath2, - Notepad2-mod (管理员)
    StringTrimRight, notepath2, notepath2, 6
StringTrimRight, notepath2, notepath2, 16
StringRight, disk, notepath1, 1
notepath2= %disk%:%notepath2%`\
;处理文件名
IfInString, notepath1, *
    StringTrimLeft, notepath1, notepath1, 2
StringTrimRight, notepath1, notepath1, 3
notepath= %notepath2%%notepath1%
Run explorer /select`, %notepath%
}
return
#IfWinActive
