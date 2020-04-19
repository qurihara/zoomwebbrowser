#!/bin/sh
echo Run zoom.us and add example.jpeg in this folder as a virtual background. Do not edit the existing backgrounds.
fswatch -r1 $HOME/Library/Application\ Support/zoom.us/data/VirtualBkgnd_Custom > ./path.txt
echo Initialization finished.
