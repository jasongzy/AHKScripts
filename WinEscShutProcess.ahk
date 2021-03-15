; Win+Esc强制结束当前进程
#Esc::
    WinGetActiveTitle, Title
    WinGet, winpid, pid, %Title%
    ; WinKill, ahk_pid %winpid%
    ; Run, taskkill /pid %winpid% -t -f,, Hide
    Process, Close, %winpid%
return
