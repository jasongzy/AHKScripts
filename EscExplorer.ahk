; Esc关闭资源管理器
#IfWinActive ahk_class CabinetWClass
    Esc::
        ; Send {Esc}
        Send ^w
    return
#IfWinActive
