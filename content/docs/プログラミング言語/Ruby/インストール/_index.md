---
title: "インストール"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "インストール"
draft: false
---

[プログラミング言語/Ruby](/docs/プログラミング言語/Ruby)

---


## Windowsの場合 {#m7570e8f}

Windowsで動くRuby処理系には、いくつか種類があります。

<dl>
  <dt>Cygwin版</dt>
  <dd></dd>
</dl>

その名の通りCygwin上で動作させるものです。インストールはCygwinのsetup.exeを頼ってくださ(ry


<dl>
  <dt>mswin版</dt>
  <dd></dd>
</dl>

ふつーにWindowsで動くものです。Windowsとの相性も最も良いでしょう。


<dl>
  <dt>wince版</dt>
  <dd></dd>
</dl>

W-ZERO3等winCE機で動くものです。配布元はRubyの公式ページではありません。
エディタやDOS窓は自分で探してください。そこまで面倒見れません。
環境設定も自分でがんばってください。
[配布元](http://uema2.s8.xrea.com/ruby-mswince/)

さらに、mswin版については、ActiveScriptRubyという、その名の通りActiveScriptエンジンとのブリッジを備えたバージョンもあります。

Windowsへのインストールは、インストーラにまかせっきりでぉｋなものが楽でしょう。

[ダウンロード場所](http://www.ruby-lang.org/ja/downloads/)
ここの「各環境用バイナリ」の辺り

ただ、インストーラがパスを通してくれるとは限らないので、
環境変数PATHの設定はきちんと確認しましょう。

Windowsでの環境の整え方は[ここ](http://jp.rubyist.net/magazine/?0002-FirstProgramming)に詳しく書かれています。インストールから、初めてのRubyスクリプトの実行までかかれてあるので、参考になるでしょう。

## UNIX系OSの場合 {#rb6f1640}

DebとかRPMとか、まぁいろいろあるでしょ。
というか、最近のLinuxディストリビューションだと
始めからインストールされている可能性大。

aptが使えるDebianやUbuntuの場合は、


```
# apt-get install ruby
```


yumが使えるFedoraの場合は、


```
# yum install ruby
```


でOKです。ただし、一部のライブラリが入らない場合があるので、その場合はエラーメッセージなどでググるといいでしょう。

## MacOSの場合 {#k7c5fa52}

MacOS9以前ではRubyで遊べないようです。残念。<br />
MacOSX 10.2以降であれば、標準でインストールされています。<br />
MacOSX 10.1の人は、[Rubyをダウンロード](http://rubyosx.rubyforge.org/)しましょう。

最新版が欲しい場合は、パッケージ管理ツールを使ってインストールしましょう。<br />
有名なところではMac Ports、Fink等があります。

MacOSXでのパッケージ管理ツールのインストール方法については、<br />
既に色々な人がまとめているので割愛します。


## 自分でコンパイル！ {#se454c5a}

作成中。
<del>ただ、新しめのsedとbisonが要ります。</del>
<del>autoconfと</del>makeは言うまでもなく要ります。
(もちろんgccも)

というわけでUNIX系では無問題ですが、
WinだとMinGW+MSYSが無難かと思われます。
Cygwinもアリでしょうが、MinGWでコンパイルした拡張ライブラリは
そのままmswin版Rubyでも動いたりするので。

## 新たな動向 {#j0a51e24}

<dl>
  <dt>IronRuby</dt>
  <dd><a href="/wiki/docs/プログラミング言語/IronPython">IronPython</a>のように、Silverlight上のMS製Ruby処理系。</dd>
  <dt>NetBeans</dt>
  <dd>Java製IDE。JRubyでRubyも開発できる。</dd>
  <dt>Rubinius</dt>
  <dd>Smalltalkを見習ったRubyの実装。C++によるVMとコアに、Rubyによるクラスライブラリ。</dd>
</dl>
