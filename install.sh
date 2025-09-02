# 如果之前安装过 chsh，先恢复为 bash
if command -v chsh 1>/dev/null; then
	chsh bash || exit 1
fi


# 移动脚本文件
mv -f ./script/login.sh /bin/real_login && chmod 755 /bin/real_login
mv -f ./script/chsh.sh /bin/chsh && chmod 755 /bin/chsh


# 备份 bash
if [ ! -f /bin/real_bash ]; then
	if [ ! -f /bin/bash ]; then
		echo "bad environment" >&2
		exit 1
	fi
	mv -f /bin/bash /bin/real_bash
	chmod 755 /bin/real_bash
fi

cp -lf /bin/real_login /bin/bash


# 裁剪配置文件
echo 'if [ -z "$PATH" ]; then
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
fi

export PAGER=less
umask 022

for script in /etc/profile.d/*.sh ; do
	if [ -r "$script" ] ; then
		. "$script"
	fi
done
unset script' > /etc/profile
echo '[ -f ~/.bashrc ] && source ~/.bashrc' >> ~/.bash_profile


echo "Seccessfully installed."