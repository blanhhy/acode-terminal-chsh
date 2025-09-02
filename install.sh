# 如果之前安装过 chsh，先恢复为 bash
if command -v chsh 1>/dev/null; then
	chsh bash || exit 1
fi


# 移动脚本文件
mv -f ./script/login.sh /bin/real_login && chmod 755 /bin/real_login
mv -f ./script/chsh.sh /bin/chsh && chmod 755 /bin/chsh


# 备份 bash
if [ ! -f /bin/real_bash ]; then
	[ ! -f /bin/bash ] && echo "bad environment"; exit 1
	mv -f /bin/bash /bin/real_bash
	chmod 755 /bin/real_bash
fi

cp -lf /bin/real_login /bin/bash

echo "Seccessfully installed."