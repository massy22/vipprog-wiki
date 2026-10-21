---
title: "AutoHotKey"
date: 2026-07-26T10:09:07+09:00
lastmod: 2026-07-26T10:09:07+09:00
slug: "AutoHotKey"
draft: false
---

# AutoHotkey {#h82df47d}
## 概要 {#adea700f}
[AutoHotkeyを流行らせるページ](http://lukewarm.s101.xrea.com/)より～
> 

```
AutoHotkeyはホットキーへの機能の割り当てなど常駐ソフトの作成に特化したスクリプトエンジンである。
多彩なコマンドが用意されており、GUIを持ったプログラムの作成も可能。
GNU GENERAL PUBLIC LICENSE Version 2の下で配布されるフリーソフトで、C++で作られている。
公式サイト(http://www.autohotkey.com/)にて、インストーラー版とZIPアーカイブ版の2種類が配布されている。
インストーラーを実行すると、スタートメニュー、新規作成メニュー、関連付けに変更が加えられる。 
```


- 自動化 - 所謂マクロ。
- ホットキー - スクリプトを常駐、特定のキーやボタンが押されたときにひとつ、あるいは複数の機能を割り当て。
- [Hotstring](http://lukewarm.s101.xrea.com/Hotstrings.html) - 日本語での利用には多少工夫が必要。
- GUI - GUI を設定できる。CUIのソフトのフロントエンドなどはおてのもの。
- [リマップ](http://lukewarm.s101.xrea.com/remap.html) - キーやボタンをリマップできる。 特定のウィンドウやウインドウ毎にリマップすることも可能。
- 実行ファイル - 実行に必要なファイルとともに自作スクリプトを実行ファイルに変換可能。AHKがインストールされていない環境に向けても配布が可能に。


詳しい特徴と機能についての紹介は [AutoHotkey Wiki](http://ahkwiki.net/) でされています。


## スクリプト {#e4410784}

### 初心者 &amp; ニューカマー へのアドバイス {#d33e3319}
[Tutorial for Newbies](http://www.autohotkey.com/forum/post-182060.html&sid=63cea50bd3c51fedb26cacc900e3838b#182060) より引用～
> As a person who started using AHK having absolutely zero programming experience (never taken a class or read a book on computers in my life), I will give you my 2 cents on learning it.
> 
> I think exploring the forum works great if you have even a little bit of background in this area. If, like me, you have none, I would learn it in the following order (this is how I would do it if I had to do it over again). Razz My reasoning here is that for a person starting from scratch, you need to learn concepts before learning commands, and the forum is geared more towards commands.
> 
> First read the [Tutorial](http://www.autohotkey.com/docs/Tutorial.htm), the [Scripts](http://www.autohotkey.com/docs/Scripts.htm) page, and then the [FAQ](http://www.autohotkey.com/docs/FAQ.htm). Afterwards, I would recommend learning concepts in the following order:
> 

1. [Hotstrings](http://www.autohotkey.com/docs/Hotstrings.htm)
1. [Hotkeys](http://www.autohotkey.com/docs/Hotkeys.htm)
1. [Mouse Clicks](http://www.autohotkey.com/docs/commands/Click.htm) & Mouse HotKeys
1. [Variables](http://www.autohotkey.com/docs/Variables.htm#Intro)
1. Loops - especially Parsing Loops
1. String commands - (e.g. StringMid, StringReplace)
1. [If](http://www.autohotkey.com/docs/commands/IfEqual.htm),[Else statements](http://www.autohotkey.com/docs/commands/Else.htm)
1. [Expressions](http://www.autohotkey.com/docs/Variables.htm#Expressions)
1. [Arrays](http://www.autohotkey.com/docs/misc/Arrays.htm) & Dynamic variables - ([StringSplit](http://www.autohotkey.com/docs/commands/StringSplit.htm))
1. [GoSub](http://www.autohotkey.com/docs/commands/Gosub.htm) & [Functions](http://www.autohotkey.com/docs/Functions.htm)
1. [GUIs](http://www.autohotkey.com/docs/commands/Gui.htm)
1. [Windows Messages](http://www.autohotkey.com/docs/misc/SendMessage.htm)
1. [DllCall](http://www.autohotkey.com/docs/commands/DllCall.htm)


> The first 3 you will not necessarily use very often once you become proficient with the program; but they are the easiest to comprehend and implement. Everything from Variables through GUIs is what I would consider the "core" of the program that you will use repeatedly to write virtually all of your scripts with. Windows Messages and DLLCalls are the advanced techniques that are the most powerful but most complicated. The average user will probably never have the need and desire to master these two.
> Of course this list is not set in stone, and you may be learning multiple items at once (for example you may want to scratch the surface of GUIs right away), but I think all of the items are important to learn about if you plan to use AHK more than a few times, and I tried to arrange them in an order that would be most logical and systematic.
> 
> When you're wondering how to accomplish a specific task in AHK, remember that most of the commands have a common naming scheme to identify what they do. For example:
> 
> Commands dealing with files start with <span style="color:#FFA527;"><strong>File</strong></span>.<br />
Commands dealing with windows start with <span style="color:#808027;"><strong>Win</strong></span>.<br />
Commands dealing with text start with <span style="color:#EE82ED;"><strong>String</strong></span>.<br />
> 
> Similarly:
> 
> Commands that retrieve data from somewhere contain <span style="color:#F40000;"><strong>Get</strong></span>.<br />
Commands that apply data to somewhere contain <span style="color:#4A8000;"><strong>Set</strong></span>.
> 
> Combining the two previous structures, we have commands like:
> 
> <span style="color:#FFA527;"><strong>File</strong></span><span style="color:#F40000;"><strong>Get</strong></span>Size - Retrieve the size of a file.<br />
<span style="color:#808027;"><strong>Win</strong></span><span style="color:#F40000;"><strong>Get</strong></span>Title - Retrieve the title of a window.<br />
<span style="color:#EE82ED;"><strong>String</strong></span><span style="color:#F40000;"><strong>Get</strong></span>Pos - Retrieve the position of a piece of text inside a larger piece (like a sentence in a paragraph).<br />
> 
> <span style="color:#FFA527;"><strong>File</strong></span><span style="color:#4A8000;"><strong>Set</strong></span>Time - Apply a new Time Stamp to a file.<br />
<span style="color:#808027;"><strong>Win</strong></span><span style="color:#4A8000;"><strong>Set</strong></span>Title - Apply a new title to a window.<br />
<span style="color:#4A8000;"><strong>Set</strong></span>Timer - Apply a new Timer, which is a command or group of commands that run at timed intervals.
> 
> 
> Good Luck, and remember that nobody was born knowing any of this. It takes time.
> _________________
> http://autohotkey.net/~jaco0646/

～引用ここまで <br />
Original Post by [jaco0646](http://autohotkey.net/~jaco0646/)<br />

いずれ日本語にも翻訳され、どこかで公開される事でしょう。それまでは翻訳サービス等利用するなりして下さい。

引用しっぱなしで終わり、というのも乱暴すぎる気がするので、上記の引用文中の序列リスト（番号付きリスト）の部分についてだけ、 [AutoHotkeyを流行らせるページ](http://lukewarm.s101.xrea.com/) さんで対応しているであろうページを紹介してみます。

1. [Hotstring](http://lukewarm.s101.xrea.com/Hotstrings.html)
1. [ホットキー](http://lukewarm.s101.xrea.com/Hotkeys.html)
1. Mouse [Click](http://lukewarm.s101.xrea.com/commands/Click.html) &amp; Mouse HotKeys
1. [変数](http://lukewarm.s101.xrea.com/Scripts.html#var) , [演算・変数・関数関連](http://lukewarm.s101.xrea.com/commands/index.html#calc)
1. [繰り返し処理](http://lukewarm.s101.xrea.com/Scripts.html#loop) , [Loop (parse a string)](http://lukewarm.s101.xrea.com/commands/LoopParse.html)
1. [文字列操作](http://lukewarm.s101.xrea.com/commands/index.html#str) (e.g. [StringMid](http://lukewarm.s101.xrea.com/commands/StringMid.html) , [StringReplace](http://lukewarm.s101.xrea.com/commands/StringReplace.html))
1. [If(式)](http://lukewarm.s101.xrea.com/commands/IfExpression.html) &amp; [If/IfEqual/IfNotEqual/IfLess/IfLessOrEqual/IfGreater/IfGreaterOrEqual](http://lukewarm.s101.xrea.com/commands/IfEqual.html) , [Else](http://lukewarm.s101.xrea.com/commands/Else.html)
1. [式](http://lukewarm.s101.xrea.com/Expression.html)
1. [配列](http://lukewarm.s101.xrea.com/misc/Arrays.html)  &amp; Dynamic variables,( [StringSplit](http://lukewarm.s101.xrea.com/commands/StringSplit.html) )
1. [Gosub](http://lukewarm.s101.xrea.com/commands/Gosub.html) &amp; [関数](http://lukewarm.s101.xrea.com/Function.html)
1. [GUI表示](http://lukewarm.s101.xrea.com/commands/index.html#gui)
1. [PostMessage / SendMessage](http://lukewarm.s101.xrea.com/commands/PostMessage.html) &amp; [PostMessage/SendMessage Tutorial](http://lukewarm.s101.xrea.com/misc/SendMessage.html)
1. [DllCall()](http://lukewarm.s101.xrea.com/commands/DllCall.html)


多分、最初は [AutoHotkeyを流行らせるページ](http://lukewarm.s101.xrea.com/) さんのトップページを上から順に見ていく事と思いますが、
スクリプトを自分で書くようになるにはスクリプトの概要を理解する目的で [スクリプト仕様](http://lukewarm.s101.xrea.com/Scripts.html) のページを繰り返し読むことになるかと思います。

- [Tutorial for Newbies](http://www.autohotkey.com/forum/topic47791.html) - 新（別）スレッド(Aug 18, 2009)：教材あり(AHK_Quizzer.zip)


if とか for とか loop とかさっぱり分からない、って人は Wikipediaの記事<sup id="fnref-1" class="footnote-ref"><a href="#fn-1">*1</a></sup>や [オヌヌメサイト &gt; その他参考等のページ](/docs/オヌヌメサイト#hc96ac23) などを参考にするとか、もっと直感的なツールは無いの？って人にはScratch<sup id="fnref-2" class="footnote-ref"><a href="#fn-2">*2</a></sup> などから（あくまで制御構造の理解を目的として）始めてみるのもいいのかもしれません。

## DllCall {#b8001daa}
ホットキーへの機能の割り当て以外に、GUIがあり、DllCall<sup id="fnref-3" class="footnote-ref"><a href="#fn-3">*3</a></sup>がかなり強力な事もあり（向き不向きはありますが）大抵の事は出来ると思います。


- →[参考リンク](#ref-dll)


## COM {#xe018ac5}
COM<sup id="fnref-4" class="footnote-ref"><a href="#fn-4">*4</a></sup>を利用する事も出来ます。


- →[参考リンク](#ref-com)


## FAQ {#kcda885c}

- [AutoHotkey FAQ](http://www.autohotkey.com/docs/FAQ.htm)
- AutoHotkeyを流行らせるページ →[FAQのスレ](http://lukewarm.s101.xrea.com/test/read.cgi/bbs/1200674082/)
- [engunneer's home thread](http://www.autohotkey.com/forum/topic21919.html) - ミニ FAQ

> 

```
This is a thread for me to keep common answers handy for forum linking
```


### Q.文字化け？ダメ文字？ {#oc2f06dc}

<dl>
  <dt>A.</dt>
  <dd></dd>
</dl>


  - エスケープ文字<sup id="fnref-5" class="footnote-ref"><a href="#fn-5">*5</a></sup>：#EscapeChar<sup id="fnref-6" class="footnote-ref"><a href="#fn-6">*6</a></sup>での対処
    - [AutoHotkey スレッド part6](http://pc11.2ch.net/test/read.cgi/software/1219130051/)より～

> 

```
Q：「～ＡチЯ㌔荏柿義形港餐汁秦疏蛋伝覗描冒輿倭兪啻嫣彖拜杼歔」を含む文字列がうまく扱えないよ
A：これらの文字の2バイト目が、AHKのエスケープ文字である0x60[`]なため。
　 対処としてはこれらの文字の"直後"に「`」を記述する（例：「線形`代数」）か、
　 #EscapeCharでエスケープ文字を別のものに変えるべし。 
```

  - [`]　は アポストロフィ <strong>では無く</strong> back quote(バッククォート) or backtick または グレイヴ・アクセント or アクサングラーブ


  - 対策用の関数、ライブラリ - [参考リンク&gt;ダメ文字問題対策](#ref-ng-chars)を参照。


### Q.コンパイルした実行ファイルがアンチウイルスソフトに怒られるんだけど？ {#ia1516a8}

<dl>
  <dt>A.</dt>
  <dd><a href="/wiki/docs/AutoHotKey#Compile_AHK2">Compile_AHK II</a> を試してみて下さい（08年12月14日現在）。"No UPX"オプションがあるので、UPXで圧縮しないでコンパイルしてみて下さい。</dd>
</dl>

もしかしたら改善されるかもしれません。<br />
関連用語：[実行ファイル圧縮](/docs/プログラミング用語#exe_comp-ja)


## 参考リンク {#la6d4373}

<dl>
  <dt><a href="http://www.autohotkey.com/">AutoHotkey - Free Mouse and Keyboard Macro Program with Hotkeys and AutoText</a></dt>
  <dd></dd>
</dl>

公式サイト

<dl>
  <dt><a href="http://lukewarm.s101.xrea.com/">AutoHotkeyを流行らせるページ</a><sup id="fnref-7" class="footnote-ref"><a href="#fn-7">*7</a></sup></dt>
  <dd></dd>
</dl>

日本に於ける総本山

### スクリプト {#v67b1dcd}

<dl>
  <dt><a href="http://www.autohotkey.com/docs/scripts/">AutoHotkey Script Showcase</a></dt>
  <dd></dd>
</dl>

スクリプトサンプル。


<dl>
  <dt><a href="http://www.autohotkey.com/wiki/index.php?title=Category:Scripts">AutoHotkey wiki - Category:Scripts - AutoHotkey</a> , <a href="http://www.autohotkey.com/wiki/index.php?title=Script_Listing">Script Listing - AutoHotkey</a></dt>
  <dd></dd>
</dl>

目当てのスクリプト（の記事）を見つけるのに[Forum](http://www.autohotkey.com/forum/)から検索<sup id="fnref-8" class="footnote-ref"><a href="#fn-8">*8</a></sup><sup id="fnref-9" class="footnote-ref"><a href="#fn-9">*9</a></sup>して探すのが大変なら、先ずこのページにあるリンクからあたってみましょう。 - 中には古い記事もあるので記事の日付け、内容に注意。


<dl>
  <dt><a href="http://lukewarm.s101.xrea.com/myscripts/index.html">AutoHotkeyを流行らせるページ → My Scripts</a></dt>
  <dd></dd>
</dl>

AutoHotkeyを流行らせるページの管理人さんが作成したスクリプト、ライブラリ各種。


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic8795.html">Tips N Tricks</a></dt>
  <dd></dd>
</dl>

various tips


<dl>
  <dt>[[VxE]'s := guide ? ( to the ternary ) : ( operator ) .](http://www.autohotkey.com/forum/topic29752.html)</dt>
  <dd></dd>
</dl>

三項演算子の HowTo
> 

```
The ternary operator is like an If/Else conditional, but packaged to fit inside an expression. 
```


<dl>
  <dt><a href="http://www.autohotkey.com/wiki/index.php?title=Tutorials">Tutorials - AutoHotkey</a></dt>
  <dd></dd>
</dl>

初心者～中級者～上級者それぞれのレベルの各種チュートリアルへのリンク


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic29204.html&sid=ebcf07a6f9ca4431d43648e931135b73">Tutorial for Newbies</a></dt>
  <dd></dd>
</dl>

初心者 &amp; ニューカマー向けの有用なチュートリアル


<dl>
  <dt><a href="http://www.autohotkey.com/wiki/index.php?title=AHK_Libraries">AHK Libraries - AutoHotkey</a></dt>
  <dd></dd>
</dl>

ライブラリについては [関数ライブラリスクリプト - AutoHotkeyを流行らせるページ](http://lukewarm.s101.xrea.com/Function.html#library) を参照されたし。

<dl>
  <dt><a href="http://www.autohotkey.net/<br />animeaime/ClassLibrary/">Class library</a></dt>
  <dd></dd>
</dl>

> 

```
The Class library is a toolset to add OOP (Object-Oriented Programming) to AHK
```

[Class library (OOP) - Help Thread](http://www.autohotkey.com/forum/topic42244.html) 、 [Class library (OOP) - Wish list / Bug reports thread](http://www.autohotkey.com/forum/topic40293.html) 、 [Introduction To OOP](http://www.autohotkey.net/~animeaime/ClassLibrary/docs/IntroToOOP.htm) / [OOP - プログラミングスレまとめ in VIP](/docs/OOP)


### DllCall {#ref-dll}

<dl>
  <dt><a href="http://www.autohotkey.com/wiki/index.php?title=API_Wrappers">API Wrappers - AutoHotkey wiki</a></dt>
  <dd></dd>
</dl>

WinAPI <sup id="fnref-10" class="footnote-ref"><a href="#fn-10">*10</a></sup>にアクセス出来ます。


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic12036.html">Windows Data Types lookup tool - Autohotkey forums</a></dt>
  <dd></dd>
</dl>

WinAPI関連：補助スクリプト


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic19766.html">Crazy Scripting : A handy tool to lookup Win32 Constants - Autohotkey forums</a></dt>
  <dd></dd>
</dl>

WinAPI関連：補助スクリプト　"W32C_R01.CSV is a listing of 11836 Constants"


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic33464.html">Easy WinAPI - WinAPI Parser, DllCall with single hotkey - Autohotkey forums</a></dt>
  <dd></dd>
</dl>

WinAPI関連：補助スクリプト


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic27644.html">StructParser (for C/C++ structs) - Autohotkey forums</a></dt>
  <dd></dd>
</dl>

補助スクリプト： →[Known Issues - Autohotkey forums](http://www.autohotkey.com/forum/post-172883.html&sid=9497a16de8656b80cdf59bb961cb2ec1#172883)


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic39649.html">Crazy Scripting : WinAPI Listing</a></dt>
  <dd></dd>
</dl>

WinAPI関連：補助スクリプト - リストからWinAPI関数を検索、MSDNライブラリの該当ページをブラウザで表示。


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic49016.html">Windows API Utilities</a></dt>
  <dd></dd>
</dl>

補助スクリプト - 上記の複数の補助スクリプトを取り込む形の発展形？スクリプト
> 

```
A program to look up an enumeration constant, 
data type or structure defined in the Windows API, 
and to parse a structure, which is useful for DllCall in AHK. 
```


<dl>
  <dt><a href="http://yak.myhome.cx/junks/#ahk">win32help.ahk (Win32 API 用ラッパ作成ヘルパスクリプト)</a></dt>
  <dd></dd>
</dl>

DllCall() のラッパ、構造体操作ラッパ、加えて定数定義を作成するためのヘルパスクリプト - Requires: C++ コンパイラ、 Win32 API のヘッダ


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic31078.html">OpenGL DllCalls - Autohotkey forums</a></dt>
  <dd></dd>
</dl>

OpenGL<sup id="fnref-11" class="footnote-ref"><a href="#fn-11">*11</a></sup> in AHK. 関連：[Zippos OpenGL - AHK 3D-Engine. - Autohotkey forums（独語）](http://de.autohotkey.com/forum/topic3977.html)→[操作解説（英語）-Keys - Autohotkey forums](http://www.autohotkey.com/forum/post-233842.html&sid=9d3510f63696c83c85be97d91f0a2253#233842)


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic32238.html">GDI+ standard library 1.26 by tic</a></dt>
  <dd></dd>
</dl>

GDI+ <sup id="fnref-12" class="footnote-ref"><a href="#fn-12">*12</a></sup> ：サンプル - [[examples+minituts] The GDI+ Examplecodes thread](http://www.autohotkey.com/forum/topic37859.html)


### COM {#ref-com}

<dl>
  <dt><a href="http://www.autohotkey.com/wiki/index.php?title=COM_Wrappers">COM Wrappers - AutoHotkey wiki</a></dt>
  <dd></dd>
</dl>

いくつかCOMラッパーの提供もされています。


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic22923.html">COM Standard Library - Autohotkey forums</a></dt>
  <dd></dd>
</dl>

> 

```
DOWNLOAD COM.zip or COM_L.zip (for AutoHotkey_L) or COM_U.zip (for AutoHotkeyU). 
```

> 
[Nov 26, 2009 1:39 am](http://www.autohotkey.com/forum/post-313585.html&sid=f11bb7bbcbc1e1f13b7440c392296b8d#313585) - Sean さん曰く:
> 

```
COM_L/COM_U are updated to chain COM_Term as part of the destruction routines. 
I was rather reluctant to do it inside the COM Library, however,
there was no other choice and seemed safe to do, so added it.
But, when encountering a crash of AHK during the termination of a script using COM Library,
please report here.
```


```
and COM_Wrap/COM_Unwrap, with the new Object version.
```


→ [関数ライブラリスクリプト](http://lukewarm.s101.xrea.com/Function.html#library)、[#Include](http://lukewarm.s101.xrea.com/commands/_Include.html) - [AutoHotkeyを流行らせるページ](http://lukewarm.s101.xrea.com/)


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic19225.html">Embed an Internet Explorer control in your AHK Gui via COM - Autohotkey forums</a></dt>
  <dd></dd>
</dl>

"This is a standard library for IE/WebBrowser controls."<br />
関連：[IE and Gui Browser Com Tutorial - Autohotkey forums](http://www.autohotkey.com/forum/topic34972.html)


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic51020.html">Basic Webpage Controls with JavaScript / COM - Tutorial</a></dt>
  <dd></dd>
</dl>

> 

```
This tutorial requires the COM Standard Library.
```

> 

```
The purpose of this tutorial is to teach the intermediate AHK user
how to start using the COM Standard Library to control webpages. 
My goal is to provide methods for controlling webpages,
similar to how the AHK Control Commands can control Windows Applications.
This tutorial is going to be high level,
but will provide links to those who want to dig deeper into these concepts.
You don't need to have much programming experience,
but I will assume you feel comfortable writing and executing AHK scripts.
```


<dl>
  <dt><a href="http://www.autohotkey.net/<br />easycom/">Windows Scripting for Autohotkey - official homepage</a></dt>
  <dd></dd>
</dl>

VBScript,JScriptの組み込み - "Embed VBScript or JScript directly in your Autohotkey programs." : 
[Embedded Windows Scripting (VBScript & JScript) and COM - official thread in the Autohotkey forums](http://www.autohotkey.com/forum/topic21674.html)


<dl>
  <dt><a href="http://lukewarm.s101.xrea.com/myscripts/index.html">AutoHotkeyを流行らせるページ → My Scripts → ActiveX</a></dt>
  <dd></dd>
</dl>

WSH等で使われるActiveXObjectを扱えるようにする

### ダメ文字問題対策 {#ref-ng-chars}

- [新・なまず日記(2006-01-11) - AutoHotkeyのダメ文字問題対策](http://www.tierra.ne.jp/~aki/diary/?date=20060111#p01)
- [(AutoHotkey)(IMEの制御をする 編) - もらかなです。](http://d.hatena.ne.jp/morakana/20080213/1202876561)
- [クリップボードを使わないで全角文字を貼付ける - eamatの日記](http://d.hatena.ne.jp/eamat/20050921/p1)
- [AutoHotkeyでマルチバイト(全角)文字を文字化けなしで出力する関数 - ﾅﾚｯｼﾞﾃﾞｰﾀﾍﾞｰｽ ﾓﾊﾞｲﾙ](http://it.kndb.jp/m/entry/id/1188)


<dl>
  <dt><a href="http://yak.myhome.cx/junks/#ahk.cp932">AutoHotkey駄目文字微対策版</a></dt>
  <dd></dd>
</dl>

1.0.48.03ベース（タイムスタンプ：2009年8月9日）
> 

```
ファイル名関連部分(のみ)について駄目文字対策を施した(つもりの)ものです。
文字列処理(正規表現も含む)には、依然として駄目文字等の Shift JIS を扱う際の問題が含まれています。
```


<dl>
  <dt>Unicode関係参考リンク</dt>
  <dd></dd>
</dl>


<dl>
  <dt><a href="http://yak3.myhome.cx:8080/junks/index.html#afx.afxscript">物置 &gt; あふすくりぷた - encutil.ahk</a></dt>
  <dd></dd>
</dl>

[AutoHotkey スレッド part8](http://pc12.2ch.net/test/read.cgi/software/1243005818/487) より～
> 

```
「あふすくりぷた」の中にある encutil.ahk に SJIS、UTF-8、UTF-16 間の相互変換関数
```


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic11178.html">Read and Write Unicode</a></dt>
  <dd></dd>
</dl>


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic10862.html">FileAppend Unicode text</a></dt>
  <dd></dd>
</dl>


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic11167.html">Reading € from a file</a></dt>
  <dd></dd>
</dl>


<dl>
  <dt><a href="http://www.autohotkey.com/forum/post-259543.html&sid=78fe86696f60a3e23cfd6997ec716777#259543">AutoHotkey_L (Lexikos' custom build)</a></dt>
  <dd>Revision 25 - March 30, 2009 - Support for Send {U+xxxx}. Character codes can be looked up using Windows' Character Map.</dd>
</dl>


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic44766.html">Easy Unicode functions</a></dt>
  <dd></dd>
</dl>

> 

```
I "discovered" a really easy way to send (paste) Unicode characters from your script.
```


> 

```
you must save this script as UTF-8 to make it work.
```


<dl>
  <dt><a href="http://www.autohotkey.com/forum/post-272379.html#272379">Easy Unicode functions</a> for AutoHotkey_L (Lexikos' build)</dt>
  <dd></dd>
</dl>

this script requires AutoHotkey_L

### デバッグ あれこれ {#c2514e63}

<dl>
  <dt><a href="http://lukewarm.s101.xrea.com/Scripts.html">AutoHotkeyを流行らせるページ → スクリプト → スクリプトのデバッグ</a></dt>
  <dd></dd>
</dl>

スクリプトが期待通りに動作しているかを確認するには


<dl>
  <dt><a href="http://lukewarm.s101.xrea.com/commands/OutputDebug.html">AutoHotkeyを流行らせるページ → リファレンス → OutputDebug</a></dt>
  <dd></dd>
</dl>

デバッガ（[DebugView](/docs/AutoHotKey#DebugView)など）に文字列を出力


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic7302.html">110.22 Ahk script Debugger 1.1.5b (line-by-line capable)</a></dt>
  <dd></dd>
</dl>

"An interactive AHk debugger"


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic23678.html">Debugging - Autohotkey forums</a></dt>
  <dd></dd>
</dl>

Debug helper スクリプト など


<dl>
  <dt>[Debug() [Func] - Autohotkey forums](http://www.autohotkey.com/forum/topic31416.html)</dt>
  <dd></dd>
</dl>

> 

```
if you're working with #Include files
function must be called from itself rather than calling from d.ahk
to show correct info for currently executing function/filename 
```


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic24397.html">debugging using A_LIneNumber - Autohotkey forums</a></dt>
  <dd></dd>
</dl>

RunDebugView.ahk - [DebugView](/docs/AutoHotKey#DebugView) を利用。


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic17316.html">Gui, Show bug - Autohotkey forums</a></dt>
  <dd></dd>
</dl>

Trace.ahk - [DebugView](/docs/AutoHotKey#DebugView) を利用。


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic36665.html">DebugBIF - debug built-in functions (was DllCallDebugger)</a> - for AutoHotkey v1.0.48</dt>
  <dd></dd>
</dl>

appropriate version of [LowLevel](http://www.autohotkey.com/forum/topic26300.html) are required.

## Tools {#c138c78c}


<dl>
  <dt><span id="DebugView">DebugView</span>（<a href="http://technet.microsoft.com/en-us/sysinternals/bb896647.aspx">DebugView for Windows - © Microsoft Corporation.</a>）</dt>
  <dd></dd>
</dl>

デバッグトレースを表示

<dl>
  <dt>使い方 - 参考：</dt>
  <dd><a href="http://keicode.com/windows/win15.php">差をつけるデバッグ術！ ～ 知られざるログ出力 - プログラミング徹底解説</a></dd>
</dl>


<dl>
  <dt><a href="http://www.dependencywalker.com/">Dependency Walker (depends.exe) Home Page</a></dt>
  <dd></dd>
</dl>

最新版：2.2.6000が入手できる<br />
[Dependency Walker 日本語化パッチ+α - G-PROJECT](http://www.gprj.net/wiki/index.php?title=Dependency_Walker_%E6%97%A5%E6%9C%AC%E8%AA%9E%E5%8C%96%E3%83%91%E3%83%83%E3%83%81%2B%CE%B1)<br />
[Dependency Walkerの文字化け対策 - G-PROJECT](http://www.gprj.net/wiki/index.php?title=Dependency_Walker%E3%81%AE%E6%96%87%E5%AD%97%E5%8C%96%E3%81%91%E5%AF%BE%E7%AD%96)<br />
[[SMS] Dependency Walker for Win32 (Depends.exe) について](http://support.microsoft.com/kb/198707/ja)


<dl>
  <dt><a href="http://www.nirsoft.net/utils/dll_export_viewer.html">DLL Export Viewer</a></dt>
  <dd></dd>
</dl>

システム内のdll/指定したdllの関数をスキャン


<dl>
  <dt><a href="http://jacquelin.potier.free.fr/winapioverride32/index.php">WinAPIOverride32</a></dt>
  <dd></dd>
</dl>

WinAPI、COM、.NETのモニタリング（and フッキング）ツール -  [COM Auto Monitoring](http://jacquelin.potier.free.fr/winapioverride32/doc/com_tools.htm)(see also [COM Options](http://jacquelin.potier.free.fr/winapioverride32/doc/com_options.htm)) , [.NET monitoring](http://jacquelin.potier.free.fr/winapioverride32/doc/net.htm) / 
[Tutorial Videos](http://jacquelin.potier.free.fr/winapioverride32/videos.php)

<dl>
  <dt><a href="http://jacquelin.potier.free.fr/dllexportfinder/">Dll Export Finder</a></dt>
  <dd></dd>
</dl>

指定したディレクトリのdllの関数をスキャン


<dl>
  <dt><a href="http://www.activevb.de/rubriken/apiviewer/index-apiviewereng.html">ActiveVB - ApiViewer (en)</a></dt>
  <dd></dd>
</dl>

WinAPIビューワー


<dl>
  <dt><a href="http://www.japheth.de/COMView.html">COMView</a></dt>
  <dd></dd>
</dl>

PSDK付属のOleView.Exeの代替として使用できるツール

<dl>
  <dt><a href="http://www.mitec.cz/Data/XML/data_downloads.xml">MiTeC OLE/COM Object Explorer</a></dt>
  <dd></dd>
</dl>

PSDK付属のOleView.Exeの代替として使用できるツール


<dl>
  <dt><a href="http://darksky.biz/index.php/Software/SPY%20for%20Internet%20Explorer">SPY for Internet Explorer</a></dt>
  <dd></dd>
</dl>

実行中のInternet Explorerで発生するイベントの監視(WebBrowser control)


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic48470.html">IE HTML Element Spy</a></dt>
  <dd></dd>
</dl>

> 

```
It retrieves the info of a DOM element under the cursor when the cursor is
hovering over Internet Explorer_Server.
```

> 
REQUIRE [COM Standard Library](http://www.autohotkey.com/forum/topic22923.html). 


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic51270.html&sid=9f2858f5d4264741f02bc003fd9b6a09">IE Web Recorder Developers Needed</a></dt>
  <dd></dd>
</dl>

> 

```
# iWebBrowser2 Learner - 
   This tool is under major development effort due to recent interest by 
   serious members of the forum. 
   This is intended to eventually turn into a web simple script writer
   much like the packaged script recorder for other applications
# iWeb Functions - 
   Very stable well tested library the relieves
   the user of intimate understanding DOM, COM, 
   or JavaScript to control a web site 
```


<dl>
  <dt>Winspector - Ultimate Windows Message Spy</dt>
  <dd></dd>
  <dt>Download</dt>
  <dd></dd>
</dl>

[Winspector install.](http://www.autohotkey.com/forum/post-312239.html#312239) , [(web.archive.org) - Winspector](http://web.archive.org/web/*/http://www.windows-spy.com/download/)

<dl>
  <dt>Tutorial</dt>
  <dd></dd>
</dl>

[[pictorial] Find WM_COMMAND parameter with Winspector](http://www.autohotkey.com/forum/topic40112.html)

<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic126.html">An Advanced Technique.</a></dt>
  <dd></dd>
</dl>

> 

```
Tutorial on posting messages to Windows
```


<dl>
  <dt>see also <a href="http://lukewarm.s101.xrea.com/misc/SendMessage.html">PostMessage/SendMessage Tutorial</a></dt>
  <dd></dd>
</dl>


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic8617.html">WinInfo Menu</a></dt>
  <dd></dd>
</dl>

> 

```
～ show the information about a window/control/Pixel in a menu form.
It is designed to be an alternative for window spy. 
```


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic8976.html">AHK Window Info 1.7</a></dt>
  <dd></dd>
</dl>

> 

```
This script will reveal information on windows, controls, etc. 
```


## mini info {#v3454dba}

<dl>
  <dt>AutoHotkey更新情報</dt>
  <dd></dd>
</dl>

[AutoHotkey Changes and New Features](http://www.autohotkey.com/changelog/) 、 
[AutoHotkeyを流行らせるページ → バージョンアップしたら上げるスレ](http://lukewarm.s101.xrea.com/bbs/#10)


<dl>
  <dt><span id="Compile_AHK2">Compile_AHK II</span>（<a href="http://www.autohotkey.com/forum/topic22975.html">Compile_AHK II - for those who compile! - Autohotkey forums</a>）</dt>
  <dd></dd>
</dl>

Update of 2008-11-05 以降、"No UPX"オプション(GUI)が付いています。（コンパイラそのものは公式サイトで配布されているものに標準で付いて来ます） - [Viruses found in executable after compile](http://www.autohotkey.com/forum/topic30084.html) , [Tutorial: How to compile .AHK files and include your own ico](http://www.autohotkey.com/forum/topic41058.html)


<dl>
  <dt>chm版リファレンス - <a href="http://lukewarm.s101.xrea.com/test/read.cgi/bbs/1092315194/127">スクリプト投稿スレ &gt; 127</a></dt>
  <dd></dd>
</dl>

『AutoHotkeyを流行らせるページ』のHTML HELP版、 v1.0.47.00 対応。


<dl>
  <dt><a href="http://www.autohotkey.net/<br />fincs/SciTE4AutoHotkey_2/web/">SciTE4AutoHotkey v2</a> stable</dt>
  <dd><a href="http://www.autohotkey.com/forum/topic40241.html">SciTE4AutoHotkey v2 - New SciTE4AHK version in the making</a> , <a href="http://www.autohotkey.com/forum/topic41503.html">SciTE4AutoHotkey v2 Stable - Released.</a></dd>
</dl>


<dl>
  <dt>full portable app</dt>
  <dd></dd>
</dl>

portableな環境で使えるようにして欲しい（←意訳） - http://www.autohotkey.com/forum/post-280902.html&sid=87b274429e4454ec26ce0d5151fa405b#280902<br />
save.recent、save.sessionの値を 0 に（無効に）する案 - http://www.autohotkey.com/forum/post-280984.html&sid=87b274429e4454ec26ce0d5151fa405b#280984<br />
別の方法 - 応急処置（SciTE4AutoHotkey2のバージョンが上がれば必要なくなるかもしれない）：<br />

```
;-- SciTELaunch.exe キック用 ------------
; SciTELaunch.exeと同じディレクトリに置く
EnvSet, SciTE_HOME, %A_ScriptDir% 
Run, %A_ScriptDir%\SciTELaunch.exe
Return
; ---------------------------------------
```


<dl>
  <dt>"SciTE4AutoHotkey v2" メニュー日本語化パック</dt>
  <dd></dd>
</dl>

[AutoHotokeyを流行らせるアップローダ](http://lukewarm.s101.xrea.com/up/index.php) - に UP しました。 - 117.zip （フォント指定の項目修正してみました）


<dl>
  <dt><a href="http://code.google.com/p/ironahk/">ironahk - Google Code</a></dt>
  <dd></dd>
</dl>

クロスプラットホーム向けに開発が進められているAutoHotkeyからのフォーク。<br />
Forum内のスレッド：[IronAHK - .NET port of AutoHotkey for Windows, Linux, Mac...](http://www.autohotkey.com/forum/topic34421.html)

<dl>
  <dt><a href="http://code.google.com/p/scite-4-ironahk/">scite-4-ironahk - Google Code</a></dt>
  <dd></dd>
</dl>

IronAHK 仕様の SciTE


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic43049.html">AutoHotkey.dll</a></dt>
  <dd></dd>
</dl>

binaries - [Autohotkey.dll](http://www.autohotkey.net/~tinku99/)<br />
source - [tinku99's ahkdll at master - GitHub](http://github.com/tinku99/ahkdll/tree/master)<br />
> 

```
Features:
* embed autohotkey in another program
* dynamically add #include type files to a running script
addFile(file). Functions and labels should work fine.
#Directives and Exit Routines may not work as expected.
* multithreading
```


<dl>
  <dt><a href="http://rosettacode.org/wiki/Category:AutoHotkey">Rosetta Code - Category:AutoHotkey</a></dt>
  <dd></dd>
</dl>

> 

```
Rosetta Code is a programming chrestomathy site.
The idea is to present solutions to the same task in as many different languages as possible,
to demonstrate how languages are similar and different,
and to aid a person with a grounding in one language in learning another.
```

面白い所では [Bogosort](http://rosettacode.org/wiki/Bogosort#AutoHotkey) , [Bubble Sort](http://rosettacode.org/wiki/Bubble_Sort#AutoHotkey) ,[FizzBuzz](http://rosettacode.org/wiki/FizzBuzz#AutoHotkey) なども掲載されている。 / [Challenge: translate rosettacode - Was promoting autohotkey](http://www.autohotkey.com/forum/topic44657.html)


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic36047.html">Sparrow: AHK WebServer w/ AHK in HTML support (sources incl)</a></dt>
  <dd></dd>
</dl>

> 

```
Sparrow is a webserver completly written in AHK,
which nativly supports AHK scrips being embedded in HTML. 
So called HKML files (pronounce H-Key-ML). The results are sent back to requested browser.
```


<dl>
  <dt><a href="http://www.autohotkey.com/forum/topic50485.html">UNICODE version AutoHotkey (needs your tests and helps)</a></dt>
  <dd></dd>
</dl>

> 

```
I just translated the source codes of AutoHotkey to support Unicode, and it can be built now.
However, it might be considered to be problematic and need your helps. 
```

"<strong>needs your tests and helps</strong>"


<div class="footnotes">
<hr />
<ol>
<li id="fn-1">[制御構造 - Wikipedia](http://ja.wikipedia.org/wiki/%E5%88%B6%E5%BE%A1%E6%A7%8B%E9%80%A0) , [Category:制御構造 - Wikipedia](http://ja.wikipedia.org/wiki/Category:%E5%88%B6%E5%BE%A1%E6%A7%8B%E9%80%A0) <a href="#fnref-1" class="footnote-backref">&#8617;</a></li>
<li id="fn-2">[Scratch Home imagine, program, share](http://scratch.mit.edu/) 、 参考 ： [非プログラマのためのプログラミング講座 - ＠IT](http://www.atmarkit.co.jp/fwcr/design/benkyo/program01/01.html) <a href="#fnref-2" class="footnote-backref">&#8617;</a></li>
<li id="fn-3">[DllCall() - AutoHotkeyを流行らせるページ](http://lukewarm.s101.xrea.com/commands/DllCall.html) <a href="#fnref-3" class="footnote-backref">&#8617;</a></li>
<li id="fn-4">[Component Object Model - Wikipedia](http://ja.wikipedia.org/wiki/Component_Object_Model) <a href="#fnref-4" class="footnote-backref">&#8617;</a></li>
<li id="fn-5">[エスケープ文字 - AutoHotkeyを流行らせるページ](http://lukewarm.s101.xrea.com/Scripts.htm#escape) <a href="#fnref-5" class="footnote-backref">&#8617;</a></li>
<li id="fn-6">[#EscapeChar - AutoHotkeyを流行らせるページ](http://lukewarm.s101.xrea.com/commands/_EscapeChar.htm) <a href="#fnref-6" class="footnote-backref">&#8617;</a></li>
<li id="fn-7">検索プラグインを作った方を発見：[「AutoHotkeyを流行らせるページ」の検索プラグインを作った - blooo](http://d.hatena.ne.jp/blooo/20090826/1250798532) <a href="#fnref-7" class="footnote-backref">&#8617;</a></li>
<li id="fn-8">検索用スクリプトの公開もされていたりします：[Quick Search for Autohotkey](http://www.autohotkey.com/forum/viewtopic.php?p=196070#196070) <a href="#fnref-8" class="footnote-backref">&#8617;</a></li>
<li id="fn-9">Firefox用検索プラグイン - english-forum,german-forum：[FF2+ Search Plugin](http://www.autohotkey.net/~DerRaphael/ff3/index_en.html) <a href="#fnref-9" class="footnote-backref">&#8617;</a></li>
<li id="fn-10">Windowsが提供するさまざまな機能:[Windows API - Wikipedia](http://ja.wikipedia.org/wiki/Windows_API) <a href="#fnref-10" class="footnote-backref">&#8617;</a></li>
<li id="fn-11">[OpenGL - Wikipedia](http://ja.wikipedia.org/wiki/OpenGL) <a href="#fnref-11" class="footnote-backref">&#8617;</a></li>
<li id="fn-12">[Graphics Device Interface - Wikipedia](http://ja.wikipedia.org/wiki/Graphics_Device_Interface#GDI.2B) <a href="#fnref-12" class="footnote-backref">&#8617;</a></li>
</ol>
</div>
