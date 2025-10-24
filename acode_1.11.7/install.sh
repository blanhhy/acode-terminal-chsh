# If installed, skip.
if command -v chsh 1>/dev/null; then
	echo "Already installed."
	exit 1
fi

# Copy script source code.
cp -f ./src/chsh.sh /bin/chsh && chmod 755 /bin/chsh

# Inject login logic and separate profile features.
echo '# Display MOTD if available
if [ -x /etc/motd.sh ]; then
    bash /etc/motd.sh
elif [ -s /etc/motd ]; then
    cat /etc/motd
elif [ -s /etc/acode_motd ]; then
    cat /etc/acode_motd
fi


# Use a niser promopt
PS1="\n\033[1;33m\u\033[0m in \033[1;36m\w\033[0m at \033[2;37m\t\n\033[1;32m➜\033[0m  "


# Select a login shell
if [ -L "$HOME/.local/login/shell" ]; then
	export SHELL=$(realpath "$HOME/.local/login/shell")
else
	for file in /bin/bash /bin/sh /system/bin/sh; do
		[ -x $file ] || chmod u+x $file
		export SHELL=$file
		break
	done
fi

# login with selected shell
exec "$SHELL" -l "$@"' > /initrc

echo 'export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/share/bin:/usr/share/sbin:/usr/local/bin:/usr/local/sbin"

export HOME=/home 
export TERM=xterm-256color 

export PIP_BREAK_SYSTEM_PACKAGES=1

for script in /etc/profile.d/*.sh ; do
	if [ -r "$script" ] ; then
		. "$script"
	fi
done
unset script' > /etc/profile

# Ensure bash profile loading properly.
touch ~/.bash_profile
echo '[ -f ~/.bashrc ] && source ~/.bashrc' >> ~/.bash_profile

echo "Seccessfully installed."
