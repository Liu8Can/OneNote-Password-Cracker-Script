; 设置密码字典文件路径
passwordFile := "D:\Documents\AutoHotkey\passwords.txt" ; 这里填写你的password.txt文件路径

; 设置OneNote密码输入窗口的标题
windowTitle := "保护的分区" ; 这是你提到的窗口名

; 读取密码字典文件
FileRead, passwords, %passwordFile%

; 检查文件是否成功读取
if (ErrorLevel) {
    MsgBox, 16, 错误, 无法读取密码文件。
    ExitApp
}

; 固定ToolTip位置
xPos := 500  ; X轴坐标
yPos := 300  ; Y轴坐标

; 分割文件中的每一行作为一个密码尝试
Loop, parse, passwords, `n, `r
{
    ; 去除每行开头和结尾的空格
    password := Trim(A_LoopField)
    
    ; 跳过空行或无效行
    if (password = "") 
        continue

    ; 显示正在尝试的密码，ToolTip会在固定位置显示
    ToolTip, 正在尝试密码：%password%, %xPos%, %yPos%

    ; 激活OneNote窗口并输入密码
    IfWinExist, %windowTitle%
    {
        WinActivate ; 激活窗口
        Send, %password% ; 输入密码
        Send, {Enter} ; 按下回车键

        ; 等待几秒钟看是否成功
        Sleep, 200 ; 等待0.2秒

        ; 判断密码是否成功
        ; 如果窗口消失，认为密码正确
        IfWinNotExist, %windowTitle%
        {
            ToolTip, 找到密码：%password%, %xPos%, %yPos% ; 显示找到的密码
            MsgBox, 找到密码：%password% ; 弹窗显示密码
            FileAppend, 找到密码：%password%`n, D:\Documents\AutoHotkey\found_password.txt ; 将密码保存到文件
            ExitApp ; 找到密码后退出脚本
        }
    }
    else {
        MsgBox, 找不到窗口 "%windowTitle%"。请检查窗口标题。
        ExitApp
    }
}

ToolTip ; 关闭ToolTip窗口
ExitApp
