---
title: "C言語 - よくありそうな質問"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "C言語---よくありそうな質問"
draft: false
---

# C言語 - よくありそうな質問 {#t516e32a}
Cに関するよくありそうな質問。入門者向け。


## i++ と ++i の違いって何？ {#zdadd7d3}
ただ単品で <em>i++;</em> や <em>++i;</em> と書くときには違いはありません。<br />
次のようなコードで違いが生じます。

```
a = i++;
b = ++i;
```

前者は

```
a = i;
i = i + 1;
```

と同じで、後者は

```
i = i + 1;
b = i;
```

と同じです。<br />
(やや難しくいうと、i の値を評価してから1増やすか、1増やしてから評価するかの違い)

## #define と typedef ってどっちを使ったらいいの？ {#j199ce24}
typedef が使えるところではすべて typedef を使うべきです。<br />
\#define で typedef の代用をすると、型名ではないところまで置換してしまうからです。<br />

```
#define moji char

struct card{
  int moji;
  int suuji;
};
```

このようなとき、メンバの名前である moji まで <em>char</em> に置換されてしまいます。

## if( (cond=function()) != -1 ){ ... } ← これなんですか？ {#uc72d3a5}
これは次と同じ意味です。

```
cond = function();
if( cond != -1 ){ ... }
```

つまり、cond=function(); を実行して、値が変わった cond を -1 と比較します。<br />

while( (c=getchar()) != EOF ){ ... } なども同様です。<br />
( c=getchar(); を実行し、更新された c を EOF と比べる)

## printf(const char *format, ...) の const って何？ {#zf9ba056}
const とは constant の略で、「この変数はこの関数の中で変更されませんよ」という意味です。<br />
つまり、

```
char str[] = "This is a test.";
printf(str);
```

としたときに、「str の中身をprintf関数が勝手に変更したりしません」ということです。<br />

## 二次元配列を関数に渡したらコンパイルできません！！ {#pdb90b0b}
こんな風↓にしてませんか？

```
void function(int arg[][]){ ... }

main(){
 int test[][] = {{0, 1, 2}, {1, 2, 3}, {2, 3, 4}};
 function(test);
}
```

もしこうしているなら、function の引数を次のように直してください。

```
void function(int arg[][3]){ ... } // 要素数を後ろ側だけ指定

main(){ ... }
```

こうすればコンパイルできるはずです。<br />
(両方指定して arg[3][3] としてもよいが、そうすると3×3配列しか渡せなくなる。後ろ側だけの指定ならn×3(nは何でもよい)配列が渡せる。)<br />

なぜこうしないといけないかというと、二次元配列はメモリ上で次のようになっているからです。

```
           ↓test[1][0]
[0][1][2][1][2][3][2][3][4]
 ↑test[0][0]      ↑test[2][0]
```

つまり、呼び出された関数から見ると3×3配列は連続した9個のintにしか見えず、配列がどこで区切られているのかサッパリ分からない、というわけです。<br />
後ろの3を指定してやることで、どこで区切ればいいのか分かるようになります。<br />

同様の理由で、3次元配列ならば後ろ2つ、4次元配列ならば後ろ3つを指定してやらないといけません。

## char array[n]; ってできないんですけど！ {#zaff8516}
残念ながら、CおよびC++では配列を宣言するときの要素数の指定に変数は使えません。<br />
ではどうするかというと、次のようにします。

```
#include <stdlib.h> // callocを使うのに必要

main(){
 char* array = (char*)calloc(n, sizeof(char));
 ...
}
```


これで以後 array は要素数nのchar型配列とまったく同じように使えます。<br />
(なぜこれでいけるのかは長くなるのでポインタと配列の関係とかその辺りを学んで考えてみてください。)

なお、C99(C言語の最新規格)では、char array[n];のような可変長配列の宣言が許されます。ただし、C99に対応していないコンパイラがまだ多くあるので注意してください。

## if(0 < a < 5){ ... } ってしたいんですけど！ {#je0fd9d9}
<strong>やめてください</strong><br />

このように書いてもコンパイルは通りますが、数学的に表される意味とは違う意味になってしまうので、必ず

```
if(0 < a && a < 5){ ... }
```

としてください。<br />

↓まともな説明(分からん人はスルー可)<br />
a = -1 のときを例にとって、こう書くとどうなるのかやってみましょう。<br />
0 < a < 5 の計算順序は (0 < a) < 5 なので、まず 0 < a を評価します。すると、 0 < -1 は偽ですから、<strong>0が返ります</strong>。(つまり、 式 0 < a の値は0ということ。ここがポイント）<br />
次に 0 < 5 を評価して、結局全体として真になってしまいます。<br />
まとめると、0 < a < 5 の意味は「0とaを比較して、その結果(aではなく、真か偽か)を5と比較する」となります。

## if(a==b==c){ ... } ってしたらなんかおかしいんですけど！ {#z9f8b077}
これも上の質問と同じ原因で、見た目の意味(aとbとcが等しいならば、・・・)とは違う意味になっています。<br />

```
if(a==b && b==c){ ... }
```

などとしてください。

## 『猫でも分かる〜』に書いてある メモリモデル とか FARポインタ とかがぐぐってもさっぱり分からんのだが {#g69d0c8b}
昔の名残です。今では意味がありません。無視しましょう。<br />
(ただ今後64ビット環境と32ビット環境が入れ食い状態になると復活するかもしれませんが・・・。現状スルーで問題なし)<br />

↓以下C++が分かる人向けの説明<br />
例えば、32ビット環境で64ビットのポインタを作ったとする

```
template <typename T> class ptr64{
private:
	unsigned long long adr;
public:
	T operator *(){ ... }
	......
};

typedef ptr64<char> pchar64;
typedef ptr64<int>  pint64;
......
```

このようなポインタ(実際には16ビット環境下での32ビットポインタ)を通常のポインタと区別するためにFARポインタと(16bitと32bitが入れ食いだった時代に)呼んでいた。また通常のポインタを特にNEARポインタと呼ぶこともあった。

## (a ? b : c) って何？ {#ic8b7c01}
「aが真ならばb、偽ならばc」という意味。三項演算子と呼ばれる。<br />
次のように使って、if よりも短く簡潔に書くことができる。

```
void func(int x){
 int y;
 y = (x>0 ? x : -1 * x); // yは、x>0ならx、そうでなければ-x
 ...
}

int even(int n){
 return (n%2 ? 0 : 1); // n%2が1なら0を、0なら1を返す
}
```

ちなみに、ifとの違いは、ifが制御構文なのに対して、こちらは式であるということ。<br />

## 「メモリがreadになることができませんでした」とかいって落ちるんですけど… {#y3571f8b}
メモリのおかしな場所にアクセスした時にWindowsが出す警告です。<br />
初心者がやりがちなミスで原因となりそうなものは、次のようなものがあります。チェックして下さい。

- 配列添字に要素数以上の数を指定していませんか？<br />
  char array[5]; のとき、使えるのはarray[0]〜array[4]の5つです。<strong>array[5]は使えません。</strong>
- scanfなどの関数で、代入先の指定に & をつけ忘れていませんか？<br />

```
× scanf("%d", a);
○ scanf("%d", &a);
```

- char *str; str[0] = 'a'; ... などとしていませんか？<br />
  配列は自動的にポインタになりますが、ポインタは自動的に配列にはなりません。<br />

```
char str[512]; // 充分な大きさの配列を用意
str[0] = 'a';
....
```

とするか、malloc, calloc等を使ってください。

- printfの書式指定を間違えていませんか？<br />

```
int a = 10;
× printf("%s\n", a);
○ printf("%d\n", a);
```

- 終端文字(\0)の入っていない文字列を表示したり、文字列処理関数に渡していませんか？<br />
  悪い例

```
char str[10];
str[0]='t'; str[1]='e'; str[2]='s'; str[3]='t';
printf("%s\n", str);
```

良い例1

```
char str[10] = "test"; // こうすると自動で最後に'\0'が入る
printf("%s\n", str);
```

良い例2

```
char str[10];
str[0]='t'; str[1]='e'; str[2]='s'; str[3]='t'; str[4]='\0'; // 最後に終端文字を代入
printf("%s\n", str);
```

- リテラル領域に書き込んでいませんか？<br />
  ダブルクォーテーションマークで囲んだ文字列は文字列「定数」です。~<br />
  定数領域は弄っちゃいかんです。~<br />
  駄目な例

```
char *str = "VIP de yare";
str[5] = 'a';
```

良い例

```
char str[] = "VIP de yare";
str[5] = 'a';
```

上の例では、strにはリテラル領域のアドレスが入っているに過ぎませんが、
下の例では、strにはリテラル領域の中身がコピーされているから問題ないのです
## 「メモリがwrittenになることができませんでした」とかいって落ちるんですけど… {#i0cf98b7}
同上

## むしろ何もメッセージが出ずに落ちるんですけど… {#bae6dec2}
何もエラーが出ずに落ちる場合でも、メモリアクセスが原因な場合が多いです。<br />
(というより、「落ちる」という現象の原因はほぼ全部なんらかのメモリアクセスエラー）<br />
『「メモリがreadになることができませんでした」とかいって落ちるんですけど…』の項目をチェックしてみてください。

## 関数ポインタの宣言が意味分かりません {#g9b39d4f}
Cの文法が腐ってるせいです。単純な場合は丸暗記しましょう。<strong>複雑な場合はtypedefすると分かりやすいです。</strong>

1. 単純な場合


```
int (*func)(char); //「char型の引数をとりint型を返す関数」へのポインタfunc
```

1. 複雑な場合


```
typedef int (*func_t1)(char);
  //「char型の引数をとりint型を返す関数」へのポインタ
typedef func_t1 (*func_t2)(double);
  //「double型の引数をとり、『char型の引数をとりint型を返す関数へのポインタ(func_t1)』を返す関数」へのポインタ
func_t2 test[];
  //「double型の引数をとり、『char型の引数をとりint型を返す関数へのポインタ』を返す関数へのポインタ」(func_t2)の配列
```


## 排他的論理和ってなに？ {#r919c70e}
論理演算(andとかorとか)の一種です。<strong>二つ同じならfalse、違えばtrue</strong>です。<br />
AとBの排他的論理和

|A＼B|true|false|
|---|---|---|
|true|false|true|
|false|true|false|

ただし、Cでは A^B は<strong>ビットごとの排他的論理和</strong>の意味になるので注意しましょう。1をtrue、0をfalseだと思ってビットごとに排他的論理和を適用します。<br />
例：<br />
　A = 10(2進数で<span style="color:blue;background-color:white;">0</span><span style="color:red;background-color:white;">10</span><span style="color:blue;background-color:white;">1</span><span style="color:red;background-color:white;">0</span>)<br />
　B = 24(2進数で<span style="color:blue;background-color:white;">1</span><span style="color:red;background-color:white;">10</span><span style="color:blue;background-color:white;">0</span><span style="color:red;background-color:white;">0</span>) のとき、<br />
　A^B = 18(2進数で<span style="color:blue;background-color:white;">1</span><span style="color:red;background-color:white;">00</span><span style="color:blue;background-color:white;">1</span><span style="color:red;background-color:white;">0</span>)

## 標準ライブラリってなに？ {#f5c7d4e0}
マイクロソフトのVisualStudio、やボーランドのBCC、オープンソースで開発が進められているGCC、良く知らないけど“MSC”"LSI-c  "DigitalMars /C++ compiler"等のどのコンパイラでもデフォルトの状態でコンパイル＆実行できる関数のこと。というか業界団体によって”～の関数が使えるように作ってね”と基本的な規格が整備されてるらしい。どのコンパイラでもコンソール画面に文字を表示できるprintf()関数の呼出し方、機能って多分一緒だと思う。


## じゃあ非標準ライブラリもあるわけ？ {#w3fd34e0}
DirectX、OpenGL,HTTP,メールの送受信,グラフィック､正規表現…　たぶんあると思います。探して導入するまでが大変ですが一から作るより手間が省けるらしいですよ
