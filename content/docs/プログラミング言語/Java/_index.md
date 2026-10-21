---
title: "Java"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "Java"
draft: false
---

# Java {#k043866f}


## はじめに {#haa5c093}

- ソースの行頭に行番号が書いてあります．
  - 解説のためなので，コピペするときは消してね＾＾
- インデントはオレ流(笑)
- 引用以外の箇所で所々?が出てきます
  - これはwikiが勝手にリンクだと解釈して付加したものの可能性が非常に高いです．
  - カーソルをあわせて指先マークに変わったら間違いなくwikiの仕業．
  - とりあえず無視することをｵﾇﾇﾇ．


## 言語の特徴 {#b1aa0413}

- OSに依存しない
  - JavaはJava VM(Java Virtual Machine:JVM)というソフトウェアの上でプログラムを実行します．
  - このJava VMがOSの差異を吸収するので，Javaで作られたプログラムはOSを気にせずに動作させることが出来るのです
    - Java VMの仕様は、Java仮想マシン仕様として公開されており、Sun, IBM, HPなど各社が種々のOS向けのJava VMを提供している．
- オブジェクト指向
  - うはｗｗｗｗｗｗｗｗｗテラオブジェクトｗｗｗｗｗｗｗｗｗｗｗ
- ライブラリが豊富
  - 基本的な機能がすでにライブラリとして存在するので，部品を組み合わせて調整するだけでそれなりのものがさっくり出来ます．
- 重い(遅い)
  - 前述のように，Java VMを使っているせいです．
  - 要するにOSの上でもう一つOSを動かしているような物なので，そりゃ遅くなりますわな．
  - 最近はPCのスペックがあがってきてるのでそれほどストレスを感じることも無いですが．


## インストール {#d90f6540}

- 統合開発環境(IDE)のEclipseを利用することにします．
- とりあえずEclipse自体もJavaで書かれているのでJavaプログラムを実行できる環境を用意します．
- JREをダウンロードして適当にインストールします．規約なんか読まないでしょ？俺も読まない．
- そんでAll-In-One Eclipseをインストールする。
  - インストール方法は[ここ](https://sourceforge.jp/projects/aioec/files/?release_id=21787#21787)。3.0.1が最新だぞ
  - eclipseに挫折した場合はこっちも見てみてね
    - [eclipse以外の方法](/docs/プログラミング言語/Java/eclipse以外の方法)


## Eclipseの使い方 {#s81d46f6}
### 発動起動編 {#h89dc71e}

1. Eclipseディレクトリ(若い人はフォルダっていうのか)の中にあるEclipse.exeを起動．
1. 起動時にワークスペースを尋ねてきますが，まぁ適当でOKです．
1. 初期化に少々かかってEclipse起動．


### プロジェクトを作ろう編 {#kdd42554}

1. 「ようこそ！」みたいな画面が出る．
1. 眺めてもいいけど鬱陶しいのでさっさと閉じてしまう．
1. ペインがいくつか分かれているが，左の「パッケージエクスプローラー」で右クリック → 新規 → プロジェクト．
1. Javaプロジェクトを探して「次へ」．
1. プロジェクト名を適当な英数字でつけて「終了」．
1. するとパッケージエクスプローラーにプロジェクトが作成される．

### いよいよクラスだ編 {#sd4c47fe}

1. さっきのプロジェクトを右クリック → 新規 → クラス．
1. で，適当な名前をつけて，「public static void main(String[] args)」のチェックを入れて「終了」．
1. 警告出るけどエラーじゃないから気にすんな．
1. これでクラスのひな形が出来たから中身を記述すればおｋ．
1. 「クラス名がわからない」「あのメソッドなんだっけ？」っていう時はCtrlとスペースキーを押すと候補の一覧が出ます(便利！)．
1. その候補を選択してエンターを押せば勝手に入力してくれる(便利！)．


### さぁデバッグだ編 {#gfb39608}

1. プログラムが完成したらデバッグです．
1. ツールバーの虫アイコンの右にある▼を押して，メニューから「構成およびデバッグ」を選びます．
1. 作っているプログラムのタイプ(このページのサンプルならJavaアプリケーション)を右クリック，「新規」を選びます．
1. パッケージエクスプローラーでクラスが選ばれているとその情報が代入されますが，入力されていないときは「参照」やら「検索」やらで適当にやってください．
1. 入力が終わり，「デバッグ」を押すとデバッグが開始されます．
1. 後はツールバーの虫アイコンをクリックするたびに，直前に行われた情報でデバッグを繰り返します．


### もうちょっとだけ続くんじゃ編 {#kfc37e84}

1. デバッグの虫アイコンの右に，●に三角を組み合わせたアイコンがあります．
1. 基本はデバッグと同じですが，こちらは「実行」です．
1. 実行の方が早いのですが，デバッグだといろいろな情報をデバッグ用に保持するので，例外が起きた行がわかったり，ブレークポイントを仕掛けることが出来ます．
1. キーボードからの入力のサンプルプログラムで使っているprintStackTraceなんかで行番号がわかると便利です．
1. 詳細はググってね＾＾


## サンプルコード {#r40b0a47}
### Hello World {#k89a1c58}

とりあえず基本ですね

- HelloWorld.java


```
1: public class HelloWorld{
2:   public static void main( String[] arg ){
3:     System.out.println( "Hello World" );
4:   }
5: }
```


実行結果

```
Hello World 
```


|1行目|クラスを宣言しますが，クラス名はファイル名と同一にします．|
|---|---|
||違う場合はエラーになり，コンパイラに怒られてしまいます．|
|2行目|プログラムを実行したときに，まずこのmainが実行されます．|
||前後についているpublic static voidやString[] argは今は無視して構いません．|
|3行目|画面に「Hello World」を出力します．|
||System.out.printlnというのが画面に改行付きで文字列を出力する機能(関数，もしくはメソッドと呼びます)です．|
||Javaがこのメソッドを用意しているので，括弧の中に出力したい文字列を代入する(引数を与えるといいます)だけで機能が使えます．|
||正確にはメソッドはprintlnで，System.outはそのメソッドがどこにあるか(どのライブラリに含まれているか)を指しています．|

### キーボードからの読み込み。 {#vaf57385}

基本その2。キーボードで入力した文字をそのまま出力するぞ。

- InputFromKeyBoard.java


```
 1: import java.io.*;
 2: public class InputFromKeyBoard{
 3:   public static void main( String[] arg ){
 4:     String strTemp = new String();
 5:     try{
 6:       System.out.println("なんか文字入力してちょ");
 7:       BufferedReader br = new BufferedReader( new InputStreamReader( System.in ));
 8:       strTemp = br.readLine();
 9:     }catch( Exception e ){
10:       e.printStackTrace();
11:     }
12:     System.out.println( "入力された文字は「" + strTemp + "」");
13:   }
14: }
```


実行結果　これはコンソールに出る


```
なんか文字入力してちょ
hoge ←適当に文字を入力
入力された文字は「hoge」
```


|1行目|ライブラリを使うときはimport文でライブラリを宣言します|
|---|---|
||ライブラリ=機能をまとめた物と考えて当座は大丈夫です．|
|4行目|文字列を扱うために，String型(クラス)でstrTemp(インスタンス)を宣言します．|
||=の後のnew演算子で，これが新しいインスタンスだということを表します．|
||その後のString()は，strTempに与える初期設定です．|
||これはクラスごとにいろいろな物があります．|
|5行目|エラーが起きたときに，try～catchでそれを捉える事ができます．|
|7行目|キーボードから読み込むためのインスタンスを作ります．|
||BufferdReaderは入力をシステムである程度貯めて(バッファして)読み込むクラスです．|
||=以下，BufferedReaderは読み込みのストリーム(後述)を必要とするので，初期化の際に与えてやります．|
||読み込みストリームはSystemのin(デフォルトではキーボード)から得ます．|
|8行目|strTempに先ほどのbrからreadLineメソッドを用いて1行読み込みます|
|9行目|tryからココまでの間にエラーが起きればeに情報が代入され，処理が括弧の中に移ります．|
|10行目|eの中に含まれる情報から，何処でエラーが起こったのかを表示します．|
|12行目|入力した文字列をそのまま表示します|

### swingを使ってGUIを作ってみよう {#icc727f3}

ちょっとアプリケーションっぽくなってくる

- SwingTest.java


```
 1: import java.io.*;
 2: import javax.swing.*;
 3: 
 4: public class SwingTest{
 5:   public static void main( String[] arg ){
 6:     String strTemp = new String();
 7:     try{
 8:       BufferedReader br = new BufferedReader( new InputStreamReader( System.in ));
 9:       strTemp = br.readLine();
10:     }catch( Exception e ){
11:       e.printStackTrace();
12:     }
13:     JFrame frm = new JFrame( "SwingTest" );
14:     JTextArea txt = new JTextArea( strTemp );
15:     frm.getContentPane().add( txt );
16:     frm.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
17:     frm.pack();
18:     frm.setVisible( true );
19:   }
20: }
```


|2行目|SwingというGUIの部品が詰まったライブラリを使います．|
|---|---|
|13行目|まず表示される枠，JFrameを作ります．引数で与えてるのはフレームの上部に表示されるタイトル．|
|14行目|テキストの表示用に，入出力が可能なTextAreaを用意します．引数はキーボードから入力された文字列．|
|15行目|フレームにテキスト枠を追加|
|16行目|フレームを閉じたときのふるまい．今回はJFrameで用意されているEXIT_ON_CLOSE(閉じられたら終了)を使用．|
|17行目|フレームを適切なサイズに変更．|
|18行目|フレームの表示|

WindowsのAPIだとめんどくさくて仕方のないGUIの表示がJavaだとこんなに簡単．<br />
宣言を入れてもわずか7行で済んでしまう．<br />
GUIアプリを作りたいけどAPIまんどくせ＾＾；っていう時は「OSに依存しないんでｗｗｗｗｗｗｗｗ」を切り札にJava使っちゃうのもアリだと思う．

高速演算は向いてないし，Windowsに限れば.NET FrameWork使えばGUIもわりと楽なんだけどね．

Eclipseでポトペタ
http://www.eclipsewiki.net/eclipse/?GUI%A5%D7%A5%E9%A5%B0%A5%A4%A5%F3

## 基礎的な構文 {#ka44bfda}
### 1行の扱い {#ccabbd5c}

Javaではセミコロン( ; )にぶつかるまでを1文としています．<br />
そのため

```
hoge foo = bar;
```

と

```
hoge foo
=bar;
```

は意味的に同じです．<br />
また，中括弧{}で囲まれたブロックを1文として扱います．

```
hoge;
foo;
```

だと2文ですが，

```
{ hoge;
foo;
}
```

だと1文という扱いになります．
### if～else {#xdd4e806}


```
if( 条件式 )
条件を満たしたときに実行される文
else
それ以外でのときに実行される文
```


条件式の結果が真(結果が0以外になった)なら直後の文を実行
偽ならelse文を実行
### while {#f29755c8}


```
while(条件式)
条件を満たす間実行される文
```


条件式を満たしている間，whileの次の文を実行する

### for {#f31444c4}


```
for( 初期化式; 繰り返し条件; 条件判定の前に実行される文)
繰り返し条件を満たす間実行される文
```


for文が実行されるとき，最初に1度初期化式が実行されます．<br />
そして繰り返し条件を満たす間，次の文が繰り返されます．<br />
for文3つめのパラメータは，命令実行後，繰り返し条件の判定の前に実行されます．

例)

```
for( i = 0; i < 10; i ++ )
```


この場合，for文が実行されるときにiに0を代入し，iが10より小さい間次の命令が実行されます．<br />
命令が終わった後でiを+1することで，結果的に10回の繰り返しとなるわけです．

## 基本的な変数 {#h44862a0}
### 変数って何？ {#obc08d06}

数学でいうnの様に，値を代入できる記号のようなもの，と捉えていいかもしれません．<br />
変「数」とついていますが，数字以外にも文字やフラグの場合もあります．<br />
しかし，数を代入する変数には数を，文字を代入する変数には文字を入れなくてはいけません．

### どう使うのよ？ {#s2f94480}

たとえば上記のサンプルコードで画面に文字列を出力する際，println( "hoge" )と書いたらどうなるでしょうか？<br />
この場合プログラムに hoge を出力しろ と書かれているのでつねに hoge が出力されることになります．<br />
サンプルコードではString型の変数を引数に与えることで，「プログラム作成時に決めた文字」ではなく，「プログラム実行時に決めた文字」を出力しています．<br />
このように，「値が固定されていない場合に，代わりに使う物」みたいな感じです．<br />
もちろん「変数は代入できる」ものですから，メソッドの結果を受け取ることも出来ます．

## クラスの基礎 {#b549c68b}
### クラスって何？ {#x5cc152e}
簡単に言うと、「変数やらそれをいじくる機能やらを一まとめにしたもの」です。実際に使ってみたらわかる。<br />
C（C++でなくてよい）がわかることを前提として書いてます。

### クラスを使ってみる {#ibf0db8e}
クラスを使ってみて感じをつかみましょう。
int型の変数をより便利にしたようなクラス、Integerを使ってみます。

```
public class test{
 public static void main(String[] args){
  Integer a = new Integer(10);

  System.out.println(a.intValue());
 }
}
```


3行目

```
Integer a = new Integer(10);
```

まず左辺でInteger型の変数aを作成し、右辺にあるものをaに代入します。

```
new Class-name(あれば引数)
```

とすると、Class-name型の変数に代入できる「実体」（インスタンスという）が作られます。
（Integerクラスというものの作り方がわかっていて、new Integer(10)とすると値を10にしたIntegerを作る　といった感じ。）

5行目

```
a.intValue();
```

はaの持っている値を返す関数のようなもの（メソッドという）です。

```
変数名.メソッド名(あれば引数)
```

とすることでその変数のクラス（aならばInteger）の持っているメソッド（ここではaの持っている値を返すという動作）を呼び出すことができます。

### もうちょっと使ってみる {#rde8d327}
次はStringクラスを使ってみます。

```
public class test2{
 public static void main(String[] args){
  String str = new String("Vipper!!");
   // Vipper!!という文字列を持ったStringクラスのインスタンスを作成

   System.out.println(str); // strをそのまま表示
   System.out.println(str.length()); // strの長さを表示
   System.out.println(str.toUpperCase()); // strを大文字にして表示
 }
}
```

ここではクラスの使い方をつかんでもらえればOKです。
Stringクラスに他にどんなメソッドがあるかは適当にぐぐってくれ。

### クラスを作ろう {#e648c0b3}
次はクラスを作ってみます。自分で作ってみると一気に理解が深まる・・・かもしれない。<br />
次のコードを見てください。

```
class myInt{
  private int value;

  public myInt(int i){
   value = i;
  }
  public int intValue(){
   return value;
  }
  public int intValueNegative(){
   return -1 * value;
  }
}

public class test3{
  public static void main(String[] args){
   myInt a = new myInt(5);

   System.out.println(a.intValue());
   System.out.println(a.intValueNegative());
  }
}
```


出力

```
5
-5
```


二行目

```
private int value;
```

クラスの中に入っている変数をフィールドといいます。これは「値を保持するための場所」ですね。
test2で10という値を保持していくれていた場所もフィールドです。<br />
private, publicについては後で説明します

四行目～六行目

```
public myInt(int i){
 value = i;
}
```

クラスの名前と同じ名前のメソッドを、コンストラクタといいます。
これは

```
myInt a = new myInt(5);
```

としたときに呼び出されるものです。
つまり上のコードではmyInt型のインスタンスをつくり、その保持する値(a.valueの中身)を5にしているわけです。

あとはだいたい見ればわかってもらえると思います・・・<br />

### アクセス指定子 {#s651da5f}
先ほどのtest3で、privateとかpublicとかいうものがありました。これについて説明します。<br />
一言でいうと、

```
public: クラスの外からアクセスできる
private:　クラスの外からアクセスできない
```

です。（他にprotectedというのがありますがこれはクラスの継承をやったときに説明します。）<br />
例えば、myIntのintValueメソッドはpublicなので、myIntクラスの外から

```
System.out.println( a.inValue() );
```

という風に呼び出すことができました。<br />
一方、valueはprivateなので

```
a.value = 10;
```

などと値を変えようとしてもエラーになります。

publicは「外部に公開する値やメソッド」、privateは「外から勝手にいじられなくない値」に指定します。<br />
例えば文字列の長さなどはint型で保持されているでしょうが、外から勝手に書き換えられたらこまります。
（しかし長さが見れないと意味がないので、 public な length() というメソッドを作って値を見ることだけはできるようになっています。）

```
public class String(){

 private int length; // 外から str.length = 10; とかやられると困るのでprivate

 //コンストラクタとか

 public int length(){
  return length;
  // こうすることで外から str.length() を呼べば長さがわかる。でもやっぱりlengthを勝手に書き換えることはできない。
 }
}
```

こんな感じになっています。（本当はpublic final class String extends Objects ... だが今は関係ないことばかりなので簡単に public class String としました。）

### thisについて {#g2d6baf7}
上のmyIntのコンストラクタは

```
public myInt(int i){
 value = i;
}
```

となっています。<br />
しかし仮引数の名前にはiよりかはvalueを使いたいところですよね？<br />
でもそれだとクラスフィールドのvalueと名前が衝突してどっちかわからなくなるし・・・

といったときに登場するのが this です。具体的には次のようにします。

```
public myInt(int value){
 this.value = value;
}
```

myIntのコンストラクタの仮引数の名前を変更しました。また代入文の先頭にthisというのがついています。<br />

```
this.変数名
```

とすると、「クラスフィールドの中にある変数のどれか」を表します。（本当は thisは自分自身を表す参照 と書くべきですが参照とかやってないしわかりにくいのでとりあえずはこうおもっておきましょう。）

```
オレの.value
```

見たいなもんです。
んで、なぜ上のコードでOKかと言うと、名前が被ったときはクラスフィールドの変数よりも仮引数のほうが優先されるからです。<br />
つまり、 myInt(int value) の中で普通に value と書くと仮引数のvalueを表します。したがって上のコードは

```
オレの.value = (仮引数の)value
```

となって、めだたくクラスフィールドのvalueに引数で与えられたvalueが代入されるというわけです。

## staticメソッド {#u17655b3}
### staticメソッドとは {#wf2f2fc5}
クラスにはメソッドがありましたが、メソッドを呼び出すときにいちいちそのクラスのインスタンスを作る必要を感じない時があります。
例えば整数を扱うクラスIntegerは、String型をint型に変換するクラスparseIntを持ちますが、これを呼び出すのに

```
Integer it = new Integer(0);
...

int x = it.parseInt("1234");
```

などとするのは無駄な気がします。
なぜなら文字列を数に変換する操作は「普遍的」なもので、コンストラクタに与えた 0 などはまったく関係ないからです。

実は、parseIntを呼び出すのにインスタンスを作る必要はなく、

```
int x = Integer.parseInt("1234");
```

のように使えます。このようにインスタンスを作らずとも呼び出せるメソッドのことを<strong>staticメソッド</strong>といい、ドキュメントなどでは

```
static int parseInt(String)
```

などとかかれています。
### staticメソッドの作り方 {#t858ee5c}
自分で作ったクラスにstaticメソッドを持たせるには、そのメソッドの返り値型の前, アクセス指定子の後ろにstaticをつけます。以下ではxのハイパボリックサインを求めるメソッドsinhを定義しています。

```
class MyMath{
  public static double sinh(double x){
    return (Math.exp(x)-Math.exp(-x))/2;
  }
}
```

Math.exp(x)ではMathクラス(あらかじめ用意されている)のstaticメソッドexpを呼び出しています。

このようにして作ったメソッドsinhは、MyMathのインスタンスを作ることなく呼び出せます。

```
double p = MyMath.sinh(1.0);
```


## クラスの継承 {#c486a184}
## 発展 {#pc636e11}

まぁこんな感じでやっていきます

- ifやらfor，whileなんかはCと変わらないので省略．
  - と思ったけど「Cの項目にねーよタコ」って言われｔ(ry
- Java(というかオブジェクト指向)の基本はクラスを作成し，そのインスタンスを作ってメソッドを実行という流れです．
- javaでは入出力はストリーム(流れ)として扱います．
  - それがキーボードからの入力でもファイルでも，TCPだって全部ストリームです．
  - たとえば上記のBufferedReaderでreadLineメソッドを利用していますが，初期化の際に与えるストリームをファイルに変えれば，同じreadLineメソッドでファイルの1行が取得できます．


## リンク {#q03f1191}
### まずは本家 {#kcf70aa2}

- [JDK ダウンロードページ](http://java.sun.com/javase/ja/6/download.html)J2SDKがいるならここから
- [Java APIドキュメント](http://java.sun.com/javase/ja/6/docs/ja/api/)Java開発元のSunのAPIリファレンス


### Eclipse {#o72e1476}

- [Eclipse](http://www.eclipse.org/)公式英語です．
  - [Eclipse Wiki](http://www.eclipsewiki.net/eclipse/)日本のEclipseユーザのWiki．設定など，いろいろな情報．
- [Eclipse 3.4からはじめるIDE入門：CodeZine（コードジン）](http://codezine.jp/article/corner/249)
- [Eclipse － ＠IT](http://www.atmarkit.co.jp/channel/eclipse/eclipse.html)
  - [Eclipse 3.4で超簡単Javaプログラミング基礎入門 (1/5) - ＠IT](http://www.atmarkit.co.jp/fjava/rensai4/java5eclipse01/java5eclipse01_1.html)
- [Eclipse V3.4 をマスターする - IBM developerWorks Japan : Open source](http://www.ibm.com/developerworks/jp/views/opensource/libraryview.jsp?search_by=Eclipse%20V3.4%20%e3%82%92%e3%83%9e%e3%82%b9%e3%82%bf%e3%83%bc%e3%81%99%e3%82%8b&S_TACT=105AGX90&S_CMP=EDU)


### 参考サイト {#x79a0c19}

- [Java(tm) House Mailing List Homepage (in Japanese)](http://java-house.jp/ml/)
  - [Java House ML Topics](http://java-house.jp/ml/topics/) - 基礎知識、Java学習法 ほか


- [JavaでHello World(Internet Archive)](http://web.archive.org/web/20100701024337/http://www.hellohiro.com/)Javaのいろいろな機能でHelloWorldしているサイト．
- [浅煎り珈琲 Java アプリケーション入門](http://music.geocities.jp/kreisler_liebesleid/java/)Javaを系統的に勉強できるサイト
- [JNode](http://www.jnode.org/)Java（とアセンブラ）でOSを作ろうというオープンソースプロジェクト
