# AutoSWN
Automatic sign-in for Singapore's MOE's SWN@SSOE network.

## What is AutoSWN?
AutoSWN is a bash script that will sign you into the SWN@SSOE network. It uses cURL to post the required data to sign in to the network.  
Ideally, you should run this script every time you connect to SWN@SSOE for you to be signed into the network. You could hook it to your network manager or something similar...

## How to run
- Ensure `curl`, `sed` and `bash` are installed.
- Create a file named `.swnconfig` in your home directory. The first line of your file should be your username (usually XXXXX@STUDENTS.EDU.SG), and the second line should be your password.
- Download `swn.sh` and make it executable.
- `./swn.sh`  

I plan to make this work on Windows and Mac in the future. Stay tuned (or raise issues to remind me to do this).
