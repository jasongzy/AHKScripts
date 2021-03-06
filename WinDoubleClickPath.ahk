﻿; Win+左键双击打开鼠标所指进程的路径
#LButton::
    if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 300) ; 检测双击
    {
        MouseGetPos, , , winuid ; 若脚本无管理员权限，可能无法获取管理员窗口的uid
        ; 特别地，在Notepad3中Win+左键双击会打开当前文件的路径
        WinGetTitle, notetitle, ahk_id %winuid%
        WinGetClass, noteclass, ahk_id %winuid%
        if ((noteclass = "Notepad3U" || noteclass = "Notepad3") && RegExMatch(notetitle, "\[(.*?)\]", notepath1) != 0 && RegExMatch(notetitle, "(.*?)\[", notepath2) != 0)
            ; RegExMatch返回为0表示正则未匹配到字串，说明窗口标题类似“未命名 - Notepad3”（新建且尚未保存的文件）
        {
            ; 处理文件目录
            ; RegExMatch(notetitle, "\[(.*?)\]", notepath1)
            StringTrimLeft, notepath1, notepath1, 1
            StringTrimRight, notepath1, notepath1, 1
            StringRight, notepath1_end, notepath1, 1
            if (notepath1_end = "\") ; 以\结尾的路径一般出现在磁盘根目录
            {
                StringTrimRight, notepath1, notepath1, 1
            }
            ; 处理文件名
            ; RegExMatch(notetitle, "(.*?)\[", notepath2)
            StringLeft, notepath2_start, notepath2, 1
            if (notepath2_start = "*") ; 以*开头的文件名表示已修改、未保存的文件
            {
                StringTrimLeft, notepath2, notepath2, 2
            }
            StringTrimRight, notepath2, notepath2, 2
            notepath= %notepath1%`\%notepath2%
            ; MsgBox, %notepath%
            Run explorer /select`, %notepath%
            return
        }
        WinGet, winpath, ProcessPath, ahk_id %winuid%
        ; WinGet, winname, ProcessName, ahk_id %winuid%
        ; StringGetPos, pos, winpath, \, R
        ; StringTrimRight, winpath, winpath, StrLen(winpath)-pos-1
        ; clipboard = %winpath%
        ; tooltip copied path of %winname%
        ; sleep 1000
        ; tooltip
        Run explorer /select`, %winpath%
    }
return
