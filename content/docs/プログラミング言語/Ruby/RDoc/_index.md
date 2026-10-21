---
title: "RDoc"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "RDoc"
draft: false
---

[プログラミング言語/Ruby](/docs/プログラミング言語/Ruby)

# RDoc {#d777ceb5}
RDocとは、JavaのJavaDocのような、ソース中のコメントを解析して
生成されるRubyドキュメント形式です。

このドキュメント生成ユーティリティはRuby本体に標準添付され、
コマンドラインからrdocで呼び出せます。

処理できるのは、Rubyスクリプトはもちろん、Ruby用拡張ライブラリの
C言語ソースコードも扱えます。
(なぜか、Fortran99にも対応しています :-)


## 使い方 {#x4c7bde9}

```
$ rdoc
```

で、カレントディレクトリ以下のソースコードをすべて解析して
doc/というディレクトリにHTML形式とri形式のドキュメントを生成します。


## 基本的な書き方 {#q1d596cc}
「#」によるコメント行の連続をひとつのかたまり(ブロック)として扱います。


```
# ファイル先頭のブロック:
# 	ファイルについてのドキュメント
# 

# クラス定義前のブロック:
# 	クラスについてのドキュメント
# 
class SomeClass
  # メソッド定義前のブロック:
  # 	メソッドについてのドキュメント
  # 
  def some_method(arg)
    ...
  end
end
```


ただ説明を書いておくだけでも有効なドキュメントになるのは
間違いないですが、このブロック中にはSimpleMarkupと呼ばれる
専用のマークアップ文法が使えます。


## SimpleMarkup {#qca52b12}
Wiki文法のような、シンプルな記号と字下げによる
マークアップです。

ブロック内で、同じ数だけ字下げされた行の連続が
ひとつの段落として扱われ、より字下げしている
テキストは整形済みテキストとして扱われます。


```
# 読みやすさの関係から、
# 段落はこうして、一字下げて書かれることが多いようです。
#   ここはより字下げされているので整形済みとして扱われる
#   require 'hoge/piyo'
#   
#   class Example < Hoge::Piyo
#     ...
#   end
```


### 見出し {#ice9565a}
段落を`='から始めます。

```
# = HeadLine-1
# == HeadLine-2
# === HeadLine-3
# ==== HeadLine-4
# ===== HeadLine-5
# ====== HeadLine-6
```


### リスト {#ge5552ac}
`*'あるいは`-'で始めた行の連続。

```
# = Features of Ruby
# * genuine-object-oriented
# * made in japan
# * duck typing
```

「数字+`.'」で始めると番号付きに、

「アルファベット+`.'」で始めるとアルファベット順リストになる。

説明リストは、[Term]Descriptionと書く。

```
# [Ruby] The genuine-object-oriented,
#        light-weight, scripting language.
```


### 文中要素(インライン) {#s59a9208}

<dl>
  <dt>リンク</dt>
  <dd>クラスやメソッド名には、そのドキュメントへのリンクが張られます。</dd>
</dl>

http:やmailto:、ftp:にURIを続けてもリンクとして解釈されます。
画像ファイルへのリンクはインライン表示に変換されます。

以下のインラインは[A-Za-z]の纏まりによる単語(以下word)
に対して使用できます。

|装飾|書式|相当するタグ|
|---|---|---|
|太字|*word*|<b>|
|強調|_word_|<em>|
|キータイプ|+word+|<tt>|

この書式ではなく、相当するタグで囲っても(入れ子にしない限り)
きちんと処理されます。


### RDoc化の制御 {#h92f3cd6}
ブロック中で行を`--'から始めると、その行からRDocとしての
取り扱いをしません。それは`++'から行を始めることによって
再開されます。

```
# Rubyは純オブジェクト指向スクリプト言語です。
# スクリプト言語の手軽さと、オブジェクト指向言語の強力な開発力を
# 兼ね備えます。
#--
# ただ構文木インタプリタだから遅いのが玉に瑕。1.9からはYARVという
# バイトコードインタプリタになって(そこそこに)早くなる。
# というかIOとかのオーバヘッドで処理系の遅さなんて吹き飛んじゃう
# じゃないかよ、どいつもこいつも遅い遅いって…ぶつぶつ。
#++
# さぁ、皆さんもLet's enjoy Ruby!
```


他には、ドキュメント修飾子を使う方法があります。

ドキュメント修飾子とは、モジュールやクラス、定数や
属性(attr系メソッドの実行)など、RDocの対象になるものの
脇に書いたコメント内で使うものです。

```
class Hoge
  module Hidden  #:nodoc:
    #このモジュールはRDocにされない
    ...
  end
  
  private
  
  def private_method  #:doc:
    #プライベートメソッドだけど特別RDocにされる
    ...
  end
end
```


# 参考 {#fbbc8c50}

- [プログラミングRuby 第2版 言語編](http://ssl.ohmsha.co.jp/cgi-bin/menu.cgi?ISBN=4-274-06642-8)<sup id="fnref-1" class="footnote-ref"><a href="#fn-1">*1</a></sup> - 第16章 Rubyのドキュメントを書く
- [The RWiki - RDoc覚え書き](http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=view;name=RDoc%B3%D0%A4%A8%BD%F1%A4%AD)



<div class="footnotes">
<hr />
<ol>
<li id="fn-1">俗に言うピッケル本 <a href="#fnref-1" class="footnote-backref">&#8617;</a></li>
</ol>
</div>
