---
title: "Randsモジュール"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "Randsモジュール"
draft: false
---

[プログラミング言語/Ruby/コードリーディング/しりとりゲーム](/docs/プログラミング言語/Ruby/コードリーディング/しりとりゲーム)


# Randsモジュール {#ee74f079}

## リスト5-1 Rands 全コード {#x05ff5cd}

```
module Rands
  def bool_rand
    rand(2).zero?
  end
  module_function :bool_rand
  
  def array_rand(array)
    array[rand(array.size)]
  end
  module_function :array_rand
  
  def char_rand
    (rand(?z - ?a) + ?a).chr
  end
  module_function :char_rand
end
```


モジュールの記述の中にメソッドの定義が並んでいるが、
その前に書かれている一行「module_function」に言及しておく。

通常、モジュール内の実装はあるクラスにincludeして始めて意味を持つ。


```
 module Vip
   def ok
     print "おk"
   end
 end
```


というモジュールがあり、例えばStringクラスにincludeされると、


```
 class String
   include Vip
 end
 
 str = "abc"
 str.ok       #=> おk
```


と、Stringクラスの実装のように呼べる。

さて、JavaがMathクラスにstaticメソッドばかりを定義して
Math.sqrt(2)のような使い方を提供しているように、メソッドの「公式集」
のようなもの作る必要も出てくる。

Javaはクラスしかないんだから仕方ないのだが、
Mathクラスからインスタンスを生成する必要はないはずだ。が、Rubyには
インスタンスを作らないクラスのようなもの=モジュールがあるのでそれを使う。

そして、やっとmodule_functionの話に行き着くが、これはモジュールのメソッドを
Vip.okのような形でも呼べるように自動でしてくれるメソッドだ。
(このようなメソッドをモジュール関数と呼んだりする)

上のように引数なしで一行に書くとそれ以降のメソッド全てが対象に、

```
 module_function :ok
```

のようにメソッド名のSymbolを渡すとそのメソッドを対象に作業を行う。
(privateやpublicなどの可視性設定も似たような感じ)


## リスト5-2 Randsインタフェース {#n1c02c22}

```
module Rands
  def bool_rand
  def array_rand(array)
  def char_rand
```


上で長々と語ったとおり、module_functionのおかげで

```
 Rands.bool_rand
 Rands.array_rand(arr)
 Rands.char_rand
```

という形で使えるようになった。

そもそもモジュールにまとめなければ、
bool_randはトップレベルでのみ、
array_randはAutoPlayerでだけ、
char_randはManualPlayerだけでしか使用されていないのだから
こんな手間もいらないのだが、
乱数系のメソッドが「公式集」としてひとつのものに集まっているという
美しさのほうを取ることにした。


## リスト5-3 Rands.bool_rand {#l5b88b71}

```
 def bool_rand
   rand(2).zero?
 end
```

rand()はKernelモジュールに定義され、KernelはObjectクラスにincludeされている。
つまり関数的なメソッドである。
rands(n)で、0～n-1の間の整数をランダムに生成する。

rands(2)が出すのは0か1かだけなわけで、その結果から呼ばれているメソッド
Fixnum#zero?は、自身がゼロかどうかを返す。

つまり、このメソッドは(理想的には)半々の確立で真か偽かどちらかを返す。


## リスト5-4 Rands.array_rand {#s7c11cee}

```
 def array_rand(array)
   array[rand(array.size)]
 end
```

rand(array.size)は0～array.size-1の範囲の乱数生成だ。そしてこの範囲は
まさにarrayのインデックスの範囲である。

というわけで、これは引数の配列の要素をひとつランダムに返す。


## リスト5-5 Rands.char_rand {#p04e4d7c}

```
 def char_rand
   (rand(?z - ?a) + ?a).chr
 end
```


?aとか?zはRubyのリテラルの一種で、?cなら'c'という文字の文字コードを返す。
`文字コード'というものの実体は数値なのでRubyではFixnumである。そして、
Fixnum#chrというメソッドで"c"などの一文字を現すStringを返す。

つまり、rand(?z - ?a)は文字コードの'a'～'z'の幅で乱数を生成し、そこに?aを
足すことで文字コード'a'～'z'のいずれかをランダムに得て、Stringにして返す。
