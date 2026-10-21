---
title: "Ruby"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "Ruby"
draft: false
---

# Ruby / the genuine-object-oriented scripting language {#t2510f81}


<br />


## 言語の特徴 {#u83006d2}
Rubyがよく分類される言語としての位置づけは、

- 純オブジェクト指向言語
- 軽量言語
- UNIX指向言語


などが挙げられます。

三つ目の表現はあまり聞きなれないかもしれませんが、
RubyはUNIXで培われた文化を色濃く受け継いでいます。
UNIXコマンド、C言語ライブラリ関数、Perlライブラリルーチンあたりから
借用されたネーミングは数多く、それに馴染んでいる人ならば
容易に動作を予測できるでしょう。
(が、リファレンスはちゃんと見ましょう :-)

また、この特徴を抜きにしても、Rubyはある面では非常に保守的な
手続き型言語です。


## Rubyの導入 {#e68336e0}
[プログラミング言語/Ruby/インストール](/docs/プログラミング言語/Ruby/インストール)


### 動作を確認 {#t02614c7}
Windowsならコマンドプロンプト、UNIXならシェルに

```
 ruby -v
```

と訪ねてみましょう。インストールに成功していれば、
バージョン情報を教えてくれるはずです。


### Hello, world! {#jd458477}
定番ですな。


```
 print "hello, world!"
```


## 文法 {#fbed15f8}
などをさらっと流して書く。

[プログラミング言語/Ruby/言語ダイジェスト](/docs/プログラミング言語/Ruby/言語ダイジェスト)


## Rubyドキュメントでの慣習 {#k695d865}
メソッドとかを説明文中に表記するさい、
それなりに決まった流儀があります。
知っておくとマニュアルとかが読みやすい鴨。

- Hoge#piyo
- Foo.bar
- Vipper::IQ


上から順に、

- Hogeクラスのオブジェクトが持つpiyoというメソッド
- Fooクラスが持つメソッド(Javaでいうstaticメソッド)
- Vipperクラスが持つ定数IQ


ドキュメントの形式

- [プログラミング言語/Ruby/RD](/docs/プログラミング言語/Ruby/RD)
- [プログラミング言語/Ruby/RDoc](/docs/プログラミング言語/Ruby/RDoc)


## テキトーな用語集 {#afc6c832}

<dl>
  <dt>Matz</dt>
  <dd></dd>
</dl>

Rubyの生みの親であるまつもとゆきひろ氏のこと。


<dl>
  <dt>モルモン教</dt>
  <dd></dd>
</dl>

キリスト教の宗派。Matzはこの信者。よく煽りのネタにされたが、あまりにイジられすぎて、最早2chRubyスレの習慣と化しつつある。


<dl>
  <dt>Duck Typing</dt>
  <dd></dd>
</dl>

アヒルは、アヒルみたいに振舞うからアヒルとして認識されるんだぜ、という考え。つまりvipperがVipperクラスのインスタンスだからVipperなんだなー、と考える
のではなく、
aori()やtsuri()など、Vipperらしい振る舞いをする(メソッドを持つ)からこそ、そのvipperというオブジェクトはVipperなんだなー、と捉える考え。
静的型付け言語における「型」とはその名の通りコンパイル時に決定できる変数の情報であるが、Rubyのような動的型付け言語では「型」=「応答できるメッセージ」と考える、それがDuck Typing。たしかSmalltalk辺りに由来する。


<dl>
  <dt>関数</dt>
  <dd></dd>
</dl>

Rubyに関数なんてものはない。
…が、例えばトップレベルで定義されたメソッドはレシーバなしで

```
n = method()
```

のように書ける。そのようなメソッドを関数と呼び習わす。


## チュートリアル {#u90758fd}

- [プログラミング言語/Ruby/Rubyそぞろ歩き](/docs/プログラミング言語/Ruby/Rubyそぞろ歩き)


## コードリーディング {#xba33bd3}

- [プログラミング言語/Ruby/コードリーディング](/docs/プログラミング言語/Ruby/コードリーディング)
- [プログラミング言語/Ruby/練習問題解答例](/docs/プログラミング言語/Ruby/練習問題解答例)


## 周辺ツール／ライブラリ {#de42668e}
[プログラミング言語/Ruby/開発ツール・ライブラリ](/docs/プログラミング言語/Ruby/開発ツール-ライブラリ)


## 参考書籍・WEBページ {#l944f9dc}

- [オブジェクト指向言語Ruby](http://www.ruby-lang.org/ja/)
- [Ruby リファレンスマニュアル刷新計画 Wiki](http://redmine.ruby-lang.org/wiki/rurema)
- [RAA - Ruby Application Archive(英語)](http://raa.ruby-lang.org/)
- [Rubyist Magazine るびま](http://jp.rubyist.net/magazine/)
- [逆引きRuby](http://www.namaraii.com/rubytips/)
- [RubyGems.org](http://rubygems.org/)
