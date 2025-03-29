#!/bin/bash

for i in `cat file.list`
	do
		FILE_NAME=$(basename "data/$i")
		#echo $i
		if [ -f "$FILE_NAME" ]; then
			echo "File exists: $FILE_NAME"
		else
			adb pull $i data/.
		fi
done