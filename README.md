>Languages: 
>
> ☑ 简体中文 
>
> ☐ [English](https://github.com/blanhhy/acode-terminal-chsh/blob/main/README_en.md)

# acode-terminal-chsh

这是一个适用于 [Acode](https://github.com/Acode-Foundation/Acode) 内置终端的登录shell切换工具。

> 注：受制于 acode 的限制和我的 shell 水平，旧版本可能写的很烂

## 安装及使用

在开始之前，确保你已经成功安装 Acode Terminal。

在 Acode Terminal 中运行如下命令：
```bash
apk add git
git clone https://github.com/blanhhy/acode-terminal-chsh.git
cd acode-terminal-chsh && bash install.sh
```

然后运行 `chsh`，你应该会看到：
```bash
Usage: chsh <shell_name>
Change the login shell.
```

假设你安装了 fish，那么，运行 `chsh fish`，再打开新的终端进程，将会登录到 fish

## 支持的版本

[Acode 1.11.6](https://github.com/Acode-Foundation/Acode/releases/tag/v1.11.6) 正式版及其所有 beta 测试版

[Acode 1.11.7 beta2](https://github.com/Acode-Foundation/Acode/releases/tag/v1.11.7-beta.2)
> 能运行但不建议使用 1.11.7 beta1，因为这个版本的 initrc 有明显 bug

## 警告

- 仅供支持的 Acode 版本使用，不要在其它的终端（如 Termux）中使用这个脚本。

- 除非你非常了解 Acode 版本变化，并且明白它们意味着什么，否则永远不要假定这个脚本能在未经测试的版本上正常运行。

如果不遵循以上两点，运行 chsh 很可能会损坏你的环境。此外，在贸然更换版本前最好备份终端数据。
