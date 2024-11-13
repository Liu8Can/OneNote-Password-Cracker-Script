# OneNote Password Cracker Script (AutoHotkey)

![License](https://img.shields.io/badge/license-MIT-green)
![AutoHotkey](https://img.shields.io/badge/AutoHotkey-v1.1-blue)

## 📚 项目简介

这是一个使用 **AutoHotkey v1.1** 编写的密码字典暴力破解脚本，旨在帮助用户通过提供的密码字典文件（`passwords.txt`）逐一尝试密码，解锁 **中文版 OneNote** 密码保护的分区。该脚本通过模拟输入密码并尝试解锁窗口的方式工作，并在找到密码时显示成功消息。**本项目仅适用于找回自己遗忘的密码，而非随机破解**

## 🔧 功能概述

- 从提供的 `passwords.txt` 文件中读取密码字典。
- 自动逐个输入密码，模拟 OneNote 密码输入过程。
- 在密码正确时，显示找到的密码，并将其保存到文件中。
- 支持固定位置的提示信息显示，避免 ToolTip 在屏幕上浮动。
- 在密码破解成功后，将密码保存至`found_password.txt`，后自动退出脚本。

## ⚙️ 系统要求

- **AutoHotkey v1.1**：这个脚本是针对 AutoHotkey v1.1 编写的。你可以从 [AutoHotkey 官网](https://www.autohotkey.com/) 下载并安装它。
- **Windows 操作系统**：脚本在 Windows 系统上运行。

## 📝 安装和使用

### 步骤 1：安装 AutoHotkey

1. 访问 [AutoHotkey 官网](https://www.autohotkey.com/)。
2. 下载并安装 AutoHotkey v1.1。
3. 安装完成后，你可以在系统中使用 `.ahk` 文件。

### 步骤 2：下载脚本

1. 将本项目的脚本文件下载到你的计算机，或者通过 GitHub 克隆本项目。

    ```bash
    git clone https://github.com/Liu8Can/OneNote-Password-Cracker-Script.git
    ```

2. 确保你已经准备好一个名为 `passwords.txt` 的密码字典文件，该文件应包含一行一个密码。（你可以通过`python`或[passwordtech](https://github.com/cthoeing/passwordtech)生成符合你要求的密码字典，当然GitHub中也有许多开源的密码库供你选择。）

    **重要提示：** 你需要自行提供密码字典文件（`passwords.txt`），其中应包含你希望尝试的所有密码。

    示例内容：

    ```
    123456
    password
    admin123
    mysecurepassword
    ```

### 步骤 3：配置密码字典文件

1. 打开 `passwords.txt` 文件，并将你要尝试的密码列表一行一个地添加进去。

2. 确保 `passwords.txt` 文件与脚本位于同一目录，或者在脚本中调整文件路径。

### 步骤 4：运行脚本

1. 双击运行 `OneNote_Password_Cracker.ahk` 文件，脚本将自动开始运行。(你需要提前再OneNote中打开密码输入窗口)
2. 脚本会自动检测并尝试每个密码，直到找到正确密码。

    - 当脚本找到正确密码时，它会显示一个消息框，并将密码写入 `found_password.txt` 文件。
    - 如果窗口标题不匹配，脚本会在弹出窗口中提示你检查窗口标题。

### 步骤 5：查看破解结果

1. 一旦脚本找到正确密码，它会将密码保存到 `found_password.txt` 文件中。
2. 你可以查看该文件，获取找到的密码。

## 🔍 脚本功能说明

- **密码字典文件（`passwords.txt`）**：该文件应包含你希望脚本尝试的所有密码。每个密码占一行。
- **密码输入窗口**：脚本会尝试激活名为 `保护的分区` 的窗口，并在该窗口中输入密码。你可以根据需要修改窗口标题。
- **ToolTip 显示**：当前密码的尝试过程会在屏幕上显示一个固定位置的提示信息（ToolTip），该位置可以自定义。
- **成功密码输出**：脚本会在找到密码后通过弹窗和日志文件输出正确的密码。

## ⚠️ 注意事项

- **仅适用于中文版 OneNote**：该脚本仅适用于 **中文版 OneNote**。如果你使用的是其他语言版本的 OneNote，可能无法正常工作。
- **密码字典**：你需要自行提供一个有效的密码字典文件（`passwords.txt`）。脚本将逐个尝试字典中的密码，直到找到正确的密码。
- **安全性**：这个脚本只适用于你自己拥有权限的 OneNote 文件。请勿用于未经授权的密码破解。
- **窗口标题**：脚本假设密码输入窗口的标题为 `保护的分区`，如果你的窗口标题不同，请根据实际情况修改脚本中的 `windowTitle` 变量。
- **密码字典大小**：密码字典的大小会影响脚本的执行时间。较大的字典文件会导致脚本执行较慢，请根据需要调整字典文件的大小。

## ❓ 常见问题

### 1. 脚本找不到窗口标题，怎么办？

请确保 OneNote 密码输入窗口的标题与脚本中设置的标题一致。如果窗口标题不同，请在脚本中修改 `windowTitle` 变量为实际的窗口标题。

### 2. 脚本一直没有成功，怎么办？

确保密码字典文件（`passwords.txt`）中的密码正确，并且包含了你可能使用的密码。脚本尝试的密码会按顺序逐个输入，如果字典中没有正确的密码，脚本将无法成功破解。

### 3. 脚本会不会影响系统性能？

由于脚本只是在后台运行，并且等待窗口出现，因此它对系统性能的影响非常小。

## 🤝 贡献

如果你有任何建议或发现了问题，欢迎提交 [Issues](https://github.com/your-username/OneNote-Password-Cracker/issues)，或者向项目提交 pull request。

## 📄 许可

此项目采用 [MIT 许可](LICENSE)。
