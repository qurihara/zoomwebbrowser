#!/bin/sh
if [ $# -ne 1 ]; then
        echo "requires 1 argument: URL to show
        example: # ./zoom_bg_browser_1.sh https://www.yahoo.co.jp"
        exit 1
fi
echo "URL: $1"

TEST=`cat path.txt`
echo "$TEST"
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --screenshot --window-size=1920,1080 $1
mv screenshot.png "$TEST"
osascript reset-video.scpt
