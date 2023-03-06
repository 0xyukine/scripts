#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd ) #Get working dir
START="00:00:10"
END="00:00:30"

echo $SCRIPT_DIR

for file in ${SCRIPT_DIR}/*
do
	if [[ $file == *.mp4 ]] #checks file ends in *.mp4
	then
		echo $(basename "$file") #removes working directory from filename
		ffmpeg -ss $START -to $END -i "$(basename "$file")" -vf "scale=1280:720" -b:v 2M "TRIM.$(basename "$file")" #cuts between timestamps and re-encodes at set resolution and bitrate
	fi
done