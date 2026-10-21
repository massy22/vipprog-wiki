---
title: "開発ツール・ライブラリ"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "開発ツール-ライブラリ"
draft: false
---

[プログラミング言語/Ruby](/docs/プログラミング言語/Ruby)


---

プロファイラやデバッカはいちおう普通についてます。


## 統合開発環境 {#tbc916b3}


<dl>
  <dt>NetBeans</dt>
  <dd></dd>
</dl>


<dl>
  <dt>RDE</dt>
  <dd></dd>
</dl>

Ruby Development Environment。Delphi製。<br />
これひとつからデバックなども可能。保存していないスクリプトでもF5で一発実行。Rubyスクリプトでテキストを編集したりもできる。<br />
…が、長い間使っていると落ちる。しかも開発停止中。<br />
…と思いきや、2007/7/7(七夕!)にVer.1.1.1がリリースされました。
[窓の杜 - コード補完やデバッグ機能を備えたRudyスクリプトの統合開発環境「RDE」v1.1.1](http://www.forest.impress.co.jp/article/2007/07/23/rde.html)


<dl>
  <dt>RubyWin</dt>
  <dd></dd>
</dl>

Ruby1.6系ベース。開発停止中。


<dl>
  <dt>RDT</dt>
  <dd></dd>
</dl>

Ruby開発用のEclipseプラグイン。


# 対話環境 {#o2063d53}

<dl>
  <dt>irb</dt>
  <dd></dd>
</dl>

Interactive Ruby。標準添付。


## パッケージ管理システム {#adbf1c9f}

<dl>
  <dt>RubyGems</dt>
  <dd></dd>
</dl>

Ruby版CPAN(と堂々と云えるほど整ってはいないが)。


## テスティングフレームワーク {#m1ed8710}


<dl>
  <dt>test/unit</dt>
  <dd></dd>
</dl>

標準添付のテスト駆動開発(Test-Driven Development/TDD)環境。

<dl>
  <dt>RSpec</dt>
  <dd></dd>
</dl>

振舞駆動開発(Behavior-Driven Development/BDD)環境。
RubyをDSLとしてスペックを記述する。

<dl>
  <dt>expectations</dt>
  <dd></dd>
</dl>


## ビルドツール {#gc97d65c}


<dl>
  <dt>Rake</dt>
  <dd></dd>
</dl>

Ruby DSLによってmakefileを書くmakeみたいなもの。


## Webアプリケーションフレームワーク {#he0126c3}

<dl>
  <dt>Ruby on Rails</dt>
  <dd></dd>
  <dt>Sinatra</dt>
  <dd></dd>
  <dt>CGIKit</dt>
  <dd></dd>
  <dt>Nora</dt>
  <dd></dd>
</dl>


## GUIライブラリ {#m37ae21c}


<dl>
  <dt>Ruby/tk</dt>
  <dd></dd>
</dl>

Tcl/Tkラッパー。

<dl>
  <dt><a href="http://ruby-gnome2.sourceforge.jp/ja/index.html">Ruby/Gtk2</a></dt>
  <dd></dd>
</dl>

GTK+-2.x, GNOME-2.x開発環境をオブジェクト指向スクリプト言語Rubyから利用するための拡張ライブラリ。

<dl>
  <dt><a href="http://www.osk.3web.ne.jp/~nyasu/software/vrproject.html">VisualuRuby</a></dt>
  <dd></dd>
</dl>

Win32 APIラッパーライブラリ。

<dl>
  <dt><a href="http://www.moriq.com/apollo/">Apollo</a></dt>
  <dd></dd>
</dl>

VCLブリッジを備えたRuby処理系＋ラッパーライブラリ

<dl>
  <dt><a href="http://wxruby.rubyforge.org/wiki/wiki.pl">WxRuby</a></dt>
  <dd></dd>
  <dt>FxRuby</dt>
  <dd></dd>
  <dt>Ruby/FLTK</dt>
  <dd></dd>
  <dt>Ruby/Qt</dt>
  <dd></dd>
  <dt>Ruby Shoes</dt>
  <dd></dd>
</dl>


## ドキュメントの閲覧／作成 {#s808778e}

### コマンドラインリファレンスビューワ {#p15b3b76}


<dl>
  <dt>ri</dt>
  <dd></dd>
  <dt>Refe</dt>
  <dd></dd>
</dl>


### RD {#d3ce4d63}

スクリプト埋め込み型のドキュメント形式。

<dl>
  <dt>RDtool</dt>
  <dd></dd>
</dl>

RD形式のドキュメントを他のフォーマットに変換する。
(HTML、UNIX manページなど)

### RDoc {#y4535546}

ソース解析による自動ドキュメンテーション。

<dl>
  <dt>rdoc</dt>
  <dd></dd>
</dl>

RDoc処理系。現在標準添付。


## ゲーム作成フレームワーク {#yc0fc128}


<dl>
  <dt><a href="http://www.kmc.gr.jp/~ohai/rubysdl.html">Ruby/SDL</a></dt>
  <dd></dd>
</dl>

マルチプラットフォーム・マルチメディアライブラリSDLのRubyインタフェース。


<dl>
  <dt><a href="http://www.twin.ne.jp/~cyross/Miyako/">Miyako</a></dt>
  <dd></dd>
</dl>

Ruby/SDLをラップし、基本。拡張のAPIを提供する。
独自のメッセージマクロ言語も備える。


<dl>
  <dt><a href="http://dgames.jp/ja/projects/mygame/">MyGame</a></dt>
  <dd></dd>
</dl>

こちらもRuby/SDLのラッパー。Miyakoとは対照的にコンパクト。


<dl>
  <dt><a href="http://www.enterbrain.co.jp/digifami/products/rpgxp/shinkinou.html">RGSS</a></dt>
  <dd></dd>
</dl>

(株)エンターブレインの「RPGツクールXP」に搭載されたRuby拡張。


<dl>
  <dt><a href="http://www.starruby.info/ja/">StarRuby</a></dt>
  <dd></dd>
</dl>

SDLのラッパー。スーパーファミコン風のゲーム製作に特化した作りとなっている。


## パーサジェネレータ {#h34bb946}


<dl>
  <dt><a href="http://www.loveruby.net/ja/projects/racc/">Racc</a></dt>
  <dd></dd>
</dl>

Pure Rubyパーサジェネレータ。


## EXEファイル作成 {#x09d1fa4}


<dl>
  <dt><a href="http://exerb.sourceforge.jp/">Exerb</a></dt>
  <dd></dd>
</dl>

Rubyスクリプトを単体で実行可能なEXEファイルにする。
ファイルサイズが大きくなりがちだが、UPX圧縮に対応した。
