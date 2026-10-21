---
title: "JavaScript"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "JavaScript"
draft: false
---

# JavaScript {#pf3c78c9}


## はじめに {#r91414c9}
JavaScriptはオブジェクト指向という考えを独自の発想で実装したとてもユニークな言語です。<br />

そもそもはWebページに特殊効果を加えるためにネットスケープ社が開発したスクリプト言語ですが、さまざまなIT企業や団体などが仕様を拡張し競争を繰り広げていった結果、今日のユニークなオブジェクト指向言語としてのJavaScriptに至りました。<br />

また、最近ではJavaScriptから派生したActionScriptというアドビ社の技術がJavaScriptエンジンのひとつを開発しているMozilla財団に提供され、ActionScriptの持つ高度なオブジェクト指向をJavaScriptに取り入れたまったく新しい「JavaScript2.0」が開発されるなど、今日も進歩を続けています。<br />

こうなると気になるのがその互換性ですが、ActionScriptのように1社が開発を進めている言語ではなく、自由競争のもと各社・団体が切磋琢磨して争いを繰り広げている性質上、デベロッパー取り込みのため後方互換性は7,8年ほど前からかなり確保されるようになってきており、近年とみにその傾向は増しています。<br />

そのため業界におけるJavaScriptの信頼度も増し、Microsoft社の.NET Frameworkという次世代プラットフォームにもC#やVB.NET、C++などとともに「JScript」という名前で採用されました。<br />
ゆえにVisualStudio上でJScriptを用いて本格的なWindowsアプリケーションを開発できるようになりました。<br />
このほかにも、Ajaxなどの近年注目されているWeb技術はJavascriptベースのものでありますし、これに伴い新しく開発されるWebプラットフォームや開発環境もJavaScriptとの親和性を重視するようになっています。<br />

現在では、乱立するJavaScript関連規格をECMA(欧州計算機協会)がECMA-262としてまとめあげ、これに準拠してJavaScriptやJScript、ActionScriptのような関連技術は開発されるようになりました。<br />
たとえば、最新のJScriptおよびActionScriptはECMA-262 Edition 4に準拠しています。<br />
そして、IEやFirefoxなどのWebブラウザのほとんどがサポートするJavaScript/JScriptはEdition 3に準拠しています

## 言語の特徴 {#n0bd0e45}
なんといってもJavaScriptの特徴は、その<strong>学びやすさ</strong>、そしてブラウザさえあれば実行でき、開発もメモ帳などテキストエディタしかいらないと言う<strong>敷居の低さ</strong>にあるといえるでしょう。<br />
もともとがVBよりも単純なスクリプト言語であるために、直感的なところからとっかかることができ、またWebデザインにおいて大概のことはその直感的なプログラミングで行えます。<br />
実際、JavaScriptに実装された独自のオブジェクト指向機能や、HTTP通信などそのほかの高度な機能は長年多くの開発者に忘れ去られており、Googleの技術者が偶然それに目をつけたのがAjaxと言って注目されたりなどもしているほどです。<br />

それでは、次にJavaScriptのオブジェクト指向など高度な機能ですが、これも直感的なプログラミングができるよう独自の実装となっています。<br />
JAVAやC++など多くのプログラミング言語ではオブジェクト指向機能が「機能」として提供されており、キーワードやビルトイン関数などを使いこなすことでクラス化や継承など高度な機能を実現しますが、JavaScriptではその多くがC++とは違い最低限の構文としてスマートに言語仕様に組み込まれており、その最低限の構文を直感的に使うだけでオブジェクト指向の機能を実現できるという、よく考えられた言語仕様となっています。<br />
そのため、最初から組み込まれていないクラスの本格的な継承などの機能を、ちょっと頭を使うだけで自作できたりもします。<br />

そのほかにも、JavaScriptではできないことになっている機能（演算子のオーバーロードなど）をJavaScriptの持つそのユニークな言語仕様を活用することで無理やり実現することもできたりします。<br />

またはじめにで述べたように、JavaScriptは関連技術があちこちで採用されているので一度身につけたJavaScriptスキルはあちこちの環境で役に立ちます。<br />
ここではWebブラウザで動作するJavaScript/JScriptについて解説しますが、このJavaScriptはWebページに埋め込んで使う形のスクリプトなので、Webブラウザさえあれば動作するという、ActionScriptよりはるかに低い敷居で提供されています。

## 環境の構築 {#g0862e99}
JavaScriptはWebページに埋め込んで使う形のスクリプト言語なので、IE(インターネットエクスプローラ)やFirefoxなど、あなたがいつもインターネットをするときに使っている「Webブラウザ」というソフトウエアさえあれば動きます。<br />
開発にはメモ帳などテキストエディタしか必要ありません。<br />
C言語などと違い、JavaScriptは「スクリプト言語」といい、書いたコードがそのまま動くタイプの言語なので、コンパイラなどの特別なソフトウエアも<strong>一切必要ありません</strong>。

## とりあえず作ってみる {#g855a1e3}
### Hello World {#heb5745e}
JavaScriptはWebページに埋め込んで使う形のスクリプトですので、必然的に動作にはJavaScriptコード以外の[HTML](/docs/HTMLとCSS)のコードも必要です。<br />
そのため、以下のHello Worldスクリプトは長々と行数がありますが、有効なJavaScriptコードはたったの1行です。

```
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
 <head><title>JavaScriptテスト</title>
 <script type="text/javascript">
 document.write("hello world!");
 </script>
 </head>
 <body><p>　</p></body>
</html>
```

これを書いたら、「Hello.html」という名前にして保存。<br />
「Hello」の部分は何でもよいのですが、「.html」を必ずファイル名の末尾につけてください。<br />
そして、保存したファイルをダブルクリックするとWebブラウザが開いて「hello world!」と表示されるはずです。<br />

・ソースの解説<br />

|1行目|DTD宣言。HTML文書の先頭で行う。|
|---|---|
|2行目|HTML開始タグ。|
|3行目|HEAD開始タグ。<head>以下の記述がHTML文書のうちのヘッダ部分(本文表示と直接は関係ない、スタイルシートやスクリプト、文書の著作者などの情報が欠かれている部分)であることを意味する。<br />また、TITLEは、HTML文書のタイトル名をあらわしている。|
|4行目|SCRIPT開始タグ。<script (中略)>以下の記述がJavaScript言語によるスクリプトコードであることをあらわしている。|
|5行目|<strong>JavaScriptコード。「hello world!」とドキュメント(文書)に出力する命令。末尾の「;」は１命令文の終了を表している。</strong>|
|6行目|SCRIPT終了タグ。以上の記述がJavaScript言語によるスクリプトコードであることをあらわしている。|
|7行目|HEAD終了タグ。<head>から</head>までの記述がHTML文書のヘッダ部分であることをあらわす。|
|8行目|BODY開始タグ。<body>から</body>まで部分はブラウザに直接表示される内容をあらわしている。<br />中身が空ではいけないというルールがあるのでPを入れているが特に意味はない。|
|9行目|HTML終了タグ。|

ここではHTMLの解説は行いません。HTMLに関しては[HTMLとCSS](/docs/プログラミング言語/HTMLとCSS)のページを参照して下さい。

## 新たな言語仕様の勃興 {#md00b46c}
「環境問題は政治」みたいなフレーズが作れるほどに「言語仕様が資本主義」なわけですが、そんななかでも、いろいろ新しい試みがなされてます。

「DOM Storage」「canvas」や、次世代のHTML5 を見越した動き、それから特に Apple が力を入れる Widget や CSS Animation、などいろいろな試みがあるわけです（AppleはWidgetのためにcanvasを作ったと云っており、まさに必要は発明の母ですな）。CSSとはいっても、CSS Animation が標準化されると、動くページの構築が楽になるように、JavaScriptの場合は Web技術を網羅的にみる必要がありますナ。とくに、有志が作ってあった「document.getElementsByClassName」メソッドの実装をSafari がネィティブにサポートした、とかあの手この手でプログラマ側の要望をそれへとコミットしてるので、グラマとしてはなるべく早く対応してゆきたい。

とくに注目すべき動きなのが「DOM Storage」かなあと思われる。

### DOM Storage（Client-side Database Storage） {#v8408f64}
Firefox 2、Safari 3.1（Safari 4 でインスペクタ追加）、Windows IE 8 からサポートされるクライアント側のデータベース操作機能のことで、これは「Web Applications 1.0」とかいう「HTML 5」時代の仕様のごく一部に過ぎないけれど、今までクッキーやらでセッションを認證して、サーバ側のDBをゴリゴリ動かしてたことを考えれば、トランザクション減らせるし、この機能は革命的。

「session」を遣うウェブプログラミング同様に、localStorageという変数にDataBaseのデータが入る。もうひとつsessionStorageにはタブ（個々のウインドウ）の情報を入れて、閉じると破毀される。それぞれの変数に勝手にオブジェクトを追加すると、保存してくれる。localStorage.name = "<name here.>"; みたいな感じおk。ほら、簡單でしょ。あとJavaScriptでSQL文も書けるらしいぞ。詳しくはググレ。

Safari の場合は OS と同じで SQLite 3を遣ってるらしい。狐やMSは資料が無いのでよくわからんのだわ。狐は古い仕様であとは新しい仕様。容量はSafari 4ではユーザの設定次第だけど標準で10MBまで。IE8も10MBまで。

まああんまりヨイショするのもアレだ、仕様はまだ出揃ってないけど、念頭に置いといておくれよ。

## ライブラリ {#d230a868}

### JQuery {#j9577ea9}

http://jquery.com/
HTML要素へのアクセスを独自の記法で簡潔に書くことができる。
ブラウザ間の差異も（あまり）気にしなくてよい。


## リンク {#r76adf91}
### 言語リファレンス {#l4b701ec}

- http://www.sumnet.ne.jp/domp/jsbs/reference.htm


機能別にまとめてあるタイプのリファレンス。<br />
まず何をつくるか考えて、どういう処理をしたらそれが実現できるか(仕様)を細かく並べて、そして上のサイトのようなリファレンスを参考にしてコーディングするとよい。<br />
しかし初心者は、なにを作るか考える際に「何ができるのか」がわからないので仕様の定めようがない。そこで以下のような、サンプルスクリプトを解説とともに大量に提供しているサイトをみながら練習する必要がある。

### 言語リファレンス２ {#y205fe15}

- http://developer.mozilla.org/ja/docs/Core_JavaScript_1.5_Guide


日本語で書かれた数少ない体系的にまとめられたJavaScript言語についての解説ドキュメント。<br />
ブラウザを開発している団体によるもので内容も信頼できる。

### 言語ガイドライン(WebKit) {#za75b26d}

- http://developer.apple.com/jp/documentation/ScriptingAutomation/Conceptual/JSCodingGuide/


Appleの開発者向けガイドラインの邦訳ドキュメント。言語の基本的なこととAppleの方針を解説している。
同じくブラウザを開発してる会社。他にもJavaScriptに関するドキュメント有り。

### サンプルスクリプトサイト {#j13980cc}

- http://www.awcs.org/javascript/


ここは非常に良質なサイトであり、JavaScript以外にもHTMLなどさまざまなクライアントWeb技術の解説ページも備えている。<br />
しかし、Firefoxでは見にくいのが難点。

- [jsdo.it - Share JavaScript, HTML5 and CSS](http://jsdo.it/)


### おすすめリファレンス {#m1c85659}

- http://www.tohoho-web.com/js/index.htm
- http://www.openspc2.org/JavaScript/reference4/index.html


すこしレベルが上がってきたら、こちらのようなタイプのリファレンスをお勧めする。<br />
すっかり忘れていた機能や、「こんなのあるだろ?」というような機能をちょっと探すのに適している。

### DOMリファレンス {#t4632467}

- http://www.openspc2.org/JavaScript/JavaScript_DOM/


DOMとは、HTMLで構成されたWebページを動的にJavaScriptで操作する技術である。基本的な構文をだいたいマスターしたら、こういった専門的技術のリファレンスで細かい知識をみにつけていくとよい。

### 総合的なJavaScript解説サイト {#x2be5eef}

- http://javascriptist.net/


基礎のレベルや逆引きリファレンスから、詳細なリファレンスまですべてそろっているJavaScript解説サイト。最初からこれを紹介しろよって感じですねｗ

- [モダンJavaScript チュートリアル集 | Diaspar Journal](http://diaspar.jp/-/javascript-ecmascript)


- [オブジェクト指向プログラム言語としてのJavaScript](http://www.tokumaru.org/JavaScript/index.htm)
- Latest
- [JavaScript: オブジェクト指向の手法によって高度な Web アプリケーションを作成する](http://msdn.microsoft.com/ja-jp/magazine/cc163419.aspx)
- [JavaScriptっぽい。 JavaScript OOPなリンク集](http://javascript.blog3.fc2.com/blog-entry-34.html)
- [JavaScript: 世界で最も誤解されたプログラミング言語 - RapidShare](http://d.hatena.ne.jp/brazil/20050829/1125321936)
