# AHKScripts

> 在具有管理员权限的窗口中生效，需要**以管理员身份运行** ahk 文件。

## [OneQuick.ahk](OneQuick.ahk)

参考了 [OneQuick](https://onequick.org/) 软件的部分功能及其[早期版本](https://github.com/OneQuick/OneQuick.AHK-legacy)的 AHK 实现方式。

此脚本重制了 OneQuick 的**屏幕边缘**操作和**复制快捷搜索**功能。

其中：

1. 屏幕边缘操作包括：**左上角**滚轮调整音量，中键切换静音；**下边缘**滚轮切换虚拟桌面，中键映射为 **Win+Tab**。其他区域（上下左右角/边缘共 8 个）均给出了判断条件，可自定义功能。

2. 复制快捷搜索功能的实现方式为：定义单个字母按键（如 B）为对剪贴板内容执行相应搜索功能的热键（同时屏蔽本身的字母输入），但默认关闭，直到连续两次按下 **Ctrl+C** （Ctrl 可松可不松）后开启上述所有热键，延迟 2 秒再次关闭所有热键。在 2 秒的延时内可以按下多个字母按键来进行多引擎搜索或处理。

`Q` 键调用了 [QR Code Generator](http://goqr.me/) 的 API，实现下载生成的二维码到本地临时文件夹，再打开此图片文件。

相较于 OneQuick，直接使用 AHK 脚本实现相应的功能具有低资源消耗、高响应速度、可定制性强等优势。

## [CapsLockPlus.ahk](CapsLockPlus.ahk)

从 [wo52616111/capslock-plus](https://github.com/wo52616111/capslock-plus) 及 [PatrickShieh/CapsLockPlus](https://github.com/PatrickShieh/CapsLockPlus) 处获得灵感。利用常常闲置的**大小写锁定键**精确控制鼠标（包括滚轮和中键）。

## [EscExplorer.ahk](EscExplorer.ahk)

Windows 原生不支持使用 ESC 键关闭单个资源管理器窗口。此脚本实现了当前台窗口为 Explorer 时将 ESC 映射为 **Ctrl+W**。

## [WinDoubleClickPath.ahk](WinDoubleClickPath.ahk)

Windows 查看某一进程对应的文件位置需要通过任务管理器。此脚本定义了 **Win+左键双击**在资源管理器中打开鼠标所指窗口的进程目录并自动选中相应文件。

特别地，由于 [Notepad2](https://notepad2.com) (mod) 没有打开当前文档所在目录的功能，故此脚本还设定了对于此软件，Win + 左键双击意味着打开当前文档所在的目录。

原理：对窗口标题进行字符串处理，故需要在软件内设置窗口标题为「显示文件名称与目录」。

## [WindowsTransparent.ahk](WindowsTransparent.ahk)

使用 **Win+滚轮**调整鼠标所指窗口的透明度，并有 tooltip 进行实时数值化提示。按中键还原。

设定了最低不透明度，使得窗口不会被彻底隐藏。

此外，还额外添加了 **Win+T** 对当前窗口进行切换置顶操作的功能。

## [WinEscShutProcess.ahk](WinEscShutProcess.ahk)

使用 **Win+Esc** 强制结束当前进程。根据激活窗口的 PID，使用 AHK 自带的函数实现。注释中也提到了另一种可行的实现方式：使用 Windows 的 `taskkill` 命令。
