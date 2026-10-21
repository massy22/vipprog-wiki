---
title: "ActionScript"
date: 2026-07-22T05:38:43+09:00
lastmod: 2026-07-22T05:38:43+09:00
slug: "ActionScript"
draft: false
---

# ActionScript {#top}


# はじめに {#cc8dbde2}

- 折角だから3.0で
- 復習がてら書いてみます
- 間違っていたら指摘よろ
- 開発環境が無料で手に入るからFlash作り放題ですが何か？
  - 実は去年の夏頃からそうなってる


# 言語の特徴 {#tb4ee8a7}

- Flash用プログラミング言語
- 環境に依存しない
  - ブラウザにFlash PlayerプラグインがインスコしてあればOK
- オブジェクト指向
  - ( JavaScript + Java ) / 2
- ライブラリが豊富
  - マルチメディア系に結構強いよ
- Adobe AIR
  - ローカル用のクライアントプログラムも作れるよ


# 環境の構築 {#g582e105}
まず

- http://java.sun.com/j2se/1.5.0/ja/download.html


にあるJDK 5.0 Update 11をインストールしてJavaが動くようにし、次に

- http://www.adobe.com/jp/products/flex/


で「Flex 2 SDKを利用して、無償でFlexアプリケーションの開発・実装をスタート」をクリック<br />
ユーザ登録後、Flex SDK(27.98MB)とFlex Language Pack(9.72MB)をDL<br />
flex_sdk_2.zipを解凍し、フォルダをC:\に置く<br />
flex_sdk_2_ja.zipも解凍し、先ほどのフォルダに上書き<br />
C:\flex_sdk_2\binにパスを通す<br />
C:\flex_sdk_2\player\debug\Install Flash Player 9.exeをダブルクリック、インストール<br />

これで完了。

- 現在ではFlex SDK 3が出ています。やり方は大体同じ！


## wonderfl {#r2cdbd83}
[wonderfl build flash online](http://wonderfl.kayac.com/)ならブラウザだけで出来るよー

- [help | wonderfl build flash online](http://wonderfl.kayac.com/help)
- [特集：ブラウザだけでできる！wonderflではじめるFlash制作｜gihyo.jp … 技術評論社](http://gihyo.jp/design/feature/01/wonderfl)


# とりあえず作ってみる {#cbac6d0c}
## Hello World {#ke951a89}
メモ帳なりなんなりを開いて以下を記述

```actionscript
package {
  import flash.display.Sprite;
  import flash.text.*;

  public class HelloWorld extends Sprite {
    public function HelloWorld() {
      var textField:TextField  = new TextField();
      textField.text           = "Hello World!";
      textField.autoSize       = TextFieldAutoSize.LEFT;
      addChild(textField);
    }
  }
}
```

書いたら「HelloWorld.as」と名前を付けて保存<br />
コマンドプロンプトを開き、「HelloWorld.as」を保存した場所に移動<br />
以下を打つ<br />

```
mxmlc -default-size 240 240 -default-frame-rate=30 -default-background-color=0xFFFFFF HelloWorld.as
```

同じディレクトリにHelloWorld.swfが生成されていたらコンパイル成功！<br />
ダブルクリックしてみるときちんと表示されるはず。<br />
これで貴方もFlashを作れる神になりました。<br />
後は努力次第でゲームぐらい作れるんじゃね？<br />
<br />
さて、上のソースの解説を。

|1行目|カッコで括られた範囲は同一のパッケージ内にあることを宣言しています。|
|---|---|
|2、3行目|flash.display.Spriteパッケージとflash.textパッケージに含まれる全てを利用することを宣言しています。|
|5行目|Spriteクラスを継承したHelloWorldクラスを宣言しています。|
|6行目|コンストラクタを宣言しています。インスタンスが生成される度にこの中身が実行されます。|
|7行目|TextFieldクラスのインスタンスを生成しています。|
|8行目|インスタンスのtextプロパティに文字列を設定しています。|
|9行目|インスタンスのautoSizeプロパティに位置を設定しています。|
|10行目|インスタンスを自分に子付け→画面に表示させます。|

# リンク {#v30a0108}
## 本家 {#of362075}

- http://www.adobe.com/support/documentation/jp/flex/ Flexドキュメンテーション。良質。
- [Adobe - Flex 3: Downloads](http://www.adobe.com/products/flex/flexdownloads/)


- [Adobe - AIR：Adobe AIR SDK](http://www.adobe.com/jp/products/air/tools/sdk/)


- [Adobe -- Adobe AIR Developer Center](http://www.adobe.com/devnet/air/)


## 参考サイト {#ia2f78fe}

- http://www.saturn.dti.ne.jp/~npaka/flash/as30/ ん・ぱかさんのメモ。下部に沢山のサンプルが。


- [特集：プログラマのためのFlash遊び方：｜gihyo.jp … 技術評論社](http://gihyo.jp/dev/feature/01/flash-sdk)
- [連載：Adobe AIRで作るデスクトップアプリケーション｜gihyo.jp … 技術評論社](http://gihyo.jp/dev/serial/01/adobe-apollo)
- [八角研究所 : Series: パンダゼロと覚える ActionScript3.0 «](http://www.hakkaku.net/series/%e3%83%91%e3%83%b3%e3%83%80%e3%82%bc%e3%83%ad%e3%81%a8%e8%a6%9a%e3%81%88%e3%82%8b-actionscript30)
- [八角研究所 : Series: Adobe Flex コンポーネントの作り方 «](http://www.hakkaku.net/series/adobe-flex-%e3%82%b3%e3%83%b3%e3%83%9d%e3%83%bc%e3%83%8d%e3%83%b3%e3%83%88%e3%81%ae%e4%bd%9c%e3%82%8a%e6%96%b9)
- [- Flex User Group](http://www.fxug.net/)
- [Adobe Flex チュートリアル集 | Diaspar Journal](http://diaspar.jp/node/165)
- [wonderfl build flash online](http://wonderfl.kayac.com/)
  - [特集：ブラウザだけでできる！wonderflではじめるFlash制作｜gihyo.jp … 技術評論社](http://gihyo.jp/design/feature/01/wonderfl)
- [Flash OOP Japan](http://www.flashoop.jp/) - ActionScriptによるオブジェクト指向プログラミング
- [FrontPage - Flash OOP Japan](http://cs3book.flashoop.jp/wiki/index.php?FrontPage) - 続Flash OOP本
  - [Flash Develop + CS3 - Flash OOP Japan](http://cs3book.flashoop.jp/wiki/index.php?Flash%20Develop%20%2B%20CS3)
- [ActionScript：CodeZine（コードジン）](http://codezine.jp/article/tag/230)

### 開発環境、設定等 {#t0afb8ac}

- [無料でFlashの制作環境が整えられる! FlashDevelopとFlex SDK 3のインストール方法(ビデオ付き) | ClockMaker Blog](http://clockmaker.jp/blog/2009/07/tutorial-install-flashdevelop-flex-sdk/)
- [馬鹿全 - FlashDevelop 情報まとめ](http://blog.bk-zen.com/2009/07/12/190/)
- [ActionScriptとAdobeAIRのメモ](http://www15.plala.or.jp/kichijitsu/as/astop.html)
  - [環境設定 : FlexSDK + FlashDevelopで作る場合](http://www15.plala.or.jp/kichijitsu/as/flex_ide.html)
  - [環境設定 : FlexSDK + テキストエディタで作る場合](http://www15.plala.or.jp/kichijitsu/as/flex_cui.html)
- [AmaterasAIR - Project Amateras](http://amateras.sourceforge.jp/cgi-bin/fswiki/wiki.cgi?page=AmaterasAIR) - GUIベースでAdobe AIRアプリケーション開発・HTMLベース、Flexベース両方：Eclipseプラグイン
