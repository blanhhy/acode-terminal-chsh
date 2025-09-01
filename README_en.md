>Languages: 
>
> ☐ [简体中文](https://github.com/blanhhy/acode-terminal-chsh/blob/main/README.md)
>
> ☑ English

# acode-terminal-chsh

This is a tool to change the default login shell for [Acode](https://github.com/Acode-Foundation/Acode) built-in terminal.

## How's it work?
The Alpine Linux container used by the Acode terminal is quite streamlined. It doesn't have its own login program, but symlinks /bin/bash to /bin/login instead. The path `/bin/bash` is hardcoded in the init-alpine.sh script. However, this script is regenerated each time the app creates the first terminal session, so to change the initialization process is improssible.

My chsh script changes the login shell by backing up and deleting /bin/bash, and then symlinking another shell to it. Note that the selected shell must be declared in /etc/shells.

I haven't learned much about shell, so it may be not good, but it works.

## Installation & Usage

Before you begin, make sure you have installed the terminal successfully.

Run these commands in terminal:
```bash
apk add git
git clone https://github.com/blanhhy/acode-terminal-chsh.git
mv acode-terminal-chsh/chsh /bin/ && chmod +x /bin/chsh && rm -rf acode-terminal-chsh
```

>or manually:
>
>Step.1
>Creat a new file in Acode editor, copy the source code of [chsh](https://github.com/blanhhy/acode-terminal-chsh/blob/main/chsh) to it (or download the source file and open it in the editor), and then save it to **Terminal Home** directory.
>
>Step.2
>Start the terminal, run this command:
>```bash
>mv ~/chsh /bin/chsh && chmod +x /bin/chsh
>```

Now run `chsh`, you will see:
```bash
Usage:
  chsh <shell_name>
  chsh [-p | --path] <shell_path>

Example: chsh zsh
```

Supposing you have zsh installed, run `chsh zsh` and then start a new terminal session to use zsh.

## Supported versions

[Acode 1.11.6](https://github.com/Acode-Foundation/Acode/releases/tag/v1.11.6) stable version and all beta versions

## Warning

- Only for supported Acode versions. Do not use this script in other terminals (eg. Termux).

- Unless you are very familiar with the Acode version changes and understand what they mean, never assume that this script will work properly on an untested version.

If you don't follow these points, running chsh will likely damage your environment. Also, you'd better back up important data before updating or downgrading the app version.