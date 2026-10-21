---
title: "VIP言語"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "VIP言語"
draft: false
---

[プログラミング言語/VIP言語](/docs/プログラミング言語/VIP言語)

## はじめに {#s9206115}

- 非常に難解だが、習得すればものの数時間で弾道計算ソフトさえ作れてしまう。

上級者にしか手が出ない代物。<br />
だがソース自体が激しく処理系依存である。

- ちなみに簡易言語VIP(Programless Language VIP)およびその移植達とは別物。
- どっかにコンパイラ無いですかね？→Perlで作った。


```
#!/usr/local/bin/perl
use strict;
$_ = sub{local $/; <>;}->();
y/Ww//cd;y/Ww/01/;
binmode(STDOUT); # Windowsでコンパイルするときに必要
print pack'B*',$_;
```

コンパイル方法

```
$perl VIPlc.pl < source.vipl > output.bin
```

実行権限も忘れずに。

```
$chmod u+x output.bin
```

ついでに逆コンパイラ

```
#!/usr/local/bin/perl
use strict;
my $c = 0;
binmode(STDIN);
for(sub{local $/ = \1; <>;}->()){
	$_ = unpack'B*',$_;
	y/01/Ww/;
	print$_,(++$c%4)?" ":$/;
}
```

- 言語仕様はいたって簡単。Wは0、wは１にそれぞれ対応していて、中身自体は機械語です。<br />
  それ以外の文字は無視するみたいです。

## Hello World {#qb7b819a}
Hello, World!プログラムの一覧。

### i386, GNU/Linux {#t972631c}

```
wWwwWWwW WWWWwwWw wWwwwWWw WWWwWWwW WWWWWWWW WWWWWWWW WWWWWWWW
wWwwWWww WWWWWWWw wWwwWWWW WWWWWwWW
wwWWwwWw wWWWWWWW
WWwwWWWw wwWWWWWW WwWWWWWW
wwWWwwWw wWWWWWWW
WwWWwWWW WwwWWwWw WwwWwwWW WwwWwwWW WwwWwwww WWwWwwWW WWwWWWWW
WwWwWwww WwwWwwww WwwwWWwW WwwWwwWW WwwWWwWW WWwWWWWw
```


まず、はじめのwWwwWWwW WWWWwwWwは、Hello, World!の長さの13をdlレジスタに入れています。<br />
そして次のwWwwwWWw WWWwWwWW WWWWWWWW WWWWWWWW WWWWWWWWでHello, World!文字列のアドレスをecxレジスタに入れています。<br />
次に、wWwwWWww WWWWWWWwではSTDOUTである1をblレジスタに、wWwwWWWW WWWWWwWWではwriteのシステムコール番号である4をalレジスタに入れます。

- 本当は32biなのでedx ebx eaxレジスタを使わないといけないのだが、短縮のためdl bl alレジスタを使用してる。←たいてい下位ビットで事足りる


そしてwwWWwwWw wWWWWWWWでシステムコール(ソフトウェア割り込み)を実行してます。<br />
次の、WWwwWWWw wwWWWWWW WwWWWWWWではeaxレジスタをxorしてインクリメントすることで1にしています(wWwwWWWW WWWWWWWwでもおkですね)。これは_exitのシステムコール番号1を入れています。

- この時の引数ebxは上でのSTDOUT(1)のままなので終了ステータスは異常終了になってしまいます。これも短縮のため。


最後にwwWWwwWw wWWWWWWWでシステムコールを実行して終了。
残った部分はHello, World!文字列です。


### i386, FreeBSD {#ie0a0222}

```
wwWWwwWw wWWWWWWW 
WwwWwWWW WWWWwwWw WWWWWWWW WWWWWWWW WWWWWWWW
WwwWwWWW WWwWWwWW WWWWWWWW WWWWWWWW WWWWWWWW
WwwWwWWW WWWWWWWw WWWWWWWW WWWWWWWW WWWWWWWW
wWwwwWWW WWWWWwWW WWWWWWWW WWWWWWWW WWWWWWWW
wwWWwwWw wWWWWWWW 
WwwWwWWW WWWWWWWW WWWWWWWW WWWWWWWW WWWWWWWW
wWwwwWWW WWWWWWWw WWWWWWWW WWWWWWWW WWWWWWWW
wwWWwwWw wWWWWWWW 
WwWWwWWW WwwWWwWw WwwWwwWW WwwWwwWW WwwWwwww WWwWwwWW
WWwWWWWW WwWwWwww WwwWwwww WwwwWWwW WwwWwwWW WwwWWwWW
WWwWWWWw
```


### i8086, MS-DOS {#ifeba50b}

```
wWwwWwWW WWWWwWWw
wWwwwWwW WWWWwwWW WWWWWWWw
wwWWwwWw WWwWWWWw
wWwwwWWW WWWWWWWW WwWWwwWW
wwWWwwWw WWwWWWWw
WwWWwWWW WwwWWwWw WwwWwwWW WwwWwwWW WwwWwwww WWwWwwWW
WWwWWWWW WwwwWwww WwwWwwww WwwwWWwW WwwWwwWW WwwWWwWW
WWwWWWWw
WWwWWwWW
```


### i386, BeOS {#ac59d437}

```
wwWWwwWw WWwWWwWw wwWWWWww WwwWwWWW
WWWWwwWw WWWWWWWW WWWWWWWW WWWWWWWW
WwwWwWWW WWwwWwWW WWWWWWWW WWWWWWWW
WWWWWWWW WwwWwWWW WWWWWWWw WWWWWWWW
WWWWWWWW WWWWWWWW wWwwwWWW WWWWWWww
WWWWWWWW WWWWWWWW WWWWWWWW wwwWwWWW
wwwWWwWW wwwwwwww wwwwwwww wwwwwwww
wWWWWWWw wwWWWwWW WWWWwwWW WWWWWWWW
WWWWWWWW WWWWWWWW WwwWwWWW WWWWWWWW
WWWWWWWW WWWWWWWW WWWWWWWW wWwwwWWW
WWwwwwww WWWWWWWW WWWWWWWW WWWWWWWW
wwwWwWWW wwWWwwww wwwwwwww wwwwwwww
wwwwwwww WWWWWWWW WWWWWWWW WWWWWWWW
WwWWwWWW WwwWWwWw WwwWwwWW WwwWwwWW
WwwWwwww WWwWwwWW WWwWWWWW WwWwWwww
WwwWwwww WwwwWWwW WwwWwwWW WwwWWwWW
WWwWWWWw
```


### elf32-i386 {#b2fb6838}

```
Wwwwwwww WwWWWwWw WwWWwwWW WwWWWwwW
WwWWwWWW WwwWWwWw WwwWwwWW WwwWwwWW
WwwWwwww WWwWwwWW WwWwWwww WwwWwwww
WwwwWWwW WwwWwwWW WwwWWwWW WWwWWWWw
WWWWWWwW WWWWWWWW WWWWWWww WWWWWWWW 
WWWWWWWw WWWWWWWW WWWWWWWW WWWWWWWW
WwWWwwWW wWWWWWWW WWWWWwWW WWWWwWWW 
WWwWwwWW WWWWWWWW WWWWWWWW WWWWWWWW
WWWWWWWW WWWWWWWW WWWWWWWW WWWWWWWW
WWWWWWWW WWWWWWWW WWWWWWWW WWWWWWWW
WWwwWwWW WWWWWWWW WWwWWWWW WWWWWWWW
WWWWWWWw WWWWWWWW WWWWWWWW WWWWWWWW
WWWWWWWW WWWWWWWW WWWWWWWW WWWWWWWW
WWWWWWWW wWWWWWWW WWWWWwWW WWWWwWWW
WWWWWWWW wWWWWWWW WWWWWwWW WWWWwWWW
WwWwwwwW WWWWWWWW WWWWWWWW WWWWWWWW
WwWwwwwW WWWWWWWW WWWWWWWW WWWWWWWW
WWWWWwWw WWWWWWWW WWWWWWWW WWWWWWWW
WWWWWWWW WWWwWWWW WWWWWWWW WWWWWWWW
wWwwWWwW WWWWwwWW wWwwwWWw WWWWWwWW
wWWWWWWW WWWWWwWW WWWWwWWW wWwwWWww
WWWWWWWw wWwwWWWW WWWWWwWW wwWWwwWw
wWWWWWWW WWwwWWWw wwWWWWWW WwWWWWWW
wwWWwwWw wWWWWWWW
```


Wは0、wは１にそれぞれ対応しています。

あとは機械語を勉強してください。

以上でVIP言語の説明は終わりです。本当にお疲れ様でした！これであなたも立派なVIPROGRAMERです！

最後にVIP言語で実装された、VIP言語コンパイラを紹介しておきましょう<br />
http://vipprog.tumblr.com/post/38698900/by-vip-for-vip-i386linux
