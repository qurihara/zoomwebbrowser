#!/bin/sh
if [ $# -eq 0 ]; then
        echo "./zoom_bg_browser.sh (url) (seconds-to-refresh)
        first argument: URL to show
        second argument (optional): refresh rate (seconds)
        example: # ./zoomwebbrowser.sh https://www.yahoo.co.jp 10"
        exit 1
fi

if [ $# -eq 1 ]; then
        echo "URL: $1"
        TEST=`cat path.txt`
        echo "$TEST"
        /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --screenshot --window-size=1920,1080 $1
        mv screenshot.png "$TEST"
        osascript reset-video.scpt
        exit 1
fi

if [ $# -eq 2 ]; then
        echo "URL: $1"
        echo "refresh rate: $2 second(s)"

        TEST=`cat path.txt`
        echo "$TEST"
        INTERVAL=$2
        while true; do
            /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --screenshot --window-size=1920,1080 $1
            mv screenshot.png "$TEST"
            osascript reset-video.scpt
            sleep $INTERVAL
        done
fi
