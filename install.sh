# Is the acode version 1.11.7 or above
if [ -f /initrc ]; then
	source "./acode_1.11.7/install.sh"
else
	source "./acode_1.11.6/install.sh"
fi
