#!/bin/sh
# 已测试版本：1.11.6

# 必须由root用户运行，防止意外
if [ "$(id -u)" -ne 0 ]; then
    echo "chsh: Error: Must run as root" >&2
    exit 1
fi


# 显示帮助信息
show_usage() {
    echo "Usage: chsh <shell_name>"
	echo "Change the login shell."
    exit 1
}


# 设置 shell
set_shell () {
	local NEW_SHELL="/bin/$1"
	# 验证shell是否在/etc/shells中
	if ! grep -qFx $NEW_SHELL /etc/shells ; then
		echo "chsh: Error: '$NEW_SHELL' is not a valid login shell" >&2
		echo "chsh: see all valid shells in /etc/shells" >&2
		exit 1
	fi
	# 验证 shell 是否是可执行文件
	if [ ! -x $NEW_SHELL || -d $NEW_SHELL ]; then
		echo "chsh: Error: '$NEW_SHELL' is not an executable file" >&2
		exit 1
	fi
	mkdir -p ~/.local/login
	ln -sf $NEW_SHELL ~/.local/login/shell
	echo "changed to $1 ($NEW_SHELL)"
}



case "$1" in
	"") show_usage;;
	bash) set_shell real_bash;;
	*) set_shell $1;;
esac