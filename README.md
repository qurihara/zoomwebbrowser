# Zoom Web Browser

![text-e]( https://qurihara.github.io/zoomwebbrowser/img/text-e.png)
![text]( https://qurihara.github.io/zoomwebbrowser/img/text.png)
![chart]( https://qurihara.github.io/zoomwebbrowser/img/chart.png)
![browse]( https://qurihara.github.io/zoomwebbrowser/img/browse.png)


English description is below.

Zoom Web BrowserはZoomのバーチャル背景をwebブラウザとして使用し、指定したウェブサイトを表示するツールです。
要するに、バーチャル背景を時間的に変化するものにすることができ、しかもそのデザインには慣れ親しんだwebデザインの技術が使えるということです。

Zoomは会議のホストなら画面共有によってどんなものでも写すことができますが、それ以外の一般参加者には選択肢は乏しいです。たとえば「🙂」「⛔️」のようなエモティコンを表示したり、「賛成です」のような簡単なテキストを表示したり、自分に関する状態・情報をグラフや写真で示したりと、バーチャル背景をハックできれば、もっと遠隔コミュニケーションは豊かになることでしょう。そのような取り組みをいろいろ試すのはきっと意味のあることだと思い、本ツールを試作しました。

動的に変化するマルチメディアコンテンツを扱う最も良い仕組みは何かと考え、webコンテンツを扱うwebブラウザの着想を得ました。
しくみとしては、指定したURLのwebサイトをヘッドレスChromeブラウザで開き、そのスナップショット画像を取得し、Zoomの背景画像として差し替え、キーボードオートメーションにより瞬間的に背景をOff→Onして再読み込みし更新、というものです。
クイックハックなので、mac専用で、CUIしかなく、更新頻度も現実的にはせいぜい10秒に１度程度と、それほど高くできません。
皆さんとともに使い方を考えたり、よりよい実装にしていきたいです。

リモートワークでZoomを使う機会が増えました。皆さん快適なビデオチャットライフを。  VS_COVID19

課題・TODOs：
* 更新するときキーボード入力をシステムが代行してキーボードショートカットを発動しているので、その間ユーザのキーボード操作が邪魔される
* Chromeのスナップショット取得の縦横比が適当
* 定期的に画像を更新するたび、ブラウザをリロードしてスナップショットを取っている。一度開いたwebサイトの継続的なスナップショットではない。
* 現在CUIだがGUIがほしい
* Windows版がほしい

## English

You can use your virtual background of zoom.us as a web browser.
It renders the first page of the specified web site, with refreshed periodicaly if you want.
This means you can make your virtual background dynamic. Build your background with your favorite web design technologies.

It works on mac terminals.

VS_COVID19

## How to use

Make sure that the Chrome browser is installed in your mac.

$ git clone https://github.com/qurihara/zoomwebbrowser.git

$ cd zoomwebbrowser

$ brew install fswatch

Do the following proccess once.

$ ./init.sh

Then run zoom.us and add "example.jpeg" in this folder as a virtual background. Do not edit the existing backgrounds.
This process tells the system the full path of the back ground image used in zoom.us.

Then run the system during a meeting when your video is on by:

$ ./zoomwebbrowser.sh (url)

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
