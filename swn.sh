#! /bin/bash
if [ -f ~/.swnconfig ]; then
	while :; do
		if curl http://google.com -s | grep -q 'login.swn.moe.edu.sg';
		then
			echo "Not signed in!"
			USERNAME=$(sed -n 1p ~/.swnconfig)
			PASSWORD=$(sed -n 2p ~/.swnconfig)
			echo "Using username $USERNAME and password $PASSWORD"
			GOOGLE_OUTPUT=$(curl -s http://google.com)
			kREGEX_URL='https:\/\/.{50}'
			[[ "${GOOGLE_OUTPUT}" =~ $kREGEX_URL ]]
			LOGIN_URL=$(echo ${BASH_REMATCH})
			curl -s ${BASH_REMATCH} > /dev/null
			kREGEX_MAGIC='\?.{16}'
			[[ "${GOOGLE_OUTPUT}" =~ $kREGEX_MAGIC ]]
			MAGIC=$(echo ${BASH_REMATCH} | cut -c 2-)
			curl --data-urlencode username=$USERNAME --data-urlencode password=$PASSWORD --data-urlencode magic=$MAGIC $LOGIN_URL 
		else 
			echo "Signed in!"
			break
		fi 
	done
else
	echo "~/.swnconfig not found! Please create a file name .swnconfig with the first line being your username, and second line being the password."
	echo "For example,"
	echo "AH_BOY@STUDENTS.EDU.SG"
	echo "P@\$5w0rd123!"
fi
