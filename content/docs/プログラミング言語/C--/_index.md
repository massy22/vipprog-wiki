---
title: "C++"
date: 2026-07-26T12:12:59+09:00
lastmod: 2026-07-26T12:12:59+09:00
slug: "C--"
draft: false
---

# C++とは {#sd955d2d}

- C++はC言語にクラス･テンプレート･例外処理などを加えたものです。
- 標準テンプレートライブラリが存在しなかった頃から初学者に説明する（教える）順番として


```
そういうわけで、Cをある程度理解してから勉強してからでないと、なんのこったかワカランと思うのであります。
```

という考え方が今でも一般的なようです<sup id="fnref-1" class="footnote-ref"><a href="#fn-1">*1</a></sup>が、Bjarne Stroustrup氏<sup id="fnref-2" class="footnote-ref"><a href="#fn-2">*2</a></sup>の考えは違うようです<sup id="fnref-3" class="footnote-ref"><a href="#fn-3">*3</a></sup>。

- Cは理解したぜ！　って人でも、「自分の書いたプログラムのバグが取れねー」とかいっているのなら！　もしそーなのなら！　C++の勉強する前に、コーヒーブレイクとして、お勧めするサイトがあるのだ。「パソコン初心者の館」の『Ｃプログラミング診断室』である。大笑いしながら見るのも一興、青ざめながら見るのもまた一興。
- プログラミングの学び方、教え方も学習者の目的や背景など状況によってどのような学習の仕方が適切なのかは一様ではありませんが、『[Bjarne Stroustrup: 標準C++を新しい言語として学ぶ](http://www.libjingu.jp/trans/new_learning-j.html)』 や次の項目のリンク先など道標的に参考になるかと思います。<br />
- 『[標準C++の歴史と哲学（豊田孝の「IT談話館」）](http://www.ttoyota.com/php/cppintro.php)』
  - [C++の学び方（By Stroustrup）](http://www.ttoyota.com/php/howtolearncpp.php)、[C++の学び方（By Koenig）](http://www.ttoyota.com/php/salescontents.php)、[C++の学び方（実践編）](http://www.ttoyota.com/php/cppnovicecontents.php) - 技術文書ではなく読み物として - 学習のガイダンス、オリエンテーション的に目を通しておくと吉。


# インストール {#i9c592f9}
インストールは[C言語のページ](/docs/プログラミング言語/C)を参照して欲しい
# C言語との(クラス・テンプレート・例外処理以外の)違い {#h90f3051}
## 関数のプロトタイプ {#kae7bbc7}

```
C　:引数を取らない場合、voidを明示しなければならない
C++:引数を取らない場合、何も記載しないでも良い(voidを明示しても良い)
```


```
C  :関数のプロトタイプ宣言はしなくてもよい
C++:別ファイル内や呼出し元よりも下で関数が定義されている場合、プロトタイプ宣言が必須
```


## 戻り値 {#bec42213}

```
C　:戻り値がある場合、値を返さなくてもコンパイル可能
C++:戻り値がある場合、必ず何らかの値を返さないとコンパイルエラー
```


## 変数の宣言位置 {#z4acd480}

```
C　:関数などのブロックの先頭で宣言しなければならない(注)
C++:任意の位置で宣言可能
(注)C99規格対応により、任意位置での宣言がサポートされた
```


## for文 {#z0b8199f}

```
C++:for文の初期化部分で変数が宣言可能、かつ、スコープはループ内(注),(注2)
(注)VC2003の場合、"言語拡張"オプションで変更可能、かつ、デフォルトでは、スコープはループ内に収まらないので注意。
(注2)VC6の場合、スコープはループ内に収まらず、かつオプションで変更も不可能である。
```

(例)

```
for ( int i = 0 ; i < 5 ; i++ ){
  printf("%d", i);
}
i++; // ここではiは見えない。エラー。(注に記した場合を除く)
```


## コメント {#t994b288}

```
// による１行コメントが追加(注)
(注)C99規格対応により、Cにも // がサポートされた
```


## 新しい型 {#a4553814}
新しい型として、真偽値を表す bool が追加されました。<br />
代入できる値は true または false のいずれかです。true は真を、falseは偽を表します。

```
bool b1 = true;
bool b2 = false;

if(b1){ ... } // 実行される

if(!b2){ ... } // 偽の否定は真なのでこれも実行される

if(b2){ ... } // 実行されない
```


## 新しい演算子 {#iadd5582}
新しい演算子として、型の情報を返す typeid が追加されました。(詳しくは後述)

## キャスト {#u6910aa1}

```
dynamic_cast、static_cast、reinterpret_cast、const_cast　が追加
```


## 参照 {#of721aa3}

```
参照型や、引数の参照渡しが追加（詳しくは後述）
```


## 特定キーワードの省略 {#s28fd647}
C++では、struct, enum, classのキーワードは省略できることがある。

```
enum _sex{male, female, unknown};

struct human{
 int age;
 char* name;
 _sex sex; // Cなら enum _sex sex; と書かねばならないが、enum を省略できる
};

int main(){
 human Taro; // Cなら struct human Taro; と書かねばならないが、struct を省略できる
 return 0;
}

// 引数、返り値の型もキーワードを省略できる
human* set_default(human* hm){
 hm->age = 0; hm->name = NULL; hm->sex = unknown;
 return hm;
}
```


## パラメーター名の省略 {#s8d26354}
C++では、使わないパラメーターは名前を省略することができる。

```
#include <stdio.h>

int foo(int){ // 使わないパラメーターにわざわざ int dummy などと名前付けしなくてよい
 return 10;
}

int main(){
 printf("%d\n", foo(0));
 return 0;
}
```

<em>注）これはC++の新機能なのですが、C/C++両用のコンパイラの場合、Cモードでコンパイルしても省略可能な場合が多いです。</em>

## 新しいキーワード {#z27248a1}
Cのキーワードに加えて、以下のものが新しくキーワードとして予約されています。

|and|bool|catch|class|
|---|---|---|---|
|const_cast|delete|dynamic_cast|explicit|
|false|friend|inline|mutable|
|namespace|new|not|operator|
|or|private|protected|public|
|reinterpret_cast|static_cast|template|this|
|throw|true|try|typeid|
|typename|using|virtual|xor|

ただし、<span style="color:black;background-color:yellow;">論理演算系</span>はVC++6では予約されておらず、通常の識別子として使用できます。(他バージョンのVC++は手元にないので分かりません。情報求む。)

# 簡単なプログラム {#r8f3394c}
まずは簡単なプログラムの説明をします。
以下のコードは画面に文字の表示をするプログラムでしょう。


```
#include<iostream>

using namespace std;//stdという名前空間を使用する

int main()//メイン関数。すべての始まり
{
	cout << "Hello,Work" <<endl;//Hello,Workと画面に表示する
	return 0;//システムに0を返す。
}

```

説明はコメントに書いてあるとおりです
Hello,Workと書いてあるところを他の文字列にして試してみてください。
他の文字列を表示することができます。

# オブジェクト指向プログラミング {#a4cfe636}
C++はクラス単位でプログラミングを行う言語です。

そもそもクラスって何？という方に簡単な説明をすると
クラスは変数や関数を一まとめにしたものです。

何のためにクラスを使うのか？というのを説明すると、
プログラムの変更をしたいとき、その変更を最小限に抑えるためです。
クラスにまとめることによりプログラムそのものを書き換えることなく、クラスを書き換えるだけでプログラムを変更できます。
では、上の文字表示プログラムをクラスを使って書いて見ましょう。
(*注意:実際に文字を表示するだけの小さなものをクラスにまとめるのは馬鹿のすることです。)


```
#include <iostream>

// PrintCharacterというクラスを宣言
class PrintCharacter { 
public:
	// PrintCharacterというクラスにPrintという関数がありますよということを示す
	void Print( const std::string& str );
};

void PrintCharacter::Print( const std::string& str ) {
	std::cout << str << std::endl; // strを表示
}

int main() {
	// printCharという名前でクラスの実体を生成して使えるようにする
	PrintCharacter printChar;
	// Print関数を使って画面に表示 	
	printChar.Print("Hello,Work");
	return 0;
}
```


これで画面に表示できます。
かなり意味不明ですね。
次にこれの説明をします。

## プログラムの詳細 {#r7053a52}
先ほどの上のプログラムをコンパイルするとHello,Workが表示されると思います。
ではそのプログラムの詳細を示して行きたいと思います。

```
#include<iostream>
```

この部分はiostreamというファイルを取り込みます。こうすることでいろいろな関数を使えるようになります。

```
// PrintCharacterというクラスを宣言
class PrintCharacter {
public:
	// PrintCharacterというクラスにPrintという関数がありますよということを示す
	void Print( const std::string& str );
};
```

この部分はPrintCharacterというクラスを宣言します。
public:というのはこれをつけることで外からもアクセスできますということを示します。
これがないと外からアクセスできません。


```
int main() {
	// printCharという名前でクラスの実体を生成して使えるようにする
	PrintCharacter printChar;
	// Print関数を使って画面に表示 	
	printChar.Print("Hello,Work");
	return 0;
}
```

この部分はメイン関数です。
PPrintCharacter printChar;はPrintCharacterクラスをprintCharという名前で作ります。
printChar.Print("Hello,Work");この部分はprintCharという名前で宣言されたクラスのPrintという関数を呼びます。

これによって文字が表示できます。

# 関数オーバーロード {#haae1e4f}
同じ名前で中身の違う関数を複数定義できます。<br />
関数をオーバーロードするには、関数の呼び出し時に関数が区別できないと、つまり<strong>関数の引数の型が違わないと</strong>だめです。

```
//int 11 を返す関数 f()
int f(){
    return 11;
}

//a+b を返す関数 f(int,int)
int f(int a,int b){
    return a+b;
}

//こういうことも可能です
int f(int a,int b,int c){
    return f()+a+b+c;
}
```

ただし、無闇に多くの関数をオーバーロードすると乱雑になりやすいので注意しましょう。

# 演算子のオーバーロード {#l4f68f42}
演算子の機能を、関数としてプログラマが定義できます。<br />
これは、自前で定義したクラスの演算を分かりやすくしたい時などに便利です。
演算子のオーバーロードをするには、キーワード<strong>operator</strong>を使います。<br />

```
//メートル
class Metre{
public:
    float v;
    Metre(float n){ v = n; }
};

//キロメートル
class KMetre{
public:
    float v;
    KMetre(float n){ v = n; }
};

//メートルとキロメートルの加算
Metre operator + (const Metre &m,const KMetre &km){
    return Metre( m.v + (km.v/1000.0f) );
}

KMetre operator + (const KMetre &km,const Metre &m){
    return KMetre( (m.v*1000.0f) + km.v );
}

//..........

Metre  X(100);
KMetre Y(4);

//クラスは違うが、演算は可能
Metre  Z=X+Y;
KMetre W=Y+X;
```


# 参照 {#jc7a7f3a}
参照とは、エイリアスとも呼び、「変数につけられた別名」です。<br />

- 参照の宣言など<br />
  参照を宣言するには、型名の後に & をつけます。~<br />
  例えば、int型変数aの参照bを宣言するには以下のようにします。

```
int a = 5;
int& b = a; // bにaを代入する感じで~
```


- 参照の性質<br />
  参照ははじめにも書いた通り、「ある変数の別名」であり、元々の変数名を書いたのとまったく同様に動作します。例えば、

```
int a = 5;
int& b = a;
b = 3;
```

とすると、aの値も3に変わります。( b = 3; の代わりに a = 3; と書いたとの同じ結果を生じる。)<br />

- 参照の使い道<br />
  これだけだとまったく使い道が無いように思いますが、参照を関数の引数として渡すと便利なことがあります。<br />

```
#include <iostream>

void inc(int& x){
 x++;
}

int main(){
 int a = 5;
 inc(a);
 std::cout << a << std::endl;

 return 0; 
}
```

このコードはどんな結果を生じるでしょうか。<br />
<br />
xはint型変数への参照であり、そこにaを渡しているので、 int& x = a; と同じことです。<br />
つまり、xはaの別名になり、x++; は a++; とまったく同じ挙動をしめします。
すなわち、このプログラムを実行すると 6 が表示されます。<br />
このようなことはポインタを使えば実現できますが、そうすると (*x)++; としなくてはなりません。<br />
一階のポインタならば混乱はおきませんが、例えば FILE* へのポインタ(FILE**)を受けて、その指す先に代入･･･などとするとコードが読みにくくなります。<br />
参照はこのようなことを防ぎ、より直感的に分かりやすいコードを書くことができます。

# インライン関数 {#f980021b}
C++にはインライン関数というものがあります。<br />
簡単に言うと、「（コンパイラが）関数のコードを、その関数を呼び出した場所にそのまま貼り付ける」といった感じです。(通常の関数呼び出しは別の場所にかかれたコードへジャンプする)<br />

～定義方法～<br />
インライン関数を定義するには、関数定義の頭に inline キーワードを付けます。<br />

```
inline void inc(int* x){ // 定義の頭に inline を指定
 (*x)++;
}

int main(){
 int a = 0;
 inc(&a);
 return 0;
}
```

これをコンパイルすると、次のコードをコンパイルしたのと(ほぼ)同じアセンブリコードが生成されます。
<br />

```
int main(){
 int a = 0;
 int* x = &a; // この部分が inc(&a) に相当
 (*x)++;      // この部分が inc(&a) に相当
 return 0;
}
```

ちょうど inc の中身が inc を呼び出した位置に展開された形になり、これを「インライン展開」と呼びます。

～インライン関数のメリット～

- 通常の関数を使うよりも高速に動作する<br />
  最初にも書いたように、通常の関数呼び出しを行うと、元の関数と別の場所(場所とは生成された実行ファイル上の位置)にあるコードへジャンプします。~<br />
  このジャンプを行う際に、現在のレジスタの内容を保存したり、関数の処理が終わって戻ってくる場所を記憶したり、とジャンプの前処理を行う必要があり、これに時間がかかります。~<br />
  インライン関数を使うと上に書いたように関数のコードが呼び出し元にそのまま展開されるので、ジャンプの処理は必要なく、より高速に動作します。

～インライン関数のデメリット～

- コードが肥大化する<br />
  通常の関数呼び出しがなぜ時間のかかる処理をしてまでジャンプをするかと言うと、それは「コードを共有するため」です。~<br />
  一度 inc のコードを生成してしまえば、あとは何回 inc が呼び出されようが同じ場所へジャンプすればよいのです。~<br />
  しかしインライン関数は関数の中身をそのまま展開するため、100箇所から inc が呼び出されれば同じコードが100箇所に生成されます。~<br />
  このためコードが肥大化してしまうというデメリットがあります。

～インライン関数を使う上での注意～

- inlineを指定した関数が必ずインライン展開されるとは限らない<br />
  コンパイラがインライン展開をするに値する（メリットの方が大きい）と判断しなければ、inlineを指定してもインライン展開されないことがあります。~<br />
  (ただし、マイクロソフトのコンパイラでは inline の代わりに __forceinline を指定することで、gccでは inline の代わりに __attribute__(&#40;always_inline&#41;) を指定することで強制的にインライン展開させることができます。Borlandのコンパイラにはこのような独自機能はないようです。)
- inline関数はプロトタイプ宣言できない<br />
  インライン関数は宣言をヘッダに書いて定義は別のファイルに書く といったことができません。~<br />
  別ファイルにする場合は .h に直接本体を書いて、それを include する必要があります。

# テンプレート関数 {#e1ee30ef}
テンプレート関数とは、使う側の立場から見れば「引数、返り値の型が決まっていない関数」です。<br />
例えば、xの絶対値を返す関数を作りたいと考えます。<br />
すると、「引数、返り値ともにdouble(数値型で一番ビット幅が大きい)で定義して、キャストして使う」、「関数のオーバーロードを使う」などの方法がうかびます。<br />
前者はどう考えてもスマートではないし、long long(C99で追加)などdouble以上のビット幅をもつ整数型に対応できません。また後者は使いたい型すべてについて同じコードを何回も書かねばなりません。<br />

そこで登場するのがテンプレート関数です。<br />
テンプレート関数を使えば、一度コードを書けばそれをintにもfloatにもdoubleにもlong longにも適用できます。<br />

～テンプレート関数の定義方法～<br />
まず具体例を見て、それから解説します。<br />
xの絶対値を返すテンプレート関数は次のように定義します。

```
template <typename T> T abs(T x){
 T abs_val;
 if(x >= 0) abs_val = x;
 else abs_val = -1*x;
 return abs_val;
}
```

まず一行目について

```
template     // これはテンプレート関数ですよ、という指示
<typename T> // この宣言で以後 T という識別子(名前)は、型の名前(typename)のことですよ、という意味
T            // 返り値の型。
abs(T x)     // 関数の名前、引数の型、引数の名前
{            // 関数定義開始
```

二行目

```
T            // 変数の型
abs_val;     // T 型の変数 abs_val を宣言した
```

あとは見たままで、結局のところ x の絶対値を返します。<br />

この関数を呼び出す時には、

```
 abs(-1.0);
 abs(-500);
```

のようにして呼び出します。<br />
するとコンパイラがコンパイルするときに自動で

```
float abs(float x){ float abs_val; ... }
```

や

```
int abs(int x){ int abs_val; ... }
```

を生成してくれます。<br />
つまり、コンパイラから見るとテンプレート関数は「コード生成のテンプレートとなる関数」なので、テンプレート関数と呼ばれるわけです。<br />

～補足～<br />
引数の型が決まっていない といっても、T と書いた型はすべて T で共通です(つまり、abs(-500)を呼び出したならその関数内のT型変数はすべてint型になる)<br />
そこで、二種類以上の違った型を引数に取りたいときは次のようにします。<br />

```
// 型T1のほうが型T2よりもビット幅が大きいなら true 、そうでなければ false を返す
template <typename T1, typename T2> bool bit_large(T1 a, T2 b){
 if( sizeof(a) > sizeof(b) ) return true;
 else return false;
}

int main(){
 char a; int b; double c;
 bit_large(a, b); // T1 は char, T2 は int になり、false が返る
 bit_large(c, b); // T1 は double, T2 は int になり、true が返る
 return 0;
}
```

また、以下のような特徴があります。

- インライン関数と同様に、本体と宣言と別々に書くことはできない
- typename の代わりに class と書いても同じ<br />

ちなみに、最初に定義した abs を独自に定義した型に対して適用するとどうなるでしょうか。<br />
例えば

```
struct Point{
 int x; int y;
};

int main(){
 Point p = {1, 2};
 abs(p);
 return 0;
}
```

のように。<br />
可能性は「 x >= 0 でおかしなことが起こり暴走する」か、「そもそもコンパイルが通らない」かのどちらかです。<br />
正解は後者で、暴走したりすることはありません。コンパイラが Point abs(Point x){ ... } を生成し、コンパイルしようと試みて失敗します。<br />
逆に言えば、 Point に int operator >= (int) が定義されているならば、この<strong>テンプレート関数は独自に定義した型に対しても適用できる</strong>ということで、非常に汎用性の高い関数を定義することができます。

## テンプレート関数のSpecialize {#v8ad9a07}
### 関数使用時のSpecialize {#yf6429ba}
テンプレート関数は、コンパイラが引数の型にあわせて自動で<typename T>のTを決定しますが、これを強制的に指定することもできます。<br />
次のようにします。

```
double a = abs<double>(-5);
```

このとき、引数が-5なので通常は int abs(int x){ ... } が生成されますが、関数名の後に<em><double></em>を指定することで強制的に double abs(double x){ ... } を生成させることができます。<br />

### 関数定義時のSpecialize {#g0cdfddc}
また、関数を定義する時に、「int型に対してだけ違う処理をしたい」といったことも可能です。次のようにint型に特化した関数を別につくってやります。<br />

```
template <typename T> T inc(T x){ // 通常のテンプレート関数
	return x+1; // 通常はx+1を返す
}

template <> int inc(int x){ // int型に特化したテンプレート関数
	return x+2; // int型が与えられたときだけx+2を返す
}
```

こうしてやると、引数がint型であった場合か、<em>inc<int>(引数)</em>とした場合に、後者の関数が呼び出されます。<br />

ポイントは、

- template <> を定義のはじめに書く
- 通常用の関数(template <typename T> ...)よりも後ろに書く


ことです。(template <> ... を前に書くとエラーになる)<br />
これは以下のようにしても実現できそうですが、微妙に動作が異なることがあります。

```
 template <typename T> T inc(T x){
	return x+1;
}

// int型専用の関数をオーバーロードして作っておく
int inc(int x){
	return x+2;
}
```

それは、「使用時の特殊化」でやったように、

```
cout << inc<int>(5) << endl;
```

とした場合です。この場合、使用するコンパイラによって「通常用のテンプレートで T = int としたものを生成する場合」と、「オーバーロードされたint型の関数を呼び出す場合」があります。<br />
<em>template <> int ...</em> を使えばこのような曖昧さは回避できます。

# テンプレートクラス {#p85810ac}
## 基礎 {#e49e91d3}
テンプレート関数と同様に、テンプレートクラスというものがあります。<br />
これは「メンバの型が実行時に定まるクラス」です。（テンプレート関数は「引数及び返り値の型が実行時に決まる関数」でした。）<br />
次のようにして定義します。

```
template <typename T>
class Point{
public:
	T x, y;
	Point(T x, T y){
	 this->x = x, this->y = y;
	}
};
```

template <typename T> の意味はテンプレート関数と同じです。（これはtemplateであって、Tというのは型の名前ですよ、という意味。詳しくはテンプレート関数の項を参照）<br />

このテンプレートクラスを使うには、次のようにします。

```
#include <iostream>

int main(){
	Point<int> a(1, 2);

	std::cout << a.x << " " << a.y << std::endl;
	return 0;
}
```

実行結果

```
1 2
```

Point型の変数を宣言するときに、Pointの後ろに<em><型名></em>をつけることで、クラス定義の中の T が指定した型になります。(上の例では T は int になる。)<br />

またテンプレート関数と同様に、二つ以上の型を取ることもできます。例えば、<br />

```
template <typename T1, typename T2>
class Point2{
public:
	T1 x;
	T2 y;
	Point2(T1 x, T2 y){
	 this->x = x, this->y = y;
	}
};
```

として、

```
#include <iostream>

int main(){
	Point2<int, float> a(1, 2.5);

	std::cout << a.x << " " << a.y << std::endl;
	return 0;
}
```

のように使えば、

```
1 2.5
```

となります。

## デフォルトtypename {#recbf60f}
typenameには、一般の引数と同じように、デフォルトの値を指定することができます。<br />

```
template <typename T = int> // ここに注目
class Point{
public:
	T x, y;
	Point(T x, T y){
	 this->x = x, this->y = y;
	}
};
```

上の例のように、デフォルトで指定したい型を<em><typename T = 型名></em>として指定しておきます。<br />
このとき、

```
Point<> a(1, 2);
```

としてPoint型変数を作ると、Tにはデフォルトのintが入り、

```
Point<int> a(1, 2);
```

としたのと同じことになります。(残念ながら <em>Point a(1,2);</em> とはできません。関数でもデフォルト引数があるからといって関数名の後の <em>()</em> を省略できないのと同じ、と思っておきましょう。)

また、次のようなこともできます。<br />

```
template <typename T1 = int, typename T2 = T1> // T1のデフォルトにint、T2のデフォルトにT1を指定
class Point2{
public:
	T1 x;
	T2 y;
	Point2(T1 x, T2 y){
	 this->x = x, this->y = y;
	}
};
```

このとき、次の3つは同じ意味です。

```
Point2<int, int> a(1, 3); // 通常の使い方
Point2<int> a(1, 3); 　　　// T1にintを指定。T2は指定しなければT1と同じになるので、自動的にintになる
Point2<> a(1, 3);　　　　　 // 両方何も指定しない。T1はデフォルトのintになり、T2はT1と同じになるのでintになる
```


## 補足 {#a8476bd4}
### 注意 {#ff0a4fec}
テンプレートクラスは、テンプレート関数およびインライン関数と同じく、「宣言と実体を別ファイルに書く」ことができません。<br />

### メンバ関数の宣言と定義を分けて書く方法 {#n262bf4d}
上の注意に書いたように、メンバ関数の宣言と定義を別ファイルに書くことはできませんが、一つのファイル内で別の場所に書くことならできます。<br />
次のようにします。

```
template <typename T>
class Point{
public:
	T x, y;
	Point(T x, T y); // ここでは宣言のみ
};

temaplate <typename T>     // これが実体を書くときににも必要
Point<T>::Point(T x, T y){ // 通常のクラスなら Point::Point(...){ ... } だが、クラス名の指定に<T>が必要
 this->x = x, this->y = y;
}
```

もちろん、typenameが二つ以上あればメンバ関数定義のクラス名の指定にもその数だけ書きます。

```
template <typename T1, typename T2>
class Point2{
public:
	T1 x;
	T2 y;
	Point2(T1 x, T2 y);
};

template <typename T1, typename T2>
Point2<T1, T2>::Point2(T1 x, T2 y){ ... }
```


## STL(StandardTemplateLibrary) {#q7037a7c}
C++には、テンプレートクラスの機能を利用したSTL(StandardTemplateLibrary; スタンダードテンプレートライブラリ)という物があります。<br />
これは何かというと、「便利な機能をまとめたクラスを、テンプレートを使って様々な型に適用できるようにしたもの」です。<br />
例えば、

- どんな型でも入る(テンプレートの機能)、自由に伸び縮みする配列(クラスを使って実装)のようなもの
- どんな型でも入る(テンプレートの機能)、ハッシュ表(クラスを使って実装)のようなもの


などがあります。<br />

- →[参考サイト](#ref-stl)


# C++からCの関数を呼び出す方法 {#z883fba1}
C++はCの(ほぼ)上位互換であり、同じコンパイラでコンパイルできます。<br />
しかし、C++からCの関数を呼び出すには注意が必要です。

例えば、 A.c というソースコードと、A.c にある関数が宣言された A.h というヘッダがあったとして、次のような B.cpp を作ったとします。

```
 #include <iostream>
 #include "A.h"
 
 int main(){
  std::cout << a("foo_bar") << std::endl; // A.hで char* a(char* s); と宣言されているとする
  return 0;
 }
```

この状態で A.c と B.cpp をプロジェクトに追加して、VisualC++6.0でビルドすると、

```
 B.obj : error LNK2001: 外部ｼﾝﾎﾞﾙ ""char * __cdecl a(char *)" (?a@@YAPADPAD@Z)" は未解決です
```

と表示され、ビルドできません。(VC++6.0に限らずどんな開発環境でもビルドできない)<br />

では、これを解決する方法を説明します。
## とりあえず解決法 {#of734d81}

- A.hの関数プロトタイプ宣言を、 「extern "C" {」 , 「}」 でくくる
- ただし、こうするとC言語の仕様から外れるので、C++のコードからincludeされたときのみ有効になるように、「#ifdef __cplusplus」 , 「#endif」 を使う<br />

以上をふまえて、修正された A.h は次のようになります。

```
 #ifdef __cplusplus
  extern "C" {
 #endif
 
 char* a(char* s); // 元々あった宣言文たち
 ......
 
 #ifdef __cplusplus
  }
 #endif
```

これでめでたくビルドに成功します。
## 解説 {#ua7c866c}
なんでこんなことが必要なのか知りたい人のために解説です。<br />

まず、C、C++のコードはコンパイラによってアセンブリ言語に変換されます。<br />
その際、各関数にあたる部分のコードのはじめには、ラベルという目印が付きます。<br />
(例えば、たいていのCコンパイラなら a という関数のはじめには _a というラベルがつき、a を呼び出す時には call _a などという命令を呼びます。)

このラベルのつけ方が、CとC++で異なるために、extern "C" を使う必要が発生します。<br />
C++では、同じ名前の関数でもオーバーロードが可能なため、 _a という簡単なラベルではなく、関数名、引数の型 の情報を持ったラベル名が使われます。<br />
つまり、 B.cpp の a の呼び出し部分は

```
 call _acharp
```

のようになるわけです。（これは例で、実際のラベル名は符号化されてぱっと見ても引数の型がわかるようにはなっていませんが。）<br />
しかし A.c はCモードでコンパイルされているので、関数aのラベルは _a となっており、 _acharp というラベルは見つからずエラーとなります。<br />

では extern "C" はどのような意味があるかというと、「この関数はCのラベル名で探してね」
とコンパイラに指定する働きがあります。<br />
このおかげで B.cpp の a の呼び出し部分が call _acharp ではなく

```
 call _a
```

となり、めでたく関数aを見つけることができて呼び出せる、というわけです。<br />

注)以上を考えると、 extern "C" を使わなくても A.c をC++モードでコンパイルすればいいということに気づきます。実際、拡張子を .cpp に変えるかコンパイルオプションでC++としてコンパイルすれば、 A.h を修正しなくてもすみます。しかしあらかじめコンパイル済みのライブラリなどを使う（または配布する）ときにはそうはいかないので、extern "C" を使います。

# ほんのり多態性の紹介 {#nff24e0f}

例えばこんなクラスを定義(Character.h)したとして

```
class Character
{
public:
//	virtual void Say() = 0;		// 一身上の都合により純粋仮想関数にはしない
	virtual void Say() {	std::cout << "セリフが無いんじゃよ" << std::endl;}
};
class Hero : public Character
{
public:
	void	Say()	{	std::cout << "悪が栄えた試しなし！" << std::endl;		}
};
class Zako : public Character
{
public:
	void	Say()	{	std::cout << "イー！" << std::endl;	}
};
class Boss : public Character
{
public:
	void	Say()	{	std::cout << "やっておしまい！" << std::endl;	}
};
```


こんな感じだね。よく初心者サイトに載ってる例は。
でも、これだと、どんなメリットがあるのか良くわかんないんだよね。

```
#include<iostream>
#include "Character.h"
using namespace std;
int main()
{
	Hero	a;
	Zako	b;
	Boss	c;
	a.Say();
	b.Say();
	c.Say();
	return 0;
}
```

実行例

```
c:\>Sample
悪が栄えた試しなし！
イー！
やっておしまい！
```


ちなみに、こんなことはしちゃだめね。<br />

```
#include<iostream>
#include<list>
#include "Character.h"
using namespace std;
int main()
{
	Hero	a;
	Zako	b;
	Boss	c;
	list<Character>	aryCharacter;
	aryCharacter.push_back(a);
	aryCharacter.push_back(b);
	aryCharacter.push_back(c);
	for(list<Character>::iterator iter = aryCharacter.begin(); iter != aryCharacter.end(); ++iter){
		iter->Say();
	}
	return 0;
}
```

- listはSTLに含まれるコンテナで、すさまじく簡単に言ってしまえば動的な配列の一つ。{{br}}
- iteratorはコンテナにアクセスするためのもので、ポインタみたいに使える。

実行例

```
c:\>Sample
セリフが無いんじゃよ
セリフが無いんじゃよ
セリフが無いんじゃよ
```


動的生成すると、ちゃんと動作するんだけど、メモリリーク対策が面倒くさい。
この例ではたった３行だけどね。

```
#include<iostream>
#include<list>
#include "Character.h"
using namespace std;
int main()
{
	Hero	a;
	Zako	b;
	Boss	c;
	list<Character*>	aryCharacter;
	aryCharacter.push_back(new Hero);
	aryCharacter.push_back(new Zako);
	aryCharacter.push_back(new Boss);
	for(list<Character*>::iterator iter = aryCharacter.begin(); iter != aryCharacter.end(); ++iter){
		(*iter)->Say();
	}
	for(list<Character*>::iterator jter = aryCharacter.begin(); iter != aryCharacter.end(); ++iter){
		delete *jter;
	}
	return 0;
}
```

実行例

```
c:\>Sample
悪が栄えた試しなし！
イー！
やっておしまい！
```


そしてメモリリーク対策としてスマートポインタ(boostライブラリのshared_ptr)を導入してみる。
（STLにはスマートポインタとしてauto_ptrがあるけど、コンテナに入れることは出来ない）<br />
できたー！　って思ってテストしたらなんか動作がおかしい…もしかしてメモリリーク？
って思ったのでは、せっかくの多態性の恩恵も台無しだから、慣れない内・使えない事情が無いならば、使っとけ！

```
#include<iostream>
#include<list>
#include<boost/shared_ptr.hpp>
#include "Character.h"
using namespace std;
int main()
{
	typedef boost::shared_ptr<Character>	pChar;
	list<pChar>	aryCharacter;
	aryCharacter.push_back(pChar(new Hero));
	aryCharacter.push_back(pChar(new Zako));
	aryCharacter.push_back(pChar(new Boss));
	for(list<pChar>::iterator iter = aryCharacter.begin(); iter != aryCharacter.end(); ++iter){
		iter->get()->Say();
	}
	return 0;
}
```

実行例

```
c:\>Sample
悪が栄えた試しなし！
イー！
やっておしまい！
```


で、こーなってくると、動的生成部分がもーちょっとなんとかならんかなーて思うんだよね。
戻り値がCharacter*な関数があれば、いろいろ便利になる。
しかし面倒くさくなったので、興味がある人は"[Factory](/docs/Factory) デザインパターン"(abstractを加えても良い)で
ググってくれたまえ！

# typeid演算子 {#qeb6122d}
C++では型の情報を表す新しい演算子、typeid が追加されました。<br />
sizeof と同様にして、typeid(int) や typeid(変数名) のように使えます。<br />

typeid 演算子が返すのは const type_info& であり、type_info クラスには次のメンバがあります(コンストラクタ等は省略)

```
class type_info {
public:
 bool operator==(const type_info& rhs) const; // 二つの type_info が等しいか
 bool operator!=(const type_info& rhs) const; // 二つの type_info が等しくないか
 int before(const type_info& rhs) const;      // 引数で与えられた type_info が、自分の表す型からの派生型であるか
 const char* name() const;                    // 型の名前
 const char* raw_name() const;                // 型の修飾子付きの名前、ただし符号化されていて人間には読めない
};
```


typeid は次のように使います。<br />

```
#include <iostream>
//#include <typeinfo> // type_info クラスが宣言されているが、通常 iostream から読み込み済みであるので不要

using namespace std;

class A{};

int main(){
 A a, aa;
 int b;
	
 cout << typeid(a).name() << endl;
 cout << typeid(a).raw_name() << endl;

 // a の型と aa の型が等しいか？
 if( typeid(a) == typeid(aa) ){
  cout << "typeid(a)==typeid(aa)" <<endl;
 }

 // a の型と b の型が等しいか？ 	
 if( typeid(a) == typeid(b) ){
  cout << "typeid(a)==typeid(b)" <<endl;
 }

 return 0;
}
```

実行結果

```
class A
.?AVA@@
typeid(a)==typeid(aa)
```

<br />

- 注意<br />
  - name, raw_name の出力は環境によって変わることがあるので、 strcmp(typename(a).name(), "class A") のようなコードは推奨されません。
  - [Microsoftのリファレンス](http://msdn2.microsoft.com/en-us/library/70ky2y6k(VS.80).aspx)によると、<em>There is no guarantee that type_info::before will yield the same result in different programs or even different runs of the same program.</em>(<strong>異なるプログラム中でbeforeメンバが同じ結果を返すという保障はないし、同じプログラムを2回走らせたときでさえその保障はない。</strong>)とあるので、<strong> == , != 以外のメンバは使わないことを推奨</strong>します。
  - gcc の type_info には、raw_name メンバはありません。


# 参考サイト {#rb5082c0}

- [ロベールのＣ＋＋教室](http://www7b.biglobe.ne.jp/~robe/)<br />
  最初からC++を扱ってます。とはいっても、プログラミングを全く知らない初心者対象なので、Cを知っている必要はありません。猫でも分かるとの違いは、Cに限った知識（C++ではより高い機能に置き換えられた知識）は掲載されていないこと、文法を集中的に解説して、応用はあまり載っていないこと、Windowsプログラミングに関しては全く掲載されていないことあたり。説明にはVC++を用いており、出版もされています。
- [Programing Place C++編](http://www.geocities.jp/ky_webid/cpp/language/index.html)<br />
- WisdomSoft -
- [Bjarne Stroustrup: 標準C++を新しい言語として学ぶ](http://www.libjingu.jp/trans/new_learning-j.html)
- [Stroustrup: C++ Style and Technique FAQ 日本語訳](http://www.libjingu.jp/trans/bs_faq2-j.html)
- [豊田孝のIT談話館 標準C++の歴史と哲学](http://www.ttoyota.com/php/cppintro.php)<br />
  C++を中心とした知識の基礎固めに。<br />
  IT全般に関する記事の他に「VC++ 2005 Express Edition」に関する連載もあったりしますが、全体を通してHow-Toでは無く考え方を身に付ける、という感覚で読む記事だと思います。
  - [Visutal C++ 2005/2008 Express Edition（IDE無料化の背景）](http://www.ttoyota.com/php/myvcee.php)<br />
    無料開発ツール「Visual C++ Express Edition」の活用方法
- [コンピュータ基礎とプログラミング](http://ipl.sfc.keio.ac.jp/text/com-pro-2007-9/main.html)<br />
  MacOS X,Emacs,g++の環境でC/C++
- [プログラミングの禁じ手Web版 C++編](http://web.archive.org/web/20070826221724/http://www.cmagazine.jp/src/kinjite/cpp/index.html)<br />
  C/C++のコードを書く上でやってはいけないことを列挙したサイト。C++はテンプレートや名前空間に言及していないなど、やや記述が古いですが、それでもクラスに関する禁じ手は今なお有効です。バグを埋め込みがちな初心者がレベルアップする第一歩に。~<br />
  サイトが落ちてるのでWeb Archiveで。C MAGAZINEも休刊したしなあ。
- [More C++ Idioms - Wikibooks, collection of open-content textbooks](http://en.wikibooks.org/wiki/More_C%2B%2B_Idioms) - 英語
  - [More C++ Idioms - Wikibooks](http://ja.wikibooks.org/wiki/More_C%2B%2B_Idioms) - 対象とする読者： C++ と関連するパラダイムについてほどほどのレベルの知識を持つ人誰でも
- [ライブラリ リンク コレクション - Cppll](http://www.cppll.jp/wiki/%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA_%E3%83%AA%E3%83%B3%E3%82%AF_%E3%82%B3%E3%83%AC%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3)
- [link集/開発言語系/C++ - NomisoBraaan Wiki](http://www.nbrains.net/php/pukiwiki/index.php?link%BD%B8%2F%B3%AB%C8%AF%B8%C0%B8%EC%B7%CF%2FC%2B%2B)
  - [link集/ライブラリ系/C++ - NomisoBraaan Wiki](http://www.nbrains.net/php/pukiwiki/index.php?link%BD%B8%2F%A5%E9%A5%A4%A5%D6%A5%E9%A5%EA%B7%CF%2FC%2B%2B)
- [C/C++ セキュアコーディングセミナー資料 - JPCERT コーディネーションセンター](https://www.jpcert.or.jp/research/materials.html)
- [CERT C++ Secure Coding Standard - CERT Secure Coding Standards](https://www.securecoding.cert.org/confluence/pages/viewpage.action?pageId=637)
- [C++ Reference [C++ Reference]](http://www.cppreference.com/wiki/start)
  - [C++ リファレンス(日本語版) [C++ Reference]](http://www.cppreference.com/wiki/jp/start)
- [cplusplus.com - The C++ Resources Network](http://www.cplusplus.com/)
  - [Documentation](http://www.cplusplus.com/doc/)
  - [C++ Reference](http://www.cplusplus.com/reference/)
  - [C++ Sourcecode](http://www.cplusplus.com/src/)
- [Visual C++ の勉強部屋](http://homepage3.nifty.com/ishidate/vcpp.htm)<br />
  画像処理、電気回路の計算、統計、簡単なGUIなど~<br />
  2005、2008、2010

## C++規格 {#d805cd5c}

- [ISO/IEC JTC1/SC22/WG21 - The C++ Standards Committee](http://www.open-std.org/jtc1/sc22/wg21/) - 最新ドラフト、修正リスト
- [C++ Final Draft International Standard](http://www.kuzbass.ru:8086/docs/isocpp/) - Final Draft International Standard(国際標準最終草案) ISO/IEC FDIS 14882:1998(E)
- [日本工業標準調査会：データベース検索-JIS検索](http://www.jisc.go.jp/app/JPS/JPSO0020.html) - JIS検索：X3014（閲覧のみ） ISO/IEC 14882:2003 対応
- [JSA Web Store - JIS X 3014:2003 プログラム言語Ｃ＋＋](http://www.webstore.jsa.or.jp/webstore/Com/FlowControl.jsp?bunsyoId=JIS+X+3014%3A2003&dantaiCd=JIS&status=1) - 購入：和文PDF ダウンロード


## STL {#ref-stl}

- [Standard Template Library プログラミング on the Web](http://www005.upp.so-net.ne.jp/episteme/html/stlprog/)
- [C++ Standard Template Library [C++ Reference]](http://www.cppreference.com/wiki/stl/start)
  - [C++ 標準テンプレートライブラリ [C++ Reference]](http://www.cppreference.com/wiki/jp/stl/start)
- [角 正史のページ &gt; STLのページ](http://www.wakhok.ac.jp/~sumi/stl/index.html)
- [ProgramingPlace &gt; C++編（標準ライブラリ）](http://www.geocities.jp/ky_webid/cpp/library/index.html)
- [MENISYS-Labo.HP &gt; C++Builder 邪道TIP集](http://orange.zero.jp/cycode.wing/tips/cbuilder/) - オンライン要約マニュアル、STL HTML HELP(CHM) のダウンロード
- [標準 C++ ライブラリ・ユーザーズガイド](http://docs.sun.com/source/820-2985/general/index.htm) - Rogue Wave Software, Inc.
- [Codian](http://www.kab-studio.biz/Programing/Codian/) -

iostreamについて詳しいサイト。C++自体の解説もありますが、他のサイトの方が詳しいです。C++の文法を一通り習得した人向け。「"std::cout<<str"の"cout"とか"<<"って一体何なの??」と思ってる人にとっては目から鱗です。

- [S34 &gt; STL samples](http://www.s34.co.jp/cpptechdoc/reference/stl_samples/index.html)
- [MSDN &gt; Standard Template Library Samples](http://msdn.microsoft.com/en-us/library/f1dtts6s(VS.80).aspx) - VC2005
- [MSDN &gt; Standard Template Library Samples](http://msdn.microsoft.com/en-us/library/f1dtts6s.aspx) - VC2008



<div class="footnotes">
<hr />
<ol>
<li id="fn-1">参考：[CからC++を学ぼうとしないこと](http://www.ttoyota.com/howtolearncpp/no7learncpp01.php) <a href="#fnref-1" class="footnote-backref">&#8617;</a></li>
<li id="fn-2">プログラミング言語C++を設計し、最初に実装した人：[ビャーネ・ストロヴストルップ - Wikipedia](https://ja.wikipedia.org/?curid=34402) <a href="#fnref-2" class="footnote-backref">&#8617;</a></li>
<li id="fn-3">参考：[概念とテクニックを学ぶこと](http://www.ttoyota.com/howtolearncpp/no7learncpp02.php) <a href="#fnref-3" class="footnote-backref">&#8617;</a></li>
</ol>
</div>
