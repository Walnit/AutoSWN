if (Test-Path "~/.swnconfig" -PathType Leaf) {
	$GOOGLE_TEST_OUTPUT = curl.exe -s http://google.com | out-string
	if ($GOOGLE_TEST_OUTPUT.contains("login.swn.moe.edu.sg")) {
		echo "Not signed in!"
		$CONFIG_CONTENT = Get-Content ~/.swnconfig
		$USERNAME = $CONFIG_CONTENT[0]
		$PASSWORD = $CONFIG_CONTENT[1]
		$GOOGLE_TEST_OUTPUT -match 'https:\/\/.{50}'
		$LOGIN_URL = $Matches[0]
		curl.exe -s $LOGIN_URL --ssl-revoke-best-effort -s
		$LOGIN_URL -match '\?.{16}'
		$MAGIC = ($Matches[0])[-16..-1] -join ''
		curl.exe --data-urlencode username=$USERNAME --data-urlencode password=$PASSWORD --data-urlencode magic=$MAGIC $LOGIN_URL --ssl-revoke-best-effort -s
	} else {
		echo "Signed in!"
	}
} else {
	echo "You have not configured AutoSWN! I will now open the configuration file at '$env:USERPROFILE\.swnconfig'." 
	echo "The first line should be your username, and the second line should be your password."
	echo "For example,"
	echo "<in .swnconfig>"
	echo "AH_BOY@STUDENTS.EDU.SG"
	echo "P@s5w0rd123!"
	pause
	New-Item -Path $env:USERPROFILE\.swnconfig -ItemType File
	notepad $env:USERPROFILE\.swnconfig
}
