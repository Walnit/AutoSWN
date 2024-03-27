# AutoSWN
Automatic sign-in for Singapore's MOE's SWN@SSOE network.

## What is AutoSWN?
AutoSWN is a bash script that will sign you into the SWN@SSOE network. It uses cURL to post the required data to sign in to the network.  
Ideally, you should run this script every time you connect to SWN@SSOE for you to be signed into the network. You could hook it to your network manager or something similar...

## How to run
### Windows
- In the Windows search box, search for "Powershell". Run it as administrator.
- Run these commands by copying and pasting them into the terminal that opens up (there will be a prompt to change Execution Policy, answer Y):
``` 
if (Test-Path -Path ~/Desktop) {
  $DESKTOP_PATH = "$env:USERPROFILE\Desktop"
} else {
  $DESKTOP_PATH = "$env:USERPROFILE\OneDrive\Desktop"
}
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
curl.exe https://raw.githubusercontent.com/Walnit/AutoSWN/main/swn.ps1 | out-string | Out-File -FilePath "$DESKTOP_PATH\AutoSWN.ps1"
Unblock-File -Path "$DESKTOP_PATH\AutoSWN.ps1"
```
- A file named `AutoSWN.ps1` should appear on your desktop. To run the file, you can right click and choose "Run with Powershell" to run.
- Follow the instructions when you first run the file to set up authentication.
### Linux
- From the files above, download `swn.sh`.
- Ensure `curl`, `sed` and `bash` are installed.
- Create a file named `.swnconfig` in your home directory. The first line of your file should be your username (usually XXXXX@STUDENTS.EDU.SG), and the second line should be your password.
- Download `swn.sh` and make it executable.
- `./swn.sh`  

If you want this for Mac, install Linux instead >:)
