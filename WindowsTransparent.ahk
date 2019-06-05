#T:: ;Win+T 切换当前窗口置顶
WinGetActiveTitle, winactivetitle
WinSet, AlwaysOnTop,, %winactivetitle%
return

;Win+鼠标滚轮调整窗口透明度（设置35-255的不透明度，低于35基本上就看不见了，如需要可自行修改）
;Win+滚轮下滑：减少不透明度，一次20
;Win+滚轮上滑：增加不透明度，一次20
;Win+中键按下：恢复不透明度至255(完全不透明)
;
#WheelUp::
;不透明度增加
WinGet, Transparent, Transparent,A
If (Transparent="")
    Transparent=255
Transparent_New:=Transparent+20    ;不透明度增加速度
If (Transparent_New > 254)
    Transparent_New =255
WinSet,Transparent,%Transparent_New%,A
tooltip now: %Transparent_New%/255    ;查看当前不透明度（操作后）
;sleep 1500
;tooltip
SetTimer, RemoveToolTip, 1500
return
;
#WheelDown::
;不透明度减小
WinGet, Transparent, Transparent,A
If (Transparent="")
    Transparent=255
Transparent_New:=Transparent-20   ;不透明度减小速度
If (Transparent_New < 35)    ;最小不透明度限制
    Transparent_New = 35
WinSet,Transparent,%Transparent_New%,A
tooltip now: %Transparent_New%/255    ;查看当前不透明度（操作后）
;sleep 1500
;tooltip
SetTimer, RemoveToolTip, 1500
return
;
;恢复不透明度到255
#Mbutton:: 
WinGet, Transparent, Transparent,A
WinSet,Transparent,255,A 
tooltip Restored 255/255   ;查看当前不透明度（操作后）  
;sleep 1500
;tooltip
SetTimer, RemoveToolTip, 1500
return
;
RemoveToolTip:    ;label
tooltip
SetTimer, RemoveToolTip, Off
return
