# Zoom Web Browser

<img src="https://qurihara.github.io/zoomwebbrowser/img/text-e.png" height=200><img src="https://qurihara.github.io/zoomwebbrowser/img/text.png" height=200><img src="https://qurihara.github.io/zoomwebbrowser/img/chart.png" height=200><img src="https://qurihara.github.io/zoomwebbrowser/img/browse.png" height=200>

English description is below.

Zoom Web BrowserはZoomのバーチャル背景をwebブラウザとして使用し、指定したウェブサイトを表示するツールです。
要するに、バーチャル背景を時間的に変化するものにすることができ、しかもそのデザインには慣れ親しんだwebデザインの技術が使えるということです。

Zoomは会議のホストなら画面共有によってどんなものでも写すことができますが、それ以外の一般参加者には選択肢は乏しいです。たとえば「🙂」「⛔️」のようなエモティコンを表示したり、「賛成です」のような簡単なテキストを表示したり、自分に関する状態・情報をグラフや写真で示したりと、バーチャル背景をハックできれば、もっと遠隔コミュニケーションは豊かになることでしょう。そのような取り組みをいろいろ試すのはきっと意味のあることだと思い、本ツールを試作しました。

動的に変化するマルチメディアコンテンツを扱う最も良い仕組みは何かと考え、webコンテンツを扱うwebブラウザの着想を得ました。
しくみとしては、指定したURLのwebサイトをヘッドレスChromeブラウザで開き、そのスナップショット画像を取得し、Zoomの背景画像として差し替え、キーボードオートメーションにより瞬間的に背景をOff→Onして再読み込みし更新、というものです。
クイックハックなので、mac専用で、CUIしかなく、更新頻度も現実的にはせいぜい10秒に１度程度と、それほど高くできません。
皆さんとともに使い方を考えたり、よりよい実装にしていきたいです。

リモートワークでZoomを使う機会が増えました。皆さん快適なビデオチャットライフを。  VS_COVID19

### 追記：任意のwindowのスクリーンショットを取ってzoomの背景にするスクリプトzoomscreenshot.shも追加しました。いきなりwebブラウザのコンセプトから外れてすみません！

課題・TODOs：
* 更新するときキーボード入力をシステムが代行してキーボードショートカットを発動しているので、その間ユーザのキーボード操作が邪魔される
* Chromeのスナップショット取得の縦横比が適当
* 定期的に画像を更新するたび、ブラウザをリロードしてスナップショットを取っている。一度開いたwebサイトの継続的なスナップショットではない。
* 匿名でのブラウジングなので、ログインしないといけないようなサイトは未対応。
* スナップショットをとるタイミングは適当なので、サイト読み込みが不完全なことがある。
* 現在CUIだがGUIがほしい
* Windows版がほしい

## English

You can use your virtual background of zoom.us as a web browser.
It renders the first page of the specified web site, with refreshed periodically if you want.
This means you can make your virtual background dynamic. Build your background with your favorite web design technologies.

It works on mac terminals.

VS_COVID19

## How to use 使い方　（written in both English and Japanese)

Make sure that the Chrome browser is installed in your mac.　Chromeブラウザがインストールされていることを確認してください。

Do this in a terminal. ターミナルで以下を実行してください。

$ git clone https://github.com/qurihara/zoomwebbrowser.git

$ cd zoomwebbrowser

$ brew install fswatch

Do the following proccess once. 以下を一度だけ実行してください。

$ ./init.sh

Then run zoom.us and add "example.jpeg" in this folder as a virtual background. Do not edit the existing backgrounds.
This process tells the system the full path of the back ground image used in zoom.us.　そしてzoom.usを立ち上げ、このフォルダの中にあるexample.jpegをバーチャル背景として追加してください。すでにあるバーチャル背景画像はいじらないでください。このプロセスにより、システムは現在選択されているバーチャル背景の画像のフルパスを知ることができます。

Then run the system during a meeting when your video is on by:　zoomミーティング中でビデオがOnになっている時、以下を実行します：

$ ./zoomwebbrowser.sh (url)

It takes a snapshot of (url) and refreshes your background with it. This is one time command. Give a permission to the scripts when asked. これにより(url)で指定されたwebサイトのスナップショットがzoomの背景になります。もし実行権限がないと警告されたら、権限を付与してください。

Or　あるいは

$ ./zoomwebbrowser.sh (url) (seconds-to-refresh)

It takes a snapshot of (url) and refreshes your background with it every (seconds-to-refresh) seconds. Give a permission to the scripts when asked. これにより(url)で指定されたwebサイトのスナップショットがzoomの背景になります。さらに(seconds-to-refresh)秒ごとにブラウザをリロードして背景の更新を繰り返します。もし実行権限がないと警告されたら、権限を付与してください。

I think you need at least 10 seconds or so for each refresh. Otherwise You'll get annoyed. Press ctrl+c to stop. おそらく最低１０秒以上の間隔で実行しないと、いらいらすることになると思います。 ctrl+cでプログラムを中断します。

Examples: 使い方の例：

Display "I agree👍". You can rewrite any text with a parameter t in the url:　背景に「I agree👍」と表示します。URLのt=のあとに好きなテキストを入れればそれが表示されます：

$ ./zoomwebbrowser.sh https://qurihara.github.io/zoomwebbrowser/type.html?t=I%20agree%F0%9F%91%8D

Display a website:　好きなウェブサイトを背景として表示します：

$ ./zoomwebbrowser.sh https://www.unryu.org/

Display a chart and refresh every 10 seconds:　グラフを表示するウェブサイトを背景として、10秒おきに更新します：

$ ./zoomwebbrowser.sh https://www.chartjs.org/samples/latest/charts/doughnut.html 10

You can also take a screenshot of any window on your local PC and apply it as a zoom background:　おまけ機能ですが、以下のコマンドでPCの任意のウインドウのスクリーンショットをとってそれをzoomの背景にします：

$ ./zoomscreenshot.sh

In addition, you can register a keyboard shortcut for this script using Automator: さらにAutomatorでこのようにクイックアクションを登録すると、キーボードショートカットでスナップショットをすぐzoomに送れるようになります！（というようなデモがzoomですぐできます！）:

<img src="https://qurihara.github.io/zoomwebbrowser/img/automator.jpg" height=200>

参考URL:https://nnnamani.hateblo.jp/entry/2015/02/08/133957

# Special Thanks

To Ken Wakita [https://twitter.com/kwakita] for helpful advice🙂
