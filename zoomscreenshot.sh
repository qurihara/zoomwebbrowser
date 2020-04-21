#!/bin/sh
TEST=`cat path.txt`
echo "$TEST"
osascript screenshot.scpt
mv screenshot.jpg "$TEST"
osascript reset-video.scpt
