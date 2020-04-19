#!/bin/sh
if [ $# -ne 2 ]; then
        echo "requires 2 arguments:
        first argument: refresh rate (seconds)
        second argument: URL to show
        example: # ./zoom_bg_browser.sh 10 https://www.yahoo.co.jp"
        exit 1
fi
echo "refresh rate: $1 second(s)"
echo "URL: $2"

TEST=`cat path.txt`
echo "$TEST"
INTERVAL=$1
while true; do
        /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --screenshot --window-size=1920,1080 $2
        mv screenshot.png "$TEST"
        osascript reset-video.scpt
        sleep $INTERVAL
done
