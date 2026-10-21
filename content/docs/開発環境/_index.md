---
title: "開発環境"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "開発環境"
draft: false
---

# 開発環境 {#f4d181fc}
## このぺーじは？ {#tee82e04}
一般的なプラットフォームからコンシューマー等まで、開発環境構築を解説してるんだお。。
<br />

# ハードウェア {#g62c6621}
開発者たるものPCの中だけ出なくPCまわりにも気をつかうべし。
## キーボード {#x8df3728}

- 特にキーボードの良し悪しよって打つ速度や、長時間使用時の疲労度はまったく異なります。<br />
  キーボードには気をつかいましょう。~<br />
  プログラマにはよくHHKやKinesisを勧められますが高いです。

### Dvorak/DvorakJP配列 {#q3aa3c7b}

- Dvorak配列は神。
  - 日本語を打つときは左手ばっかり酷使されて最悪な配列だが、<br />
    プログラミングの時は驚くほど軽快に打つことができる。~<br />
    (日本語入力はDvorakJP配列の利用により改善可能。詳しくはリンク先を参照のこと）~<br />
    リンク先にあるソフトウェアかIME設定ファイルを用いると~<br />
    qwerty配列キーボードでDvorak/DvorakJP配列を使用可能なので~<br />
    一度お試しあれ。<br />
  - MacOSXの場合、ことえりの環境設定→「英字入力時のキーボード配列」を「Dvorak」にかえる。
  - Linuxの場合、最近のディストリなら`setxkbmap dvorak`でお試し可能。

'setxkbmap jp106'で元に戻せます。

[DvorakJP](http://www7.plala.or.jp/dvorakjp/index.htm)

<br />

### Happy Hacking Keyboard {#ofc7016d}

- PFUが作ったすばらしきキーボード。通称HHK
- お金のある大学研究室などでよく使われている。
- カチャカチャ五月蝿い
- 最近日本語配列版も登場した。


[Happy Hacking Keyboard | PFU](http://www.pfu.fujitsu.com/hhkeyboard/)

### Realforce {#sc24127e}

- 話題のキーボード。通称リアフォ
- 軽くて高速打鍵できる。


[東プレ株式会社 - キーボード（Realforce）](http://www.topre.co.jp/products/comp/index.html)

### Kinesis' Contoured Keyboards {#m0cb7a61}

- エルゴノミクスキーボードの一つ、高い。
- いわゆる変態キーボードのひとつ。
- この会社は、フットペダルとかも作ってたりします。


\#ref(hentai.jpg);

- 打ってるとこ見つけました。どうみても変態です。本当にありがとうございました。
- [Touch type of Kinesis Advantage USB contoured keyboard - Youtube](http://jp.youtube.com/watch?v=hxH7Uith0tQ)


[Kinesis Ergonomic Computer Keyboards](http://www.kinesis-ergo.com/keyboards.htm)

## マウス {#z8b559dd}

- できればマウスなしで開発できるようになるのが望ましい<br />
  腕も痛くならないしね！
- ネトゲや、FPSプレイヤーが好むあのゴツイマウスは、どっしり通常用途にもなかなか使えるらしい

<br />

### マウスなしで操作できるようにするには？ {#a6ffe47c}

- vimやemacsなどの, しっかりしたキーバインドをもつエディッタを使う。
- ショートカットキーを覚える


### どうしてもマウス操作が必要なんです {#h49ca6ce}

- トラックポイント付きのキーボード、または手前にトラックパッドやトラックボールの付いたキーボードを使うと最小限の手の動きでポインティングデバイスとキーボードの間を移動できます。
- WindowsならNumLockを長めに押すとマウスキー機能が使えたかも。


## 参考リンク {#z6fd0695}

- [FrontPage - Gamer's Gadget Memo](http://wikiwiki.jp/fpag/)<br />
  ゲーマー向けハードまとめ

# オペレーティングシステム {#w7b58249}
各オペレーティングシステム別に、概要

## GNU/Linux {#j1b17654}

- 大抵のディストリビューションにはコンパイラとしてgccが入っている。ので

コンパイラはそれをつかえばおk

- Ubuntuは標準ライブラリを使うために、build-essentialをいれないとダメらしいなのでapt-getかsynapticで入れましょう。
- オヌヌメのエディッタはvimやemacsといったCUIのものですが、geditなどのGUIエディッタもおすすめです。

<br />

## Mac OS X {#fc28c19b}

- Mac OS Xでもgccを使うことが可能です。
- 大抵の場合、標準でXcodeという開発環境が付属しているのでそれを使いましょう。
- OS Xのインストールディスクがすぐには出てこないというときには、無料のADC Onlineメンバーに登録すれば最新版のXcodeが入手できます。

<br />

## NES(ファミリーコンピュータ) {#d277f035}

- ファミコンは、処理能力が低いので基本的に高級言語では無くてアセンブリ言語をつかいます。<br />
  もちろんC言語コンパイラもありますが、最適化がいまいちなのでおすすめできません。
<br />

## SNES(スーパーファミコン) {#m84efc29}

- スーパーファミコン(以下SNES)は、命令セットが65816なので65816アセンブラを使います。

<br />

## NintendoDS {#g4578845}

- [NintendoDS向けコンパイラのインストール方法](/docs/NintendoDS向けコンパイラのインストール方法)

<br />

## PSP {#v36f7976}

- PSPSDK

<br />

## Windows {#x3148565}
これだとまるでWindowsを開発するみたいだおｗｗ

- Windowsでの開発環境は各言語の解説ページが詳しいです。<br />
  [プログラミング言語](/docs/プログラミング言語)へ飛んで調べてみましょう。
- [Win32 リソースエディタ](/docs/Win32-リソースエディタ)

<br />

## 超漢字 {#qfcaaf98}

- 超漢字での開発環境構築は公式サイトが詳しいです。<br />
  http://www.personal-media.co.jp/tron/developer/develop.html
<br />

# エディタ {#y03d3397}
エディタの解説

- メモ帳のようなものは[エディタ](/docs/エディタ)の項目が詳しいのでそちらを見ましょう。<br />

# 統合開発環境(IDE) {#re32dd7c}
コンパイラ、エディタ、デバッガなどを個別に用意する必要がなく、<br />
統合開発環境が一つあれば、ソフトウェアの開発を行うことが出来る。<br />
予約語や関数名の入力補完や、ソースコードの記述ミスがリアルタイムで表示されるのも<br />
開発環境にIDEが選ばれる理由である。
嫌われる点としては、エディタなどとくらべると重く<br />
ある程度のPCスペックが必要となることか。<br />
以下に挙げているものは無料で利用可能

- Microsoft VisualStudio<br />
  対応言語はC/C++、C#、VB.net~<br />
  Microsoft製　EXPRESS版は無料でインストール可能。~<br />
  WindowsでのGUI製作において、ポトペタで非常に楽に作ることができ、~<br />
  VSポトペタ最強説は何割かの開発者が通る道である。~<br />
  ASP.NETでWEB開発も可能。痒いところに手は届かないが、~<br />
  非常に速いスピードで開発が可能。

- Xcode<br />
  対応言語はC/Objective-Cなど。最近はお仲間にDashcodeなるDashboard（Widget）専用の奴も表れた~<br />
  Apple謹製~<br />
  Mac OS X用ならオススメ。Interface Builder など幾つか付属します~<br />
  エディタとしても使えます<br />

- Eclipse<br />
  Windowsでのjava開発でよく使われるが、プラグインで高級言語だろうがLLだろうがなんでもござれ~<br />
  プラグインで機能を拡張しまくれる~<br />
  オープンソース~<br />
  日本語化のプラグインがある~<br />
  やっぱり重い

- NetBeans<br />
  だいたいEclipseと似たような感じ？~<br />
  GUIが作りやすいらしいよ~<br />
  マルチランゲージでインターフェースは日本語対応~<br />
  オープンソースでSun Microsystems製~<br />
  スレでは、JavaScriptの開発環境としてしばしば挙げられる
