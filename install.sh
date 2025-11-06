# Is the acode version 1.11.7 or above
if [ -f /initrc ]; then
	cd "acode_1.11.7"
	source "./install.sh"
else
	cd "acode_1.11.6"
	source "./install.sh"
fi
