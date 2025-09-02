#!/bin/sh
# 已测试版本：1.11.6

# 必须由root用户运行，防止意外
if [ "$(id -u)" -ne 0 ]; then
    echo "chsh: Error: Must run as root" >&2
    exit 126
fi


# 显示帮助信息
show_usage() {
    echo "Usage: chsh <shell_name>"
	echo "Change the login shell."
    exit 2
}


# 设置 shell
set_shell () {
	local NEW_SHELL=$(grep "/bin/$1" /etc/shells)
	
	if [ -z "$NEW_SHELL" ]; then
		echo "chsh: Error: '$NEW_SHELL' is not a valid login shell" >&2
		echo "chsh: see all valid shells in /etc/shells" >&2
		exit 1
	fi
	
	if [ -d $NEW_SHELL ]; then
		echo "chsh: Error: '$NEW_SHELL' is a directory" >&2
		exit 1
	fi
	
	[ -x $NEW_SHELL ] || chmod u+x $NEW_SHELL
	
	mkdir -p ~/.local/login
	ln -sf $NEW_SHELL ~/.local/login/shell
	echo "changed to $1 ($NEW_SHELL)"
}


# 重置为默认
reset() {
	local DEFAULT="/bin/real_bash"
	if [ ! -f $DEFAULT -o ! -f "$(realpath $DEFAULT)" ]; then
		echo "chsh: Fatal: '$DEFAULT' is broken" >&2
		exit 128
	fi
	rm -f ~/.local/login/shell
	echo "changed to bash ($DEFAULT)"
}


case "$1" in
	"") show_usage;;
	bash) reset;;
	*) set_shell $1;;
esac