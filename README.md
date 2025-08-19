# acode-terminal-chsh

这是一个适用于 [Acode](https://github.com/Acode-Foundation/Acode) 内置终端的登录shell切换工具。

## 原理
Acode 终端使用的 Alpine Linux 容器相当精简，它没有自己的 login 程序，而是直接用 bash 当作 login，而在容器初始化脚本中，/bin/bash 这个路径是硬编码的。初始化脚本每次进入APP创建第一个终端时都会重新生成，因此我们无法更改初始化流程。

chsh 通过备份并删除 /bin/bash，然后将别的 shell 软链接到 /bin/bash 来改变登录 shell，注意选用的 shell 必须要在 /etc/shells 中有定义。

我没怎么学过 shell，所以可能写的很烂，但是能用。

## 安装及使用

在开始之前，确保你已经成功安装 Acode Terminal。

目标：复制 chsh 到 /data/data/com.foxdebug.acode/files/alpine/bin/chsh，并给予可执行权限。

Step.1
用 Acode 打开 chsh 文件，然后然后另存到 **Terminal Home**。

Step.2
打开 Acode Terminal，运行如下命令：
```bash
mv ~/chsh /bin/chsh && chmod +x /bin/chsh && rm ~/chsh
```

这时运行 `chsh`，你应该会看到：
```bash
Usage:
  chsh <shell_name>
  chsh [-p | --path] <shell_path>

Example: chsh zsh
```

假设你安装了 zsh，那么，运行 `chsh zsh`，再打开新的终端进程，将会登录到 zsh

## 支持的版本

[Acode 1.11.6-beta.2](https://github.com/Acode-Foundation/Acode/releases/tag/v1.11.6-beta.2)

## 警告

- 仅供支持的 Acode 版本使用，不要在其它的终端（如 Termux）中使用这个脚本。

- 除非你非常了解 Acode 版本变化，并且明白它们意味着什么，否则永远不要假定这个脚本能在未经测试的版本上正常运行。

如果不遵循以上两点，运行 chsh 很可能会损坏你的环境。
