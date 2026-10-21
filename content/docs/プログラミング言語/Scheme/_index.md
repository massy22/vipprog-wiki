---
title: "Scheme"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "Scheme"
draft: false
---

# Scheme {#id4921b9}


# はじめに {#n0265760}
「Scheme？聞いたことねぇな」と思いのそこのあなた。<br />
ちょっと立ち寄ってみませんか？<br />
<br />
Schemeの基礎の基礎から初めてScheme中級者（世に存在する難しめのScheme解説サイトを見て理解できるくらい）を目指します。

# 言語の特徴 {#fa6921f3}
Perlなどと同じスクリプト言語である。<br />
プログラム全体が「リスト構造」という構造を持っている。（分かりやすく言うと、プログラム全体がカッコでくくられた一つのリストになっている）<br />
Perlの代わりに使ってcgiとかも書けちゃう。<br />
C等より抽象度が高い。（例えば整数の実装が表に出ておらず、100!を計算するときに「intだと溢れるから･･･」などと悩まなくてよい）<br />
その他難しいことはよく知りません。

# 処理系のインストール {#x5131cfe}
Schemeは言語仕様の小ささも売りであり、そのため多くの実装が存在します。<br />
ここではGaucheという処理系を使うことにします。<br />
<br />
## Gaucheのインストール(Windows) {#p3d7ac56}
[Gauche公式](http://www.shiro.dreamhost.com/scheme/gauche/index-j.html)のダウンロードから、下の方にある"コンパイル済Windows用バイナリ (実験中)"をダウンロードします。<br />
んで解凍しておしまい。<br />
binの中にあるgosh.exeを実行して

```
gosh>
```

と表示されたらOK<br />
（のちのち便利なように gauche/bin/ にPATHを通しておきましょう。PATHの通し方については[ここ](http://pocketstudio.jp/win/xp/path.html)を参照。)<br />
<br />
## Gaucheのインストール(Windows以外) {#qa451660}
同じく[Gauche公式](http://www.shiro.dreamhost.com/scheme/gauche/index-j.html)のダウンロードから、ソースを落としてmakeしてください。<br />
詳しくはダウンロードページに書いてあります。<br />
MacOS X上でも動くらしいです。<br />
<br />
# とりあえず動かそう {#t99c1dad}
## Hello,World {#n2630372}
慣例に従って"Hello,World"と表示するプログラムを書いてみましょう。


```
(display "Hello,World")
(newline)
```


これを適当な名前で保存し、（拡張子は.scmにするのが一般的なようです）コマンドプロンプトから

```
gosh D:/programs/scheme/test.scm
```

などととしてください。<br />
（gosh.exeのあるフォルダにPATHが通っていることを想定しています。分からない方は[ここ](http://pocketstudio.jp/win/xp/path.html)を参照。）<br />
<br />
ちなみに、UNIX系OS上では、ファイルの一行目に

```
#!/usr/local/bin/gosh
```

としてtest.scmを実行可能にすることでtest.scmを直接実行できます。<br />
<br />
## 解説 {#ya5dce36}

```
(display "Hello,World")
```

見たとおり、displayという関数（Schemeでは手続きという）を、 "Hello,World" という引数で呼び出しています。<br />
Schemeでは手続きを呼ぶときに

```
(手続き名 引数1 引数2 … 引数n)
```

とします。

```
(newline)
```

改行を表示します。<br />
<br />

## むずかしめの解説 {#ned8d11b}
むずかしめの解説です。おもいきり読み飛ばしてOKです。<br />
<br />
言語の特徴のところで「プログラム全体がカッコでくくられた一つのリストになっている」と書きました。<br />
しかしこのプログラム、どうみても(display "Hello,World")と(newline)の二つのリストからなっています。

<br />
実はこのプログラムは、

```
((lambda () (begin
 (display "Hellow,world")
 (newline)
)))
```

の略記だと考えることが出来ます。これで全体が一つのカッコにくくられたリスト(「リストのリストのリスト」くらい？）になりましたね。<br />
いきなりわけが分からなくなりましたが、今はこのコードを理解する必要はありません。<br />
後に関数呼び出しやlambda式をやると理解できます。<br />
<br />

# 計算してみよう {#k0b233e2}
## 対話式実行 {#n2b91510}
次は計算をさせてみましょう。<br />
ですがその前に、対話式実行というのを説明します。(たいしたことではないですが･･･)<br />
今回はgoshにファイル名を渡すのではなく、goshを単体で起動してください。


```
gosh>
```


と表示されるはずです。<br />
このウィンドウ上でプログラムを1行づつ打ち込み、実行させることを「対話式実行」と言ったりします。<br />
<br />

## 計算しよう {#c5fd49de}
goshを起動し、(+ 1 2)と打ち込んでエンターを押してください。

```
gosh>(+ 1 2)
3
```

このようになるはずです。<br />
<br />
これを見て色々思い浮かぶでしょうが、一つ一つ見ていきましょう。

- (1 + 2)じゃないの？

Schemeでは「ポーランド記法」という書き方を使いますので(+ 1 2)となります。<br />
簡単に言うと、

```
(演算子　被演算子1　被演算子2　…　被演算子n)
```

の形に式を書けばよいです。(詳しく知りたい方は検索してください。)<br />
例えば {-b＋√(b^2-4ac)} / 2a は

```
(/ (+ -b (√ (- b^2 4ac)))  2a)
```

などとなるでしょう。(これは正しいScheme式の書き方ではありません。ポーランド記法の一例です。)<br />
<br />

- 外側のカッコは何？

この式の意味は、「+という手続きを、1と2を引数にして呼び出す」ということです。<br />
(これはたとえではなく本当の話です。Schemeでは + は基本構文ではなく定義された手続きで、自分の好きなように再定義できます。)<br />
Schemeでは関数呼び出しは外側にカッコをつけることになっていますので、カッコがいります。<br />

1. という関数があって、+(1,2) を計算したと思えばいいでしょう。<br />

<br />

- (display (+ 1 2))じゃないの？

対話式実行時は、Scheme処理系は「与えられたリストを評価して、評価結果を印字する」ということを行います。<br />
なのでdisplayは必要なく、答えが3になる式を与えれば3と表示されます。<br />
（HelloWorldの時のようにファイル名を与えて実行するなら、display (+ 1 2))でよいです。）<br />
<br />

# 手続きを定義しよう {#n917d5cf}
計算もできたので、今度は手続き（一般に言う関数）を定義してみましょう。<br />
まず下のコードをエディタで打ち込んで保存してみてください。

```
(define (inc x)
 (+ x 1)
)
```

<br />
## 実行しよう {#h4823dfc}
goshを単体で起動し、今作ったプログラムをloadします。

```
gosh>(load "D:/programs/scheme/inc.scm")
#t
```

となるはずです。注意事項として、windowsではディレクトリの区切りに \ を使いますが、gaucheでは / でないと認識してくれません。<br />
<br />
ちなみに#tは(load …)を「評価した結果」です。（Schemeでは全ての式は評価されてなんらかの結果を返します。）<br />
さしあたりは「Cで関数が成功したら1が返ってくるようなもの」だと思えばよいでしょう。#tというのはtrueの意味です。<br />
<br />
loadが出来たら実行します。

```
gosh>(inc 1)
2
gosh>(inc 10)
11
```

などとなります。<br />
（カッコを忘れないことと、inc(1)ではないことに注意。）<br />
ちなみに言語の特徴のところでも書きましたが、

```
gosh>(inc 10000000000000000000000000000000000000000000000)
```

としてもあふれてマイナスになったりしません。

## 解説 {#j054fccd}

```
(define (inc x)
```

incという手続きを、次に与えるリストで定義します。<br />
xは仮引数と呼ばれ、C風に書くと

```
int inc(int x);
```

のxにあたります。<br />
<br />

```
(+ x 1)
```

これは 計算しよう でやったのと同じです。<br />
この式を評価するとxに1を足したものになります。<br />
<br />

```
)
```

defineの終わりです。前にも書いたとおりプログラム全体が一つのリストになっているのが分かるかと思います。<br />
<br />

# 基本構文 {#ede79fdb}
手続きを定義して呼び出す方法をやりました。<br />
次はプログラムをする上で必要なifなどの構文についてです。<br />
<br />
## 全ては評価される {#ia022369}
ifなどをやる前に、評価されるとはどういうことかをやります。ちょっと難しいかも。<br />
Schemeでは全ての式は評価されて何らかの値（または別の式）を返します。<br />
例えば、Cでは

```
if(x>=0){
 printf("xはプラスです");
}
else{
 printf("xはマイナスです");
}
```

は、x≧0の時は上側のパスを、それ以外のときは下側のパスを通ってプログラムが実行されると考えます。<br />
しかし、Schemeで上と同じコードを（Schemeの文法に則って）書いたとすると、
「評価すると条件が真なら printf("xはプラスです") が、偽なら printf("xはマイナスです") が返る」ような式ができあがります。<br />
<br />
分かりにくいですね。先にifのところを読んで例を見てからもう一度読んでもらえれば分かるかもしれません。

<br />
<br />
## if {#x68dbbef}
構文

```
(if 条件 式1 式2)
```

条件が真なら式1が、偽なら式2が返ります。<br />
条件設定は一つだけで、else ifとかにあたるものは次のcondの方で実現されます。<br />
<br />
例1：

```
(define (abs x)
 (if (>= x 0) x (* -1 x))
)
```

xの絶対値を返すプログラムです。条件ももちろんポーランド記法で書きます。<br />
<br />
例2：

```
(define (abs2 x)
 (* (if (>= x 0) 1 -1) x)
)
```

xの絶対値を返すプログラムその2です。<br />
これは全ての式が評価されることを理解するよい例です。<br />
処理系は(if (>= x 0) 1 -1)を評価し、(>= x 0)が成り立てば（さらに言えば、(>= x 0)を評価して#t(真)が返れば）1を返し、そうでなければ-1を返します。<br />
Cで書くとすれば(if …)は

```
(x>=0 ? 1 : -1)
```

となるでしょうか。<br />
<br />
例3：<br />
評価した結果は数字や式（例1での(* -1 x)など）だけではなく、手続きになることもできます。（これは難しいかもしれないので読み飛ばしてもよいです）<br />

```
(define (abs3 x)
 ((if (>= x 0) identify abs) x)
)
```

但し

```
(define (identify x) x)
```

(if …)は(>= x 0)が成り立てばidentifyになるので、全体として(identify x)となりxが、<br />
成り立たなければabsになるので(abs x)となり|x|が返ります。<br />
（別にはじめから(abs x)とすればよいのですが、まぁ例なので。）<br />
<br />

## cond {#p15b0213}
構文

```
(cond (条件1 式1) (条件2 式2) … (条件n 式n))
```

条件を1から順番に評価し、一番最初に成り立ったもの（#tを返したもの）に対応する式を返します。<br />
<br />
例1：

```
(define (divide2 x)
 (cond
  ((odd? x) x)
  ((even? (/ x 2)) (/ x 4))
  (else (/ x 2))
 )
)
```

xが奇数ならxを、それ以外で（つまりxが偶数で）x/2が偶数ならx/4を、それ以外（つまりxは偶数でx/2は奇数）ならx/2を返します。<br />
odd?とeven?ははじめから定義されている手続きで、(odd? x)はxが奇数なら#tを、(even? x)はxが偶数なら#tを返します。<br />
<br />
最後の条件であるelseは意味的にはC等のelseと同じです。<br />
式の評価という観点から見ると、elseは常に真を返すといえます。<br />
つまり、

```
(define (divide2 x)
 (cond
  ((odd? x) x)
  ((even? (/ x 2)) (/ x 4))
  (#t (/ x 2))
 )
)
```

と書いても同じ結果がえられます。<br />
<br />
例2：

```
(define (divide2-2 x)
 (/ x (cond ((odd? x) 1) ((even? (/ x 2)) 4) (#t 2)))
)
```

divide2と同じ結果を生じます。<br />
(cond …)が評価されてxを割る数が決まるわけですね。<br />
「式が評価されて結果が返る」ということがだいぶ分かってきたでしょうか？<br />
<br />
## begin {#bdf5b1a7}
構文

```
(begin 式1 式2 … 式n)
```

beginは与えられた式を1から順に最後まで実行します。<br />
beginを評価した結果は、式nを評価した結果と同じになります。<br />
<br />
例1：

```
gosh>(begin (display "test") (newline) #t)
```

画面にtestと表示して改行し、#tを返します。<br />
実行すると、評価された結果も印字されるので、

```
gosh>(display-test)
test
#t
```

となります。<br />
begin式を評価した結果は最後の式を評価した値と同じになりますから、

```
gosh>(if (begin (display "test") (newline) #t) 1 0)
test
1
```

のようになります。<br />
まずdisplayとnewlineを実行したのでtestと改行が印字されます。<br />
次にbeginの評価結果は#t（真）ですからifの条件が成り立ち、if式の評価結果が1となって1が印字されます。<br />
<br />
## #tと#f {#ra8cc83d}
今までなんとなく使ってきた#tですが、ここで一応説明しておきます。<br />
これらは評価されると、#tは真を、#fは偽をあらわします。
つまり、

```
gosh>(if #t 1 0)
1
gosh>(if #f 1 0)
0
```


ということです。<br />
<br />
## 二項演算子 {#w6577155}

```
(演算子 引数1 引数2)
```

の形で、評価されると計算結果または真偽を返します。<br />

1. 、-、*、/、=、>、<、>=、<=、and、orがあります。<br />

（但し+、*、and、orは3つ以上の引数を取れます。）<br />
<br />
厳密にはこれらは演算子ではなく手続きなのですが、演算子だと思って実用上問題はありません。<br />
<br />
## 単項演算子 {#u7e40be8}

```
(演算子 引数)
```

の形で、評価されると真偽を返します。<br />
not、number?、null?などがあります。<br />
（これらも本当は手続きですが演算子だと思って問題ありません。）<br />
<br />
Cでは !1 は偽、 !0 は真ですが、Schemeでは

```
gosh>(not 1)
#f
gosh>(not 0)
#f
```

のように両方とも偽になります。<br />
これは「評価して値が返ってきたものは#tとみなす」からです。

```
gosh>(if 1 #t #f)
#t
gosh>(if 0 #t #f)
#t
```

但し、もちろん#fのnotは#tですので

```
gosh> (not (if #t #f #t))
#t
```

となります。<br />
<br />
## 文字と文字列 {#raa6429b}
例えば引数がnameなら名前を、ageなら年齢を表示するにはどうしたらよいでしょうか？<br />
試しに次のようにしてみましょう。<br />
<br />
例1：

```
(define (private-information type)
 (cond
  ((= type name) Hiroyuki)
  ((= type age) 1000000)
  (#t Error)
 )
)
```

このプログラムは大いに問題ありですが、ともかくloadは成功します。<br />
（なぜ成功するかはすぐ後で明らかになります。）<br />
<br />
では実行してみましょう。

```
gosh> (private-information name)
*** ERROR: unbound variable: name
```

nameが見つからないといわれてしまいました。<br />
これは処理系が「nameという名前の変数を探しにいったから」です。（変数については次々節：変数を使おうを参照）<br />
そんな変数は定義していないので当然見つかりません。<br />
（逆に言うと、もしnameやらageやらErrorやらがdefineされていたならば、エラーは起こりません。つまりこのプログラムを見ただけではおかしいのかおかしくないのか判断がつかないわけです。loadしたときに処理系がおかしいと言ってこなかったのはそういう理由です。）<br />
<br />
Schemeでは変数名と文字列を区別するために、文字列は手続き(quote)を通します。
また、文字列と文字列が等しいかどうかを見るには = ではなく手続き eq? を使います。<br />
<br />
例2：

```
(define (private-information type)
 (cond
  ((eq? type (quote name)) (quote Hiroyuki))
  ((eq? type (quote age)) 1000000)
  (#t (quote Error))
 )
)
```

loadして実行すると、

```
gosh> (private-information (quote age))
1000000
gosh> (private-information (quote name))
Hiroyuki
```

となります。正しく動きました。<br />
（引数として与える文字列もquoteを通さないといけないことに注意です。）<br />
<br />
しかし、いちいち(quote …)と書くのは面倒なので、簡略化した書き方が用意されています。<br />
それが「'」です。<br />
<br />
例3：

```
(define (private-information type)
 (cond
  ((eq? type 'name) 'Hiroyuki)
  ((eq? type 'age) 1000000)
  (#t 'Error)
 )
)
```

このプログラムは例2と同じ結果を生じます。<br />
呼び出すときも(private-information 'age)のように ' を使うことができます。<br />
<br />
注：

```
gosh> (eq? (quote test) 'test)
#t
```

<br />
# ちょっと複雑なことをしてみよう {#r994155f}
では今までのことを使って多少複雑なプログラムを書いてみましょう。<br />
例1：

```
(define (factorial n)
 (if (= n 0) 1 (* n (factorial (- n 1))))
)
```

n!を返します。<br />
このように再帰呼び出しもできます。<br />
<br />
例2：

```
(define (pascal x y)
 (cond
  ((or (= y 0) (= y (+ x 1))) 0)
  ((= x 1) 1)
  (#t (+ (pascal (- x 1) (- y 1)) (pascal (- x 1) y)))
 )
)
```

パスカルの3角形のx行y列の値を返します。<br />
<br />

# 変数を使おう {#gf0f61ee}
次は変数を使ってみましょう。<br />
## グローバル変数 {#a3d76242}

```
(define 変数名 値)
```

で変数を定義することができます。<br />
<br />
例1：

```
gosh>(define a 10)
a
gosh>(+ a 1)
11
```

となります。<br />
<br />
またいくつか疑問が湧きそうですのでみていきましょう。

- 手続き定義の式とそっくり、ってか同じじゃない？

そうです。<br />
(define a b)は、文字通り「aをbで定義する」という意味です。<br />
ですから(define a 10)とすれば以後処理系はaを10だと思いますし、<br />
(define (inc x) (+ x 1))とすれば(inc 5)を(+ 5 1)だと思って6を返します。

- aをdefineした直後に表示される a って何？

全ての式は評価されるということを書きました。そして対話式実行時は評価された結果は印字されます。<br />
つまり(define …)の返り値が第1引数をあらわす文字だというだけです。

```
gosh>(+ 1 (define a 10))
*** ERROR: operation + is not defined between 1 and a
```

<br />
## ローカル変数 {#h961dc82}
### defineを使う {#c1efcd04}
(define …)を使って関数の外側で定義した変数は全ての手続きから見えます。<br />
これでは名前などが衝突して不便なので、ある手続きからだけ見える変数を定義したいと思います。<br />
次の例を見てください。<br />
<br />
例1：

```
(define (inc-5 x)
 (define n 5)
 (+ x n)
)
```

これをloadして(inc-5 1)を呼び出すと確かに6になります。さらに、

```
gosh>n
```

とすると

```
*** ERROR: unbound variable: n
```

となります。<br />
これは変数が定義されていない時に出るエラーです。<br />
つまり、inc-5の中でdefineされた変数nはinc-5の外からは見えないということです。<br />
<br />
### letを使う {#h7123117}
上述したdefineでもよさそうですが、通常はletを使います。<br />
(なぜdefineでなくletを使うのか自分は知りません。どなたか教えてください)<br />
<br />
構文

```
(let ((変数名1 値) (変数名2 値) … (変数名n 値)) 変数を使った式)
```

上のinc-5をletを使って書き直すと次のようになります。

```
(define (inc-5 x)
 (let ((n 5)) (+ x n))
)
```

定義したい変数が1つの時も(変数名 値)の周りにもう一つカッコがいることに注意してください。<br />
<br />
### let* {#k2a9be16}
letでは、変数は全てまとめて定義されるため、たとえば次のようなことはできません。

```
(define (distance x y)
 (let ((xx (* x x)) (yy (* y y)) (disdis (+ xx yy)))
  (sqrt disdis)
 )
)
```

(sqrt n)はnの平方根を返す手続きで、はじめから用意されています。<br />
変数が全てまとめて定義されるので、disdisを定義する時点ではxxとyyはまだ定義されていません。<br />
ですから実行すると

```
*** ERROR: unbound variable: xx
```

といわれてしまいます。<br />
<br />
そこで登場するのがlet*です。

```
(define (distance x y)
 (let* ((xx (* x x)) (yy (* y y)) (disdis (+ xx yy)))
  (sqrt disdis)
 )
)
```

これは上のプログラムのletをlet*に変えただけですが、正しく動作します。<br />
let*では変数を前から順番に定義するため、disdisを定義する時点ではxxもyyも定義されているということになります。

# 内部手続きを使う {#n9e918cd}
変数名と同じく手続きも衝突するとやっかいです。<br />
そこで「ある手続きからしか見えない手続き」を定義してみましょう。<br />
<br />
例1：

```
(define (fact-iteration n)
 (define (inner n count ans)
  (if (= count n)
   (* n ans)
   (inner n (+ count 1) (* count ans))
  )
 )

 (inner n 1 1)
)
```

n!を返すプログラムの「繰り返し処理」版です。<br />
まずinnerという内部関数を定義して、(inner n 1 1)を返り値として返します。<br />
（このnはinnerのdefineよりも外側にありますから、innerの仮引数nではなくfact-iterationの仮引数nと対応していることに注意してください。）<br />
<br />
最初は何をやっているのか分かりにくいでしょうから順に見ていきましょう。<br />
試しに(fact-iteration 3)を評価してみます。<br />
\#(fact-iteration 3)が呼び出されると、(inner 3 1 1)が呼ばれる
\#3≠1なので、(inner 3 2 (* 1 1))が呼ばれる
\#3≠2なので、(inner 3 3 (*2 (* 1 1)))が呼ばれる
\#3＝3なので、(inner 3 3 (*2 (* 1 1)))の評価結果はans×count=(* 3 (* 2 (* 1 1)))=3!となる
\#順に呼び出し元の手続きに値を返し、結局(fact-iteration 3)の評価結果は3!となる
階乗が計算されていく様子が分かりやすいように(* count ans)は式のままで書きましたが、実際に評価されるときには計算されてから次の手続きに渡されます。<br />
このように、「計算結果を引数として再帰した自分にもう一度渡す」ということはSchemeではよく行われます。<br />
<br />
fact-iterationの外からはinnerは見えませんので、

```
gosh>inner
*** ERROR: unbound variable: inner
```

となります。<br />
これで手続きに一般的な名前をつけても他人と衝突する心配がなくなります。<br />
<br />
例2：

```
(define (add x y)
 (define (- a b) (+ a b))
 (- x y)
)

gosh> (add 1 2)
3
gosh> (- 1 2)
-1
```

このように、手続きの内部で定義した手続きは外にはまったく影響を与えません。

# リスト演算 {#y4dcb2e6}
SchemeをはじめとるするLisp系言語が得意とされるリスト演算を見ていきます。<br />
はじめは何の意味があるのか分からないかもしれませんが、気長に読んでもらえればその威力が分かるかと思います。
## cons、car、cdr {#kb6055a0}
構文

```
(cons 引数1 引数2)
(car ペア)
(cdr ペア)
```

consは引数1と引数2を要素に持つペアを作ります。<br />
car（カーと読む）は与えられたペアの第一要素を返します。<br />
cdr（クダーと読む）は与えられたペアの「第一要素を取り除いたもの」を返します。<br />
（これは第二要素と同じではありません。例えば「ペアのペアのペア」のcdrなどを考えればよいでしょう。）

```
gosh> (cons 1 2)
(1 . 2)
gosh> (define x (cons 'a 'b)
x
gosh> (car x)
a
gosh> (cdr x)
b
gosh> (cdr (cons 1 (cons 2 (cons 3 4))))
(2 3 . 4)
```

一個だけあるドットが非常に気になるのさっ という方は次のlistの説明を読んでから、[Schemeにおけるlistの実際](/docs/プログラミング言語/Scheme/Schemeにおけるlistの実際)を読んでください。<br />
<br />
## list {#o2fd0f4e}
ペアのペアのペアのペアノ…などという面倒なことをしなくても、listを使えば要素が3以上あるリストを一気に作り出すことが出来ます。<br />
<br />
構文

```
(list 引数1 引数2 … 引数n)
```

例：

```
gosh> (list 1 2 3 4)
(1 2 3 4)
gosh> (car (list 1 2 3 4))
1
gosh> (cdr (list 1 2 3 4))
(2 3 4)
gosh> (cdr (list 'a 'b))
(b)
```

はい、今回は気になるドットがありませんね。さらに最後の例は結果がconsのときとは少し違うようです。<br />
(ちなみにこれは「要素がbだけのリスト」が返ってきており、さらにcarをとるとbが返ります。)<br />
とりあえずは気にしないで構いませんが、余力がある人や気になりすぎて眠れない人は[Schemeにおけるlistの実際](/docs/プログラミング言語/Scheme/Schemeにおけるlistの実際)を読んでください。
<br />
<br />

- append

リストはappendを使って結合することができます。

```
gosh> (append (list 1 2 3) (list 4 5 6))
(1 2 3 4 5 6)
gosh> (append (list 1 2 3) (cons 4 5))
(1 2 3 4 . 5)
```

consで作ったペアもappendできます。<br />
「それじゃあペアとリストは同じなの？」とか「4と5の間のドットはなんじゃい！」という疑問については[Schemeにおけるlistの実際](/docs/プログラミング言語/Scheme/Schemeにおけるlistの実際)へどうぞ。<br />
（さしあたりは「ドットを表示したくなかったらlistにしとけばいい」くらいに思っておけばいいです。）<br />
<br />
## caar、caaar、caaaar {#n71bdb1e}
(1 2 3 4)というリストから4を取り出すことを考えてみましょう。

```
gosh> (define x (list 1 2 3 4))
x
gosh> (cdr x)
(2 3 4)
gosh> (cdr (cdr x))
(3 4)
gosh> (cdr (cdr (cdr x)))
(4)
gosh> (car (cdr (cdr (cdr x))))
4
gosh>
```

ようやく取り出すことができました。<br />
非常に面倒だし、最後の方はカッコが多くてわけがわかりません。<br />
<br />
そこで用意されているのが、caarやcadddr等です。<br />
caarはcarとcarを合わせたもの、cadddrはcarと3つのcdrを合わせたものです。<br />
(他にも、carとcdr合わせて4つまでの組み合わせなら全て用意されています。)

```
gosh> (cadddr x)
4
gosh> (cadr (cons (cons 1 2) (cons 3 4)))
3
```

この組み合わせ演算は、後ろから順番にリストにかかります。<br />
たとえば、(caddr x)は『「"xのcdr"のcdr」のcar』となります。<br />
<br />
## null?と空リスト {#qb11319e}
与えられたリストが空かどうかを判定するには、手続きnull?を使います。<br />
例えば要素が一つしかないリストのcdrは空リストです。<br />

```
gosh> (define x (list 1))
x
gosh> (null? (cdr x))
#t
```

この手続きは、リストを扱う再帰プログラムでの終了判定にとてもよく使われます。<br />
（数字で言えば再帰ごとに1減らしていって「0ならば…」というようなもの。）<br />
<br />
また、空リストを直接表すには '() を使います。<br />
（これはlistを引数なし（つまり要素なし）で呼び出した(list)の略記であり、(list 1 2 3)を'(1 2 3)と略記することもできたりします。）<br />

```
gosh> (null? '())
#t
gosh> (append '(1 2 3) (list 4 5 6) '())
(1 2 3 4 5 6)
```

<br />
## listを使って何か作ってみる {#g7541e94}
今回やったcons、list、append、null?を使って、行列式を求めるプログラムを書いてみましょう。<br />
（使っている項目は上に挙げた4つにif、cond、結果を引数として渡す再帰と全てここまででやった内容なので、読むのが面倒な人は飛ばしてもよいです。）<br />
リスト演算の威力が少しでも伝われば幸いです。

```
(define (det A)
 (define (scholor? matrix)
  (if (and (null? (cdr matrix)) (null? (cdar matrix))) #t #f)
 )
 
 (define (delete-elm j vector)
  (define (delete-elm-inner j count top middle end)
   (if (= j count)
    (append top end)
    (delete-elm-inner j (+ count 1) (append top (list middle)) (car end) (cdr end))
   )
  ) 
  (delete-elm-inner j 1 '() (car vector) (cdr vector))
 )
 
 (define (delete-column j matrix)
  (if (null? (cdr matrix))
   (list (delete-elm j (car matrix)))
   (cons (delete-elm j (car matrix)) (delete-column j (cdr matrix)))
  )
 )

 (define (acum-det vector smallen-matrix)
  (define (acum-det-inner vector retu matrix result)
   (let ((hugou (if (even? retu) -1 1)))
    (cond
     ((null? vector) result)
     ((= (car vector) 0) (acum-det-inner (cdr vector) (+ 1 retu) matrix result))
     (else (acum-det-inner (cdr vector) (+ 1 retu) matrix (+ result (* hugou (car vector) (det (delete-column retu matrix))))))
    )
   )
  )
  (acum-det-inner vector 1 smallen-matrix 0)
 )
 
 (if (scholor? A)
  (caar A)
  (acum-det (car A) (cdr A))
 )
)

gosh> (det (list (list 1 0) (list 0 1)))
1
gosh> (det (list (list 2 0 0) (list 0 2 0) (list 0 0 2)))
8
```

引数はリストのリスト（数のリストを行ベクトルだと思い、さらにそのリストを行列だと思う）にしてください。<br />
delete-elemは与えられたベクトル（リスト）の第m番目を削除したリストを、delete-columnは与えられた行列の第m列目を削除した行列を返します。<br />
（行列式の計算には第1行に関する余因子展開を使っています。）<br />
<br />
## map {#gb9b685f}
mapは（1引数の）関数とリストを引数にとり、「与えられたリストの各要素に関数を作用させたもののリスト」を返します。<br />
つまり、組{f(x),(1 2 3 4)}からリスト(f(1) f(2) f(3) f(4))を作り出すといえます。<br />
<br />
構文

```
(map 関数 リスト)
```

例1：

```
gosh> (map inc '(0 1 2))
(1 2 3)
gosh> (map even? '(1 2 3 4))
(#f #t #f #t)
```

mapをつかって[初心者用課題](/docs/初心者用課題)の素数の問題を解いてみます。<br />
<br />
例2：

```
(define (n-primes n)
 
 (define (make-list n)
  (define (make-list-inner n count result)
   (if (= count n)
    (append result (list count))
    (make-list-inner n (+ count 1) (append result (list count)))
   )
  )
  (make-list-inner n 1 '())
 )
 
 (define (is-prime? n)
  (define (is-prime?-inner n count)
   (cond
    ((= n 1) #f)
    ((> count (sqrt n)) #t)
    ((integer? (/ n count)) #f)
    (else (is-prime?-inner n (+ count 1)))
   )
  )
  (is-prime?-inner n 2)
 )
 
 (define (predicate p)
  (define (test x)
   (if (p x) x #f)
  )
  test
 )
 
 (define (remove-f sequence)
  (cond
   ((null? sequence) '())
   ((car sequence) (cons (car sequence) (remove-f (cdr sequence))))
   (else (remove-f (cdr sequence)))
  )
 )
 
 (remove-f (map (predicate is-prime?) (make-list n)))
)

gosh> (n-primes 100)
(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97)
```

但し、内部手続きmake-listは1以上n以下の自然数を全て含むリストを返す手続き、is-prime?は与えられた数が素数かどうか判定する手続き、remove-fは与えられたリストから#fのみを取り除く手続きです。<br />
<br />
下から2行目のmapの第2引数が分かりにくいと思うので説明しておきます。<br />
(predicate is-prime?)を評価すると定義からtestになるわけですが、testの定義の中にあるpはpredicateの引数のpと対応しているので、ここではis-prime?になっています。<br />
つまり、(predicate is-prime?)を評価すると「1変数の関数test」が返ってきて、testは引数が素数なら引数をそのまま返し、違えば#fを返す、と理解できます。<br />
<br />
ここで「testはpredicateの内部手続きだから、外からは見えないんじゃなかったの？」という疑問がわきます。

<br />
答えとしては、「mapから直接は見えないが、predicateを通してのみ見ることができる」と言えます。<br />
（これによりSchemeでオブジェクト指向のようなこともできますよ。）<br />
<br />
大切なことは、プログラムが『モジュール化』されているということです。<br />
モジュール化することにより、例えばn以下の偶数を全て返すプログラムを作りたければis-prime?の代わりにeven?を渡してやるだけでよいですし、素数判定に原始的な割り算ではなくフェルマー法を使いたければis-prime?のみを修正すればできます。<br />
（これはSchemeに限らずどの言語にも共通する重要な考え方です。）<br />
<br />
## 練習問題 {#m0fd514a}
list演算はSchemeを使いこなす上で非常に重要なので、練習問題を用意しました。─解答例（未執筆）<br />
<br />
問題1(易)：

```
mapのところで作った素数を求めるプログラムは、各モジュールの入力と出力を理解すれば
 (remove-f (map (predicate is-prime?) (make-list n)))
を見ただけですぐに理解できます。
その反面、一度1からnまでのリストを作り出す必要があり、nを大きくすると大量のメモリを消費します。

これを解消するために、先にリストを作ってしまわないで、素数が求まるたびにリストを伸ばしていくようなプログラムを作りなさい。
ただし手続きis-prime?はすでに与えられているものとしてよい。
```

問題2(難)：

```
 「エラトステネスの篩」を使って2以上n以下の素数のリストを出力せよ。
```


# lambda {#t8f3b1f3}
## 関数を引数として渡す {#s198ac53}
前節でmapをやったときに、引数の中に関数が入っていました。<br />
Schemeでは手続きの名前を書いてやるだけで手続きを引数として渡してやることができます。<br />
Cでは「関数の本体」を値渡ししてやることはできないのでアドレスを渡しますが、Schemeでは引数として渡すと

きに名前が評価されて「本体をあらわす式」になり、その式が渡されます。<br />
この「本体をあらわす式」がここでやるlambda式です。<br />
しかしいきなりlambdaは難しいのでとりあえずは手続きを引数に渡す例を見てみましょう。（実はもう1回出てきていますが。）<br />
<br />
例1：

```
(define (double f x)
 (f (f x))
)

(define (inc x) (+ x 1))

gosh> (double inc 5)
7
```

(double f x)は（一般的な書き方で言うと）f(f(x))を返します。<br />
簡単ですね。<br />
<br />
## lambda式 {#l159cad7}
上の例で、incを渡してやるのにわざわざ一度incという名前を介するのはもどかしい感じがします。<br />
また、例えばmapで素数を表示した時のpredicateのようにわざわざ名前をつけるほどでもない、一度しか使われない手続きもあります。<br />
そこで、lambdaを使って「名前のない、手続きの本体」を表現します。<br />
<br />
構文：

```
(lambda (引数並び) 手続きの内容を表す式)
```

この式を評価すると、「手続きの本体」が返ります。<br />
見てのとおり、手続きの名前はどこにもあらわれません。<br />
使い方になれるまで若干分かりにくいですので、例で見ていきます。<br />
<br />
例1：

```
gosh> ((lambda (x) (+ x 1)) 1)
2
```

(lambda･･･)が手続きの本体で、それを引数に1を設定して呼び出しています。<br />
引数並びに現れているxが内容を表す式のxに対応します。<br />
<br />
例2：

```
gosh> ((lambda () (+ 1 2)))
3
```

(lambda () (+ 1 2))は(+ 1 2)という無引数の関数を返します。<br />
外側にもう一組カッコがあるのは、「無引数の関数lambdaを呼び出すためのカッコ」です。<br />
（Schemeでは関数呼び出しにたとえ引数がなくてもカッコがいるのでした。getchar();にカッコがいるのと同じです。）<br />
<br />
lambdaを使って、先ほどのプログラムは次のように実現できます。<br />
<br />
例3：

```
gosh> (double (lambda (x) (+ x 1)) 5)
7
```

## lambdaとdefineの関係 {#m3637a0d}
lambdaで作り出した手続きの本体にdefineを使って名前をつけるとどうなるでしょうか？<br />
<br />
例1：

```
(define inc (lambda (x) (+ x 1)))

gosh> (inc 1)
2
```

処理系はincを丸々(lambda…)で置き換えますから、上のようにあたかも(inc x)という手続きがあるかのように使えます。<br />
実はこれは、(define (inc x) (+ x 1))と全く同じです。<br />
（意味的に同じではなく、内部の処理も同じ。後者の書き方はlmabdaを使った書き方の略式という扱いになっている。：嘘かも。(内部処理が等しいとうことは間違いありません。))<br />
<br />
## 練習問題 {#pdea1525}
# 参考サイト {#tbf1f514}
このwikiではSchemeの最低限の使い方をやりました。<br />
Schemeの応用やScheme的考え方などについては以下のサイトをごらんください。<br />
このwikiをマスターすれば大体は読めるハズです。

- [独習Scheme三週間](http://www.sampou.org/scheme/t-y-scheme/t-y-scheme.html)


前半は入門を、後半はSchemeにおけるオブジェクト指向などを扱っています。<br />
また、最後の方でSICP（次節「参考図書」参照）の第4章にあたる内容を扱っています。<br />
（後半むずかしめ）

- [Scheme演習](http://www-ui.is.s.u-tokyo.ac.jp/~hara2001/scheme/)


「東京大学理学部情報科学科 2年生 の「Scheme演習」の講義用ウェブサイト」だそうです。<br />
東大とおそるるなかれ、ほとんどはこのwikiの範囲で理解できるし、内容はほぼSICP（次節「参考図書」参照）と同じ。<br />
SICPの中から重要な問題を選んで演習問題としてあるので、実力をつけるのにもってこい。

- [Gaucheプログラミング](http://karetta.jp/book-cover/gauche-hacks)


Schemeの（このwikiより詳しく難しい）入門と、その応用。<br />
Schemeを使ったCGIなどの実用プログラミングはこのサイトがどこより詳しいと思われる。<br />
このサイトの内容が[プログラミングGauche](http://www.oreilly.co.jp/books/9784873113487/)という本になって発売されました。

# 参考図書 {#abeb8287}
Schemeを学ぶのに参考となりそうな本をあげておきます。<br />
マイナーすぎて扱った本がほとんどない上に、たいていの書店ではおいてありませんが･･･

- [計算機プログラムの構造と解釈](http://www.amazon.co.jp/%E8%A8%88%E7%AE%97%E6%A9%9F%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%A0%E3%81%AE%E6%A7%8B%E9%80%A0%E3%81%A8%E8%A7%A3%E9%87%88-%E3%82%B8%E3%82%A7%E3%83%A9%E3%83%AB%E3%83%89%E3%83%BB%E3%82%B8%E3%82%A7%E3%82%A4-%E3%82%B5%E3%82%B9%E3%83%9E%E3%83%B3/dp/489471163X/ref=pd_sim_b_2/249-3596253-5360359)


Schemeを使ってプログラミングの基本的考えを学ぼうという本。<br />
ものっすごい高いことと日本語訳がイマイチなので、下記の英語版をおすすめします。

- [Structure & Interpretation of Computer Programs](http://www.amazon.co.jp/Instructors-Accompany-Structure-Interpretation-Computer/dp/0262692201/ref=pd_bxgy_b_text_b/249-3596253-360359)


上の本の原書。通称SICP。英語です。<br />
なんとMITのサイトで[全文が無料で公開されている](http://mitpress.mit.edu/sicp/)。

- [プログラミング言語Scheme](http://www.amazon.co.jp/%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E8%A8%80%E8%AA%9ESCHEME-R-%E3%82%B1%E3%83%B3%E3%83%88-%E3%83%87%E3%82%A3%E3%83%B4%E3%82%A3%E3%82%B0/dp/4894712261)


図書館でちらっと見ただけですがなかなかよさそうでした。<br />
これも[原書](http://www.amazon.com/Scheme-Programming-Language-3rd/dp/0262541483)は[全文が無料で公開](http://scheme.com/tspl3/)されています。
