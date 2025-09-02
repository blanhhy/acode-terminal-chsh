#!/bin/sh

# 展示 motd
show_motd() {
    if [ ! -f ~/.hushlogin ] && [ -z "$ACODE_HUSHLOGIN" ]; then
		if [ -x /etc/motd.sh ]; then
			/etc/motd.sh
		elif [ -f /etc/motd ]; then
			/bin/cat /etc/motd
		fi
	else
		unset ACODE_HUSHLOGIN
	fi
}


# 选择合适的 shell 作为登录 shell
if [ -L "$HOME/.local/login/shell" ]; then
	export SHELL=$(realpath "$HOME/.local/login/shell")
else
	for file in /bin/real_bash /bin/sh /system/bin/sh; do
		if [ -x $file ]; then
			export SHELL=$file
			break
		fi
	done
fi


# 区分登录与非登录情形
if [ -n "$TERM" -a -z $IS_LOGINED ]; then
	show_motd # 仅在登录时展示 motd
	export IS_LOGINED="logined"; readonly IS_LOGINED
	exec "$SHELL" -l "$@"
else
	exec "$SHELL" "$@"
fi
