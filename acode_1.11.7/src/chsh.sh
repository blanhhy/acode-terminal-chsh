#!/bin/sh
# 已测试版本：1.11.7 beta1, beta2

if [ "$(id -u)" -ne 0 ]; then
    echo "chsh: Error: Must run as root" >&2
    exit 126
fi


show_usage() {
    echo "Usage: chsh <shell_name>"
	echo "Change the login shell."
    exit 2
}


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


case "$1" in
	"") show_usage;;
	*) set_shell $1;;
esac