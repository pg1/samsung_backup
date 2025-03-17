# Samsung phone backup using command line
This is a shell script that I wrote to backup a Samsung galaxy which stuck in boot loop after One UI 6.1.
If you have a samsung phone which stuck in reboot mode this script can help you recover your data. 

## Here is how to use it
* Step 1: If you don't have it install [adb](https://developer.android.com/tools/adb)
* Step 2: Connect your phone using an USB cable
* Step 3: Enable [developer option](https://developer.android.com/studio/debug/dev-options#enable) on your phone and give permission on your device
* Step 4: Run **adb shell find /storage/ -name "*.jpg" > file.list** (Use *.mp4 to get videos or . for any other files)
* Step 5: Edit file.list and remove files that you don't want to backup
* Step 6: Run **./run.sh** command
