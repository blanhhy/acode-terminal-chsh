>Languages: 
>
> ☐ [简体中文](https://github.com/blanhhy/acode-terminal-chsh/blob/main/README.md)
>
> ☑ English

# acode-terminal-chsh

This is a tool to change the default login shell for [Acode](https://github.com/Acode-Foundation/Acode) built-in terminal.

> Note: Due to the limitations of acode and my shell skills, the old version may be poorly written.

## Installation & Usage

Before you begin, make sure you have installed the terminal successfully.

Run these commands in terminal:
```bash
apk add git
git clone https://github.com/blanhhy/acode-terminal-chsh.git
cd acode-terminal-chsh && bash install.sh
```


Then run `chsh`, you will see:
```bash
Usage: chsh <shell_name>
Change the login shell.
```

Supposing you have fish installed, run `chsh fish` and then start a new terminal session to use fish.

## Supported versions

[Acode 1.11.6](https://github.com/Acode-Foundation/Acode/releases/tag/v1.11.6) stable version and all beta versions

[Acode 1.11.7 beta2](https://github.com/Acode-Foundation/Acode/releases/tag/v1.11.7-beta.2)
> On 1.11.7 beta1 it'll work but I don't recommend, because the initrc file on this version has obvious bug.

## Warning

- Only for supported Acode versions. Do not use this script in other terminals (eg. Termux).

- Unless you are very familiar with the Acode version changes and understand what they mean, never assume that this script will work properly on an untested version.

If you don't follow these points, running chsh will likely damage your environment. Also, you'd better back up important data before updating or downgrading the app version.