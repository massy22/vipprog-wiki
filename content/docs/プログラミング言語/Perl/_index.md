---
title: "Perl"
date: 2026-07-26T12:25:49+09:00
lastmod: 2026-07-26T12:25:49+09:00
slug: "Perl"
draft: false
---

<br />

- とりあえず作ってみた今は反省している
- せっかくだからHelloWorldだけ出す
- Wikiの記法をよく知らない。気付いたら誰か見栄えを直してくれ


# 言語の特徴 {#q2d7f017}

- インタプリタ型言語です。
- 世の中のCGIを記述する上で現在最も幅広く使われていることでしょう。（このWikiはPHPで書かれていますが）
- いろいろやる上で基本的にお金はかかりません。
- 既に他の言語を使用したことがある人向け
  - 心底「型」に関しておおらかな言語
  - 変数は$変数名,配列は@配列名,配列要素は$配列名[添字],連想配列は%連想配列名,$連想配列名{添名}で呼び出し
  - C言語のポインタに相当するものもあるが通常はリファレンスを使用
  - 配列の添字は0から （特殊変数 $[ で変更可能）
  - サンプルがいろいろ出ているが、Perlの真髄は文字列操作


# 開発環境 {#dev-env}
## Windows {#windows}
### Perlのインスコ {#install}
[ActiveState](http://aspn.activestate.com/ASPN/)から[ActivePerl](http://aspn.activestate.com/ASPN/Downloads/ActivePerl/)が無償配布されています。これを使うといいでしょう。インストール先（perl.exeがおいてあるところ/デフォルトはc:\usr\bin\？）を環境変数PATHに追加しておきましょう。パスが通ったことを確認するには

```
perl -v
```

としてThis is perl,...と表示されればOKです。
### ソースの編集方法 {#wa7eff01}
メモ帳でもいいです。テキストが編集できるものなら何でもいいですが、文字コード・改行コードが指定できるものの方が何かと役に立つかもしれません。今のところ定番のIDEってのはないようで、みんな思い思いのものを使っていることが多いです。[ActiveState](http://www.activestate.com/)はVisual Perlってのを開発してたらしいんだけど…[開発は打ち切られたらしい](http://www.activestate.com/Products/Visual_Perl/)
""Engineering support for Visual Perl was discontinued as of December 15, 2005. Installation and configuration support is no longer available.
とある。
""訳:Visual Perlの設計サポートは2005年12月15日をもって打ち切られました。インストールと環境設定のサポートはもう利用できません。
他にも[窓の杜](https://forest.watch.impress.co.jp/)や[Vector](https://www.vector.co.jp/)でフリーのものはたくさんあるので探してみてください。

### モジュールとCPAN {#module-cpan}
[CPAN(Comprehensive Perl Archive Network)](https://www.cpan.org/)には、使えるモジュールがたくさんあるので、まずは探すべし！　たいていのことはモジュールの組み合わせでできるはずです。標準でインストールされるモジュールも活用！
真面目に書くときはuse strictしておけ！


# VIP的Perl用語解説 {#a05c35f1}

<dl>
  <dt>ワンライナー</dt>
  <dd>プログラムをソースファイルにかかずコマンドライン上に直接一行で書くこと。通常より複雑な技術を必要とするため、プログラムがわからなくても「それはワンライナーいけるな」と言えばその筋の人から尊敬のまなざしでみられる。プログラム書けなくてもとりあえず言えおwww</dd>
  <dt>シュワルツ変換</dt>
  <dd>並び替えを効率よくやるための記法。まず相手をたたみこむために使う。「シュワルツ変換つかえよwww」と言えばいい。その筋の人には伝わる。でっ？ていう</dd>
  <dt>ラクダ本</dt>
  <dd>オライリー・ジャパンから出版されているLarry Wall著の本。表紙がラクダの絵だからラクダ本。Vipperに限らずPerlerは知ってる人が多い。</dd>
</dl>


# プログラム例 {#prog_ex}
[初心者用課題](/docs/初心者用課題)に載っているものです。
## Hello World {#c40e0028}

```
#!perl
print "Hello World!";
```

(注意:#!行は環境依存)
をhello.plとして保存し、

```
perl hello.pl
```

として実行すると

```
Hello World!
```

と表示される。
### 解説 {#k39593d5}

```
1: #!perl
```

perl.exeというperlインタプリタを呼び出すコマンド。お約束。Perlのインストール環境によって異なる。<br />

- 注意

この行は、PerlがWeb上のCGIとして使われることが多く、その場合に必須なので書いてあります。コマンドライン上で<strong>perl hello.pl</strong>のように実行する場合にはなくても構いません。（あってもOK）<br />
詳しくは[shebang](/docs/shebang)の項目を参照せよ。


```
2: print "Hello World!";
```

"Hello World!"という文字列を出力するための行。printと最初の"の間にはスペースを入れることが多い。行末に;（セミコロン）を忘れずに。Rubyと違って（ブロック末を除き）省略できない。

## &#70;izzBuzz {#fizzbuzz}

```
print+(Fizz)[$_%3].(Buzz)[$_%5]||$_,$/for 1..100
```


・上のコードについて

  - for(1..100)とforeach(1..100)は等価。
  - Perlでは単項の+演算子は何もしないものとして定義されている。（これがないと「(Fizz)」の最初のカッコが「print('Hello')」みたいなprintとその引数の間のカッコと認識される）
  - FizzやBuzzなどのbareword(裸のワード)(クォートされてないワード)はデフォルトでクォートされたものとして扱われる。[[perlglossaryのbareword参照]](http://perldoc.jp/docs/perl/5.10.0/perlglossary.pod) # print STDOUT Hello とかやってみてね。
  - リストスライスと上記のbarewordの振る舞いにより(Fizz)[0]は文字列"Fizz"、(Fizz)[1]以降はundef値となる(Buzzも同様に)。
  - Perlでは空文字は偽なので、(Fizz)[$_%3]と(Buzz)[$_%5]が共にundefならば短絡評価により$_が評価される。
  - $/は入力レコードの区切り文字で通常は改行文字である。つまり"\n"。
  - 初期化してない値を使っているので警告(-wオプションやuse warnings)をオンにしていると警告が出る。<br />
  - また、use strictの下ではbarewordは不正となるのでエラーが出る。


これらを踏まえてもう一度コードを見てみると、

```
foreach $_ (1..100) {
	my $str = ("Fizz", "", "")[$_ % 3].("Buzz", "", "", "", "")[$_ % 5];
	$str = $_ if($str eq '');
	print($str."\n")
}
```

とほぼ同じ意味になるのが分かるだろう。


## 平方根 {#sqrt}

```
#!/usr/local/bin/perl
use strict;

my $MAX = 30; # 小数点以下30位まで求める。

my $num = <>;
$num -=0;
my $flg = 0;
if($num<0){
	$flg = 1;
	$num *= -1;
}
my $cnt = 0;
1while($cnt++**2<$num);

if(--$cnt**2 == $num){
	print $cnt;
	exit;
}
print --$cnt.".";

$num = $num - $cnt**2;
$cnt *= 2;
while($MAX--){
	$num *=100;
	my $r = 0;
	1while($num>(++$r+$cnt*10)*$r);
	if($num == ($r+$cnt*10)*$r){
		print $r;
		last;
	}
	$num -= (--$r+$cnt*10)*$r;
	$cnt = $cnt*10+$r*2;
	print $r;
}
$flg && print "i";
print$/;
```

虚数、小数にも対応
誰か解説してくれ。

## 素数判定 {#is-prime}

```
#!perl
$n=100;
for($i=2;$i<=sqrt($n);$i++){
    if($n%$i==0){
        print "n is not a prime number.";
        exit;
    }
}
print "n is a prime number.";
```

### 解説 {#r43c3496}

```
2: $n=100;
```

「[変数](/docs/変数)nに100を代入する」という意味です。右の値を左に代入します。100って数字に何かを代入するのは不自然なので逆に書いてはいけません（エラーになります）。変数名の前には$（ダラー）を、代入文の後ろには;（セミコロン）を忘れないように。

```
3: for($i=2;$i<=sqrt($n);$i++){
```

プログラミング初心者の（多分）最初の壁であるループ構文です。$iは2から√n（より小さい最大の自然数）まで1ずつ増えながら{〜}の中身を実行していきます。実行順序はfor(A;B;C){D}に対してABCDBCDBCDBCDBのような感じです。

```
$i++
```

ってのは変数$iの値を1増やすためによく使われます。ここでは$i++と書いても++$iと書いても構いませんが、実際には全く同じではないです。

```
4: if($n%$i==0){
```

$n%$iは「$nを$iで割った余り」を意味しまう（数学の言葉あるいはBASICなら$n mod $i）。「数値が等しいか否か」を判断するには演算子==を使います（文字列にはeqを使ってください。また、数値には<=>、文字列にはcmpというのも用意されています）。数値の比較を行う際には=は2つ並べなければなりません。。1つだと代入文になってしまいます。()内が[真](/docs/真)なら{}内を実行し、偽なら華麗にスルーします。

```
5: print "n is not a prime number.";
```

割り切れたということは素数じゃないということなのでその旨表示します。

```
6: exit;
```

プログラムそのものを終了する命令です。今回はループを抜けた場合は「割り切れなかった」と判断して「素数だ」と表示するように組んだので、割り切れたら即座に「素数じゃない」と判断して終了するようにします。
### 別解例 {#wc29037a}

```
$n = 101;
for(2 .. int sqrt $n){
    print "$n is not a prime number.\n" and exit unless($n % $_);
}
print "$n is a prime number.\n";
```


調べる数が$nです。2～√nまで特殊変数$_に代入していき、$nが$_で割り切れたら「素数でない」と表示して終了(exit)しています。ループを最後まで抜ければ素数であったのでそう表示しています。

### コマンドラインから引数を取るバージョン {#wc29037b}

```
$n = shift;
for my $i (2 .. sqrt $n){
    print "$n is not a prime number.\n" and exit unless($n % $i);
}
print "$n is a prime number.\n";
```


実行

```
perl test.pl 101
```


1行目のshiftで引数を変数に格納します。他は前の例とだいたい同じです。2行目の$iには、(2 .. sqrt $n)が順番に入ります。2行目のsqrtの前のintは会っても無くてもいいです。ちなみに、もう一回shiftすると、次の引数が入ります。(今回は実行コマンドに引数が一つしかないので、何も入らない。)

## エラトステネスのふるい {#n6fae087}

```
#!perl
$N=100;
@prime = ();
@zahlen = 2 .. $N # ステップ1


do{
    push(@prime,$zahlen[0]);	# ステップ2
    for($j=$#zahlen;$j>=0;$j--){ # ステップ3（for文全体）
        if($zahlen[$j]%$prime[$#prime]==0){
            splice(@zahlen,$j,1);
        }
    }
} while ($zahlen[$#zahlen]>$prime[$#prime]**2);	# ステップ4判定
foreach $k (@prime){	#以下表示部分
    print "$k ";
}
foreach (@zahlen){
    print "$_ ";
}
```

### 解説 {#bc10bfec}
do〜whileを利用した例。[エラトステネスの篩-wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A8%E3%83%A9%E3%83%88%E3%82%B9%E3%83%86%E3%83%8D%E3%82%B9%E3%81%AE%E7%AF%A9)に基づいたコーディング。

```
3: @prime = ();
```

@primeには8行目でいきなりpush（要素の末尾に追加）するから空配列を用意しておきます。
#### ステップ1 {#kbc0dac3}
以下説明では$N=100の場合を使っていくことにします。$zahlen[0]=2,$zahlen[1]=3,...,$zahlen[98]=100がそれぞれ代入されます。
#### ステップ2 {#o611f665}

```
7: do{ 〜 14| } while ($zahlen[$#zahlen]>$prime[$#prime]**2);
```

ループ記法の1つ、do〜while文。while(A){B}はABAB...ABAで終わるのに対し、do{B}while(A);はBABA...BAとなるところがポイント（最初のAの有無）。やりたい処理に応じてループ記法を使いわけてください。

```
8: push(@prime,$zahlen[0]);
```

pushってのは配列の末尾に配列を足すことができる命令です。足す方は今回のようにスカラーでも大丈夫。@prime = (2,3,5),$zahlen[0]=7のときにこれが実行されると@prime = (2,3,5,7),$zahlen[0]=7になります。
#### ステップ3 {#gd4d4b81}
ここでは配列要素を削除していきますが、前からその処理をやると詰めが発生するから添字の扱いが（個人的に）面倒です。ここでは簡単のため@zahlenの後ろから見ていきます。

```
9: for($j=$#zahlen;$j>=0;$j--){
```

$#zahlenは@zahlenの最後の添字（要素数-1）を指しています。ここから0番目の要素（そしてこれは必ず除かれる）までループしていきます。

```
9: for $j(reverse 0 .. $#zahlen){
```

とも書けます。

```
10: if($zahlen[$j]%$prime[$#prime]==0){
```

ステップ2で最後に加えた数は@primeの末尾にいます。$#primeは@primeの最後の添字だったので、末尾の要素は$prime[$#prime]となります。

```
11: splice(@zahlen,$j,1);
```

spliceは配列,削除を始める添字,削除する項数を受け取って削除してくれます。spliceだけでもいくつか書き方があり、これはその一例です（詳細はperldoc -f spliceを見てください）。今回は割り切れた添字$j項目の1個だけを削除するからこのように書きます。
#### ステップ4 {#k11c25bb}
このステップはwhile文ですが、ここまで分かっていれば説明の必要はないと思います。表示の方を説明します。

```
15: foreach $k (@prime){
```

これはPerl独特の記法です。@primeの要素を$prime[0]～$prime[$#prime]まで順に$kに代入してループ内に入ります。大体次と似たように動きます（全く同じではないです）。

```
for($k=0;$k<=$#prime;$k++){
```

後者のコーディングをしたときのブロック内で$prime[$k]にあたるものが、上のコーディングでは$kとして使えるということです。読みやすさを重視するときに便利なループ処理です。前者は必ず配列の全要素についてループしようとするから無限ループに落ちる心配は（自分の意思で行わない限り）ありません。

```
for($k=0;$k<=$#prime;$k++){
for $k (0 .. $#prime){
foreach $k (0 .. $#prime){
```

は同じ動きです。

```
18: foreach (@zahlen){
```

みたいに添字を省略した場合はデフォルトの特殊変数$_にそのループの値が入ります。

```
19: print "$_ ";
```

こんな感じ

### 別解例 {#h3ea0370}

```
$n = 100;
@prime = ();  # 素数リスト
@zahlen = (2 .. $n);  # 探索リスト
do{
    push @prime, $zahlen[0];  # ステップ2
    @zahlen = grep { $_ % $zahlen[0] } @zahlen;  # ステップ3
} while ($zahlen[-1] > $prime[-1]**2);  # ステップ4
print "@prime @zahlen\n";
```


## 閏年判定 {#ybd72cdd}

```
#!perl
$YEAR = 2007;
if(($YEAR%4==0&&$YEAR%100!=0)||$YEAR%400==0){
    print("$YEAR is a leap year.");
}else{
    print("$YEAR is not a leap year.");
}
```

### 解説 {#ib1573ab}

```
3: if(($YEAR%4==0&&$YEAR%100!=0)||$YEAR%400==0){
```

この行が全てです。このプログラムの価値はここだけにあります。条件判断1&&条件判断2は両方成り立てば1,成り立たない方があれば0を返します。条件判断1||条件判断2は少なくとも一方が成り立てば1,さもなくば0を返します。何でこれで大丈夫なのか、[閏年-wikipedia](http://ja.wikipedia.org/wiki/%E9%96%8F%E5%B9%B4)を参照してじっくり考えてみてください。

## 転置行列 {#t0c1442b}

```
#!perl
@a = ( [ 1 , 2 , 3 ],
       [ 4 , 5 , 6 ],
       [ 7 , 8 , 9 ],
       [10 ,11 , 12] );
$m = $#a;
$n = @{$a[0]}-1;
for($i=0;$i<=$m;$i++){
    for($j=0;$j<=$n;$j++){
        $b[$j][$i] = $a[$i][$j];
    }
}
for($j=0;$j<=$n;$j++){
    for($i=0;$i<=$m;$i++){
        print "$b[$j][$i] ";
    }
    print "\n";
}
```

二次元配列を使用した例。
### 別解例 {#t3359f70}
モジュールを使用した例。強度のMじゃなければこっちの別解(モジュール)使え。

```
use Math::Matrix;
$a = new Math::Matrix(
    [  1,  2,  3],
    [  4,  5,  6],
    [  7,  8,  9],
    [ 10, 11, 12] );
$b = $a->transpose;
$b->print;
```


最後の2行は

```
print $a->transpose;
```

ってやってもOKで、$bにオブジェクトをコピーしない分だけ早そうです。

## 線形合同法 {#m2e0c082}

```
#!perl
# X[n+1] = (A*X[n]+B) mod M
$A = 997;
$B = 1;
$M = 2 ** 16;
$n = 100;
$x[0] = 12345; # 配列@xの要素は整数 1つ1つの乱数は$x[$i]/$Mで得られる
$s=0;
for($i=0;$i<$n-1;$i++){
    $x[$i+1] = (($A*$x[$i]+$B) % $M);
}
for($i=0;$i<$n;$i++){
    $s += $x[$i]/$M;
}
for($i=0;$i<$n;$i++){
    printf ("%0.4f ",$x[$i]/$M);
    print "\n" if($i%10==9);
}
print "Average : " . $s/$n;
```

### 解説 {#b3dbe5ff}

```
5: $M = 2 ** 16;
```

ここでは**演算子を使いました。2 ** 16は「2の16乗（2×2×…×2=65536）」の意味です。（POSIXモジュールにpowが用意されています。）

```
9: for($i=0;$i<$n-1;$i++){
```

は

```
9: for $i(0 .. $n-2){
```

とも書ける。C言語とかでガリガリ書いてた人以外は、こっちの方が直感的に判りやすいと思う。

```
13: $s += $x[$i];
```

これはメジャーなプログラミング言語ではよく見られる略記法です。「$sに配列@xの$i番目を加える」操作だから、

```
$s = $s + $x[$i];
```

と書いても同じことです #でもこれ、左右が絶対等しくないからちょっと気持ち悪い式だと書いてる人は思うんだお。前者をおすすめします。

```
16: printf ("%5.d ",$x[$i*10+$j]);
```

ここは表示するだけだから大したところではないけど、一応解説を加えます。printfってのは元々[C言語](/docs/プログラミング言語/C)の言葉です。5桁分のスペースをとって整数を表示して空白を出力します。Perlでもところどころで（もとい、かなりの部分で）C言語の文が使えるから、Cプログラマの人はこっちを使っても大丈夫です（Perlの記法を使った方が見た目はすっきりすることが多いと思います）。この文の詳細はC言語の項に任せるお。

```
17: print "\n" if($i%10==9);
```

見栄えのために10個ごとに改行を入れています。添字は0から始まるから、$i=9,19,29,...99のときに改行します。これらの数字の特徴は1の位が9⇔10で割ったら9余るということです。こんな風にif文を後ろに書く記法もあります。

```
if($i%10==9){
    print "\n";
}
```

と書くのと同じです。

## ニュートン法で平方根を求める {#u623ba20}

```
#!perl

$n = 3; # $nの平方根を求める
$m = 20; # ループ回数
$x0 = 1; # 初期値

@r = ();
$r[0] = $x0;

for($i = 0; $i < $m ; $i ++ ){
    $r[$i+1] = root($r[$i]);
}
print "$r[$m-1]";

sub root{
    my($rn,$rnn);
    $rn = $_[0];
    $rnn = ($rn**2+$n)/(2*$rn);
    return $rnn;
}
exit;
```


### 解説 {#pf1452ae}

```
7: @r = ();
```

これは@rという空の配列を用意するお。8行目で初期値をセットしておきます。

```
10-12: for($i=0;$i<$m;$i++){ $r[$i+1]=root($r[$i]); }
```

ニュートン法を使って計算する部分は後述のrootっていうサブルーチンに○投げしてあります。とりあえず考えなくていいです。ニュートン法は数列（現行教育課程で高2）の隣接2項間漸化式を使う方法です。でも数学できなくても気にしないでください。$i番目が決まったら$i+1番目が決まるってことが分かってれば大丈夫。そんなわけで、その規則をrootサブルーチンに書いてあります。今回は$iが$mに近いほど(最大で$m-1)真の値に近づく仕組み。

```
13: print "$r[$m-1]";
```

これが計算したなかで一番近い値となる。$n=3,$m=20の場合小数点以下13桁完璧でした。

```
15: sub root{
```

[C言語](/docs/プログラミング言語/C)などの「関数」にあたるのがPerlの「サブルーチン」です。多くの場合、何か値を受け取って、それに応じて何らかの値を返却します。受け取ったものは特殊な配列@_に格納されています。返却するときはreturnに引数を取ればいいです。

```
16: my($rn,$rnn);
```

変数のネーミングがちょっと気に入らないけど、ここでは$rnはn番目、$rnnはn+1番目の値を入れることにしました。myってのはその中身がローカル変数(このサブルーチンの中でのみ有効)だということを宣言するものです。

```
17: $rn = $_[0];
```

$_[0]にはn番目の値が引数として渡されているので、それをとりあえず$rnに格納しておきます。

```
18: $rnn = ($rn**2+$n)/(2*$rn);
```

ここがニュートン法の計算式で、なんでこうなるかは数学の範疇です。[ニュートン法-Wikipedia](http://ja.wikipedia.org/wiki/%E3%83%8B%E3%83%A5%E3%83%BC%E3%83%88%E3%83%B3%E6%B3%95)の(1.1)式を理解すればOKです

# 数当てゲーム {#ffb233da}

```
#!/usr/local/bin/perl -W
use strict;
local $/;
print eval <DATA>;
__DATA__
$, = $\ = $/ = "\n";
my $flg = 1;
while($flg){
	my $number = 1000 + int rand 9000;
	while(<>){
		$number==int&&last;
		print$_>$number?'bigger...':'smaller...';
	}
	print 'hit!!','again? y/n';
	while(<>){
		/^y$/i&&last;
		/^n$/i&&$flg--&&last;
	}
}
'good bye';
```

何この邪悪なコード。ふざけてるの？


```
B:
$Ans = int rand 9000;
A:
print"入力=>";$_=<>;
printf"入力は答えより%sです\n",$_>$Ans?"大きい":"小さい";
&more if/$Ans/;goto A;
sub more{
print"正解です=>$Ans\n\nもう一回やる？y/n=>";
$_=<>;goto B if/y/;exit if/n/;
}
```


# 配列いじり {#tweak-arr}

```
print shift @ARGV;
print " ";
print "0 " while shift @ARGV;
```


実行例

```
perl test1.pl 3 5 2 4 2
```

結果例

```
3 0 0 0 0 
```

↑"配列"いじりじゃないうえに、引数に0が含まれるとそこでループを抜けてしまうため、不正解。

```
#!/usr/local/bin/perl
use strict;
$, = ", ";
$\ = $/;
my @aa = (3,6,2,4,2);
print @aa;
splice @aa,1,$#aa,(0)x$#aa;
print @aa;
```


# Base64 {#l20f091e}

```
use MIME::Base64;

$encoded = encode_base64('vipper');
$decoded = decode_base64($encoded);
```


[CPANモジュールそのまんま](http://search.cpan.org/~gaas/MIME-Base64-3.07/Base64.pm)標準で入ってるモジュールと思われるので、追加インストール不要です。

# Caesar暗号解読 {#caesar}

```
use strict;

my $words = "qdq-gi.q-a ziatmxxitmdqibtqi-ustbi ri.qmoqrcxi.qbubu zir -ibtqi-qp-qaai ripmymsqkir -ibtqi-qy dmxi ri.cnxuoi rruoumxakir -ibtqiqzmobyqzbki-q.qmxi -imyqzpyqzbi rixmeaki -puzmzoqai -i-qscxmbu zaimzpir -i btq-iymbbq-a;iz -iatmxximzgi.q-a zinqiuzimzgiemgipuao-uyuzmbqpimsmuzabir -ia. za -uzsiacotimi.qbubu zj"; #問題文を保存
my @answers=();

for (1 .. 30){ #全部で30文字なので30回ループする
  $words =~ tr/abcdefghijklmnopqrstuvwxyz .,-/-abcdefghijklmnopqrstuvwxyz .,/;#1文字ずらす
  push (@answers, $words) if $words =~ m/person/; #personが含まれている場合は答えを保存する。
}
while (@answers){
  print shift @answers;
  print "\n";
}
#答えが1通りであることがわかってる場合は、8行目のpushのところで、printして、exit しちゃえばOK。
```


別解

```
#!/usr/local/bin/perl
use strict;
$\ = $/;
$_ = "qdq-gi.q-a ziatmxxitmdqibtqi-ustbi ri.qmoqrcxi.qbubu zir -ibtqi-qp-qaai ripmymsqkir -ibtqi-qy dmxi ri.cnxuoi rruoumxakir -ibtqiqzmobyqzbki-q.qmxi -imyqzpyqzbi rixmeaki -puzmzoqai -i-qscxmbu zaimzpir -i btq-iymbbq-a;iz -iatmxximzgi.q-a zinqiuzimzgiemgipuao-uyuzmbqpimsmuzabir -ia. za -uzsiacotimi.qbubu zj";
y/abcdefghijklmnopqrstuvwxyz .,\-/bcdefghijklmnopqrstuvwxyz .,\-a/while(!/person/);
print;
```

解が複数あると仮定するなら、

```
#!/usr/local/bin/perl
use strict;
$\ = $/;
my $c = "qdq-gi.q-a ziatmxxitmdqibtqi-ustbi ri.qmoqrcxi.qbubu zir -ibtqi-qp-qaai ripmymsqkir -ibtqi-qy dmxi ri.cnxuoi rruoumxakir -ibtqiqzmobyqzbki-q.qmxi -imyqzpyqzbi rixmeaki -puzmzoqai -i-qscxmbu zaimzpir -i btq-iymbbq-a;iz -iatmxximzgi.q-a zinqiuzimzgiemgipuao-uyuzmbqpimsmuzabir -ia. za -uzsiacotimi.qbubu zj";
($_ = $c) && y/abcdefghijklmnopqrstuvwxyz .,\-/bcdefghijklmnopqrstuvwxyz .,\-a/ && ($c = $_) && /person/ && print for(0..29);
```


# フィボナッチ数列 {#e5eb0915}

[Math:Big](http://search.cpan.org/~tels/Math-Big-1.12/lib/Math/Big.pm)を見ろ。

# 真と偽 {#true-false}
[とほほのperl入門（概要編） - ◆ 真(true)と偽(false)](https://www.tohoho-web.com/perl5/basic.html#true-false)

# スタック {#stack}

```
#!/usr/local/bin/perl -W
use strict;
my %calc = (
	'+' => sub{pop(@{$_[0]})+pop@{$_[0]};},
	'-' => sub{splice(@{$_[0]},$#{$_[0]}-1,1)-pop@{$_[0]};},
	'*' => sub{pop(@{$_[0]})*pop@{$_[0]};},
	'/' => sub{splice(@{$_[0]},$#{$_[0]}-1,1)/pop@{$_[0]};},
);
my @stack = ();
defined$calc{$_}?push@stack,&{$calc{$_}}(\@stack):sub{
	my @x = @_;
	$x[0] =~ y/[0-9\-]//c;
	push@{$x[1]}, int$x[0] if $x[0] eq int$x[0];
}->($_,\@stack)for@ARGV;
print$stack[0];
```


# 参考リンク {#references}

<dl>
  <dt><a href="http://perl-users.jp/">Perl-users.jp - 日本のPerlユーザのためのハブサイト</a></dt>
  <dd></dd>
</dl>

モダンなPerl : 日本のPerlユーザのためのハブサイト


<dl>
  <dt><a href="http://perl-mongers.org/">perl-mongers.org</a></dt>
  <dd></dd>
</dl>

モダンなPerl : OpenIDでログイン出来るPerlユーザblog。Perler な人達が初心者向けの情報や Tips をブログ形式で。


<dl>
  <dt><a href="http://dann.g.hatena.ne.jp/dann/20080703/p2">Perl「言語」初心者がモダンなPerlを高速に学ぶ方法 - dann@webdev - dann's portal</a></dt>
  <dd></dd>
</dl>

plaggerのソースを読もう


<dl>
  <dt><a href="http://d.hatena.ne.jp/perlcodesample/20080229/1204271923">プログラミング言語Perl 詳細リファレンス - Perl入門～サンプルコードによるPerl入門～</a></dt>
  <dd></dd>
</dl>

詳細なリファレンス、サンプルコード付き

<dl>
  <dt><a href="http://d.hatena.ne.jp/perlcodesample/20090624/1246679588">Perlという言語について - Perl入門～サンプルコードによるPerl入門～</a></dt>
  <dd></dd>
</dl>

<strong>Perlのバージョン5以降であればPerlできれいにプログラムを書くことができます。</strong>

<dl>
  <dt><a href="http://d.hatena.ne.jp/perlcodesample/20081217/1229522517">Perlプログラマーの皆さん - Perl入門～サンプルコードによるPerl入門～</a></dt>
  <dd></dd>
</dl>

Perlをやっている人のブログへのリンク
