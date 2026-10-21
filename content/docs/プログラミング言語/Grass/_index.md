---
title: "Grass"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "Grass"
draft: false
---

# Grass {#v6c37ba3}


# Grass is a grass-planting programming language. {#c1f9ef3f}

Grassは「ちょっと草植えときますね型言語」である。Grassがどういう言語か理解するには、実際の譜例を見るのが早いだろう。以下はGrassで書かれた(あまり洗練されていない)Hello worldである。


```
wwvwwwWWWwwWwwWWWWwvwWWwwwWwwvwWwwwWwwvwWWwWWWWWwvwWWWwwwwWWWWwWWWWwWW
WWWWwWWWWWWWwWWWWWWWwWWWWWWWWwWwwwwwwwwvwWWWwwwwwWWWWWwWWWWWwWWWWWWWwW
WWWWWWWwWWWWWWWWWwWwwwwwwwvwWWWWwwwwwwWWWWWWwWWWWWWwWWWWWWWwWWWWWWWWWw
WWWWWWWWWwWwwwwwwwvwWWWWWwwwwwwwWWWWWWWwWWWWWWWWwWWWWWWWWwWWWWWWWWWWwW
WWWWWWWWWwWwwwwwwwvwWWWWWWWwwwwwwwwWWWWWWWWwWWWWWWWWWwWWWWWWWWWwWWWWWW
WWWWWwWwwwwwwvwWWWWWWWWwwwwwwwwwWWWWWWWWwWWWWWWWWWwWWWWWWWWWWWwWWWWWWW
WWWWwWWWWWWWWWWWWWwWwwwwwwwvwWWWWWWWWwwwwwwwwwwWWWWWWWWWwWWWWWWWWWWwWW
WWWWWWWWWwWWWWWWWWWWWWWwWwwwwwwvwWWWWWWWWWWwwwwwwwwwwwWWWWWWWWWWwWWWWW
WWWWWWwWWWWWWWWWWWWWwWwwwwwvwWWWWWWWWWWwwwwwwwwwwwwWWWWWWWWWWWWwWWWWWW
WWWWWWWwWWWWWWWWWWWWWWwWWWWWWWWWWWWWWwWWWWWWWWWWWWWWWWwWwwwwwwwvwWWWWW
WWWWWwwwwwwwwwwwwwwwwwWwwwwwwwwwwwwwwwwwwwWWWwwwwwwwwwwwwwwwwwwwWwwWWW
WWWWWWWWWWWWWWWWWwvwWWwwwwWWWwwwwwwwwwwWWWWwwwwwwwwwwWWWWWwwwwwwwwwwww
wWWWWWWwwwwwwwWWWWWWWwwwwwwwwwwwWWWWWWWWwwwwwwwwwwwwwwwwwwwwwwvwWWWWWW
WWWWWWWWWWwwwwwwwWwwvwWWWWwwwwwwwWWWWWwwwWWWWWWwwwwwwwWWWWWWWwwwwwwwwW
WWWWWWWwwwwwwwwwwwwwwWWWWWWWWWwwwwwwwwwwwwwwvwWWwWWWWWw
```


# 言語仕様 {#yb41e241}

## はじめに {#k25789b9}

もし「ラムダ計算」や「操作的意味論」という術語になじみがあるなら、[Grassの公式サイト](http://www.blue.sky.or.jp/grass/doc_ja.html)を参照した方が、この記事を読むよりも早く、正確な理解が得られるだろう。この記事は、関数型言語の経験のない人を想定して書く。

## プログラムの構造 {#sea007fe}

Grassのプログラムは、関数定義と関数適用(要するに関数の呼び出し)が並んだ形をしている。関数定義は、仮引数の宣言と、本体である関数適用の列から成っている。見た目の割に常識的な構造になっていることが分かると思う。

まず関数適用から見てみよう。

## 関数適用 {#m484d3fd}

関数適用の構文は以下の通り。


```
WWW...(m個)...WWWwww...(n個)...www   (ただしm,nは1以上)
```


つまり、一個以上のWの後に一個以上のwが続く形をしている。具体的にはWwwwとかWWWwwとか。

正式な構文はこの通りだが、このままでは余りに読み難いので、この記事ではこれをApp(m, n)と略記する。だからWWWwwはApp(3, 2)と書く。

さて、App(m, n)の意味は、「m個前に定義された値を、n個前に定義された値に適用する」だ。手続き型言語の言葉に直すと、「n個前に定義された値を引数として、m個前に定義された値を呼ぶ」となる。「値を呼ぶ」というのを不自然に感じるかもしれないが、後で分かるようにGrassの値は基本的に全て関数なので、それを呼んでいるだけだ。

「n個前に定義された値」とはどういうことかというと、それはGrassの変数の扱いに関連している。Grassの変数は全て無名である。名前が無いので、変数を参照するにはその位置を指定するしかない。具体的には、関数適用の書かれている場所を起点として、その直前で定義された変数を1番、その前を2番、などと参照する。

関数適用が書かれると、それに付随して一つの変数が暗黙に定義され、適用の結果(呼び出しの戻り値)がその変数に保存される。もちろんこの変数も無名である。これによって新しい変数が増えたので、以降の関数適用では変数の番号が一つずつ繰り上がる。

例として、次のような関数適用の並びを考える。


```
WWWWWWWWwwwwwwwWwWww
```


略記法で書くと、


```
App(8, 7)
App(1, 1)
App(1, 2)
```


これは、JavaScriptで言えば次のようなコードに対応する。


```
var a = ???(???);
var b = a(a);
var c = b(a);
```


???の部分には前に定義された何らかの変数の名前が入る。

## 関数定義 {#w11dab28}

次は関数定義を見よう。構文は以下の通り。


```
www...(n個)...www 関数適用*   (ただしnは1以上、*は0回以上の繰り返しを表す)
```


つまり、wが一個以上続いた後に関数適用が0個以上続いたものが関数定義だ。例としてはwWWwWWWwとか、wwwWwwとか、wwwwwといったものが考えられる。

最初のwの並びの部分は仮引数の指定に対応している。といっても引数の数だけwを並べるだけだ。例によって仮引数はすべて無名で、第一引数から順に並ぶ。だから最後の引数が最も若い番号で参照されることになる。

これに続く関数適用の並びは関数の本体で、関数が呼ばれたときに左から順番に実行される。関数の戻り値は、一番最後に定義された変数の値になる。つまり、関数本体が空でない場合は本体の最後の関数適用の結果が返り、空の場合は最後の引数がそのまま返る。

関数適用の場合と同様に、関数定義一つにつき一個の変数が暗黙に定義され、作られた関数がそこに保存される。

例として、次の関数定義を考える。


```
wwwWWWwWWWwwWWw
```


略記法で書くと、


```
www
  App(3, 1)
  App(3, 2)
  App(2, 1)
```


JavaScriptで考えるとこれは次のような定義に対応する。


```
var g = function(a, b, c) {
  var d = a(c);
  var e = b(c);
  var f = d(e);
  return f;
};
```


## 部分適用 {#f18a958f}

既に見たように、Grassでは多引数の関数を定義できる。一方、関数適用の構文では関数に一つの引数しか渡せない。ではどうやって多引数関数を呼ぶのだろうか。

Grassでは、一つの引数だけを渡して多引数関数を呼ぶことができる。n引数(n>1)の関数fが、xを引数として呼ばれると、fの本体はまだ実行されず、代わりに「fの第一引数をxに固定してできた、(n-1)引数の関数」が返る。だから、例えばjという二引数の関数をa,bの二つの値に適用したいなら、まずaにjを適用して新しい関数j_を得て、次にj_をbに適用すればいい。

同じことを逆から見ると、Grassには多引数関数は存在しないと考えることもできる。この場合、n個の引数を持つ関数定義は「関数を返す関数を返す関数を…返す関数」というn重にネストした関数(カリー化された関数)を作っているだけだとみなす。

例として次の関数定義を考える。


```
www
  App(2, 1)
  App(4, 1)
```


カリー化された関数の定義と見なすと、これは以下のJavaScriptコードに対応する。


```
var f = function(a) {
  return function(b) {
    return function(c) {
      var d = b(c);
      var e = a(d);
      return e;
    };
  };
};
```


## Grassプログラム {#meddee3c}

Grassのプログラムは、おおざっぱに言うと、関数定義と関数適用をvで区切って並べたものだ。ただし、関数適用が連続する場合はvで区切らなくても良い。厳密な構文を以下にBNF風に示す。


```
プログラム ::= 関数定義 | プログラム v 関数定義 | プログラム v 関数適用*
```


つまり、プログラムが関数適用から始まっていてはいけない。また、空のプログラムは許されない。

プログラム中に直接現れる関数定義と関数適用を、関数定義の中の関数適用と区別するために「トップレベル」の要素と呼ぶことにしよう。

プログラムは左から順に実行される。トップレベルの関数定義と関数適用が全て実行された後、トップレベルの変数のうち最後に(つまり最も右で)定義されたものが、自分自身を引数として呼ばれる。この呼び出しが返るとプログラムは終了する。

簡単なプログラムの例を見てみよう。


```
wWwvWw
```


```
w
  App(1, 1)
v
App(1, 1)
```


これは次のようなJavaScriptプログラムに翻訳できる。


```
var c = function(a) {
  var b = a(a);
  return b;
};
var d = c(c);
d(d);
```


なお、このコードはcの呼び出しの時点で無限ループし、最終行には到達しない。

意味を考えても分かる通り、関数内で定義された変数をトップレベルから参照することはできない。変数を指定するための番号にも数えない。

逆に、関数定義の中から、それより前のトップレベルの定義を参照することはできる。関数の最初の引数よりもさらに「一つ前」の変数を参照すれば、その関数の直前に定義されているトップレベルの変数を参照したことになる。例として、下のプログラムを考えてみる。


```
ww // d
v
ww // c
  App(3, 1)
  App(1, 3)
v
ww // b
  App(2, 1) // a
  App(1, 5) // ☆
v
App(1, 2)
App(1, 4)
```


☆とコメントされた関数適用の位置から見ると、参照できる変数は、近い方から順に、関数適用aの結果(1)、bの第二引数(2)、bの第一引数(3)、cで定義された関数(4)、dで定義された関数(5)、となる。

## プリミティブ {#a9f5dd63}

Grassの構文は以上で全てだが、これだけでは入出力ができない。Grassでは、入出力のための特殊な値が予めプリミティブとして用意されている。プリミティブは、プログラムの最初のトップレベル定義よりも更に前に定義されているかのようにして使う。プリミティブは以下の四つで、この順に並ぶ。つまりOutが最も小さい番号で参照される。


<dl>
  <dt>In</dt>
  <dd>入力を読む関数。任意の値を引数として受け付け、標準入力から一文字読み、その文字を返す。EOFに達した場合には引数をそのまま返す。</dd>
  <dt>w</dt>
  <dd>文字「w」(文字コード119)。</dd>
  <dt>Succ</dt>
  <dd>文字の「次」を返す関数。与えられた文字の文字コードに1を足したコードに対応する文字を返す。255番の文字が与えられたときには0番の文字を返す。</dd>
  <dt>Out</dt>
  <dd>文字を出力する関数。与えられた文字を標準出力に書き出し、その文字を返す。</dd>
</dl>


OutとSuccに渡す引数は文字でなければならない。文字でない値を渡した場合、プログラムは異常終了する。

ここでいう「文字」とは、通常の関数と区別される特別な値で、0から255までの各整数にそれぞれ対応する256種類がある。文字を関数として呼ぶこともできて、その場合、引数の値が自分自身と同じ文字なら関数Tを、そうでなければ関数Fを返す。TとFの定義は以下のとおり。


<dl>
  <dt>T</dt>
  <dd>二つの引数を取り、第一引数を返す。</dd>
  <dt>F</dt>
  <dd>二つの引数を取り、第二引数を返す。</dd>
</dl>


プリミティブを使ったプログラムの例を見てみよう。次に示すのは、標準出力に「x」と表示するプログラムだ。


```
w
  App(3, 4)
  App(3, 1)
```


## 字句構造 {#pd8598a4}

Grassプログラムで意味のある文字はw、W、vの三つである。全角のｗ、Ｗ、ｖも同じ意味に扱われる。プログラムにはこれ以外の文字が含まれていても良いが、それらは全て無視される。

Grassプログラムは常にwから始まる。最初のwの前にWやvがあった場合、それは無視される。

## 終わり {#p9606266}

Grassの言語仕様は多分これで全部である。あとは頑張って草を生やしてね！

# リンク {#m0750be8}

[公式](http://www.blue.sky.or.jp/grass/doc_ja.html)
