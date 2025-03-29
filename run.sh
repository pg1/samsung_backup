#!/bin/bash

# Check if data directory exists and create it if not
DATAPATH="data"
if [ ! -d "$DATAPATH" ]; then
	echo "Data directory does not exist. Creating it now..."
	mkdir -p "$DATAPATH"
	echo "Directory created: $DATAPATH"
fi

# Check if file.list is created
if [ ! -f "file.list" ]; then
	echo "ERROR: file.list is missing."
	echo "- Create list using the following command: adb shell find /storage/ -name \"*.jpg\" > file.list"
	exit
fi

# Check if phone connected via ADB
if ! adb devices | grep -q "device$"; then
    echo -n "Please connect you phone."
    # Wait until phone is connected
	while ! adb devices | grep -q "device$"; do
		echo -n "."
		sleep 1
	done
fi

#Get all files from the phone
for i in `cat file.list`
	do
		FILE_NAME=$(basename "$DATAPATH/$i")
		#echo $i
		if [ -f "$DATAPATH/$FILE_NAME" ]; then
			echo "File exists: $FILE_NAME"
		else
			adb pull $i "$DATAPATH"/.
		fi
done