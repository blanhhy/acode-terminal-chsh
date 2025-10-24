#!/bin/sh

# 如果已经登录过，只需履行bash的职责
if [ -n "$LOGIN_COMPLETED" ]; then
	exec /bin/real_bash "$@"
fi


# 展示 motd
if [ ! -f $HOME/.hushlogin ] && [ -z "$ACODE_HUSHLOGIN" ]; then
	if [ -x /etc/motd.sh ]; then
		/etc/motd.sh
	elif [ -f /etc/motd ]; then
		/bin/cat /etc/motd
	fi
else
	unset ACODE_HUSHLOGIN
fi


# 选择合适的 shell 作为登录 shell
if [ -L "$HOME/.local/login/shell" ]; then
	export SHELL=$(realpath "$HOME/.local/login/shell")
else
	for file in /bin/real_bash /bin/sh /system/bin/sh; do
		[ -x $file ] || chmod u+x $file
		export SHELL=$file
		break
	done
fi


export LOGIN_COMPLETED="true"
readonly LOGIN_COMPLETED


# 区分登录与非登录情形
if [ -n "$TERM" ]; then
	exec "$SHELL" -l "$@"
else
	exec "$SHELL" "$@"
fi
