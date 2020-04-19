# Zoom Web Browser

You can use your virtual background of zoom.us as a web browser.
It renders the first page of the specified web site, with refreshed periodicaly if you want.
This means you can make your virtual background dynamic. Build your background with your favorite web design technologies.

It works on mac terminals.

VS_COVID19

## how to use

Make sure that the Chrome browser is installed in your mac.

$ git clone https://github.com/qurihara/zoomwebbrowser.git

$ cd zoomwebbrowser

$ brew install fswatch

Do the following proccess once.

$ ./init.sh

Then run zoom.us and add "example.jpeg" in this folder as a virtual background. Do not edit the existing backgrounds.
This process tells the system the full path of the back ground image used in zoom.us.

Then run the system during a meeting when your video is on by:

$ ./zoomwebbrowser_1.sh (url)

It takes a snapshot of (url) and refreshes your background with it. This is one time command.
Give a permission to the scripts when asked.

Or

$ ./zoomwebbrowser.sh (url) (seconds-to-refresh)

It takes a snapshot of (url) and refreshes your background with it every (seconds-to-refresh) seconds.
Give a permission to the scripts when asked.
I think you need at least 10 seconds or so for each refresh. Otherwise You'll get annoyed.
Press ctrl+c to stop.

Examples:

$ ./zoomwebbrowser.sh https://qurihara.github.io/zoomwebbrowser/type.html?t=I%20agree%F0%9F%91%8D

$ ./zoomwebbrowser.sh https://www.chartjs.org/samples/latest/charts/doughnut.html 10

# Special Thanks

To Ken Wakita [https://twitter.com/kwakita] for helpful advice🙂
