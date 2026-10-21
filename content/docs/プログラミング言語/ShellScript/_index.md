---
title: "ShellScript"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "ShellScript"
draft: false
---

# ShellScript {#e5a70b7d}


# はじめに {#scf4520c}
シェルスクリプトは、シェルで実行するプログラムを指します。
シェルは主にUnixで使われる対話型インタプリタです。
シェルスクリプトはテキストファイルに書いたコマンドなどのリストであり、シェルがそれらコマンドを解析し、実行します。

Windowsで動作するシェルは、[cygwin](http://www.cygwin.com/)からダウンロードできます。
UnixやLinuxでは通常OSと一緒にインストールされます。

シェルスクリプトは、一般的にbourne shell(Bシェル)向けにかかれたスクリプトを指しますが、bourne shell以外に、bash(最近のLinuxはbourne shellの代わりにbashを使っている）、csh、ksh、zshと言ったインタプリタがあります。いくつかの拡張を除き、csh以外はほぼ同じ構文でプログラムを書くことができます。

# シェルスクリプトのスペースと改行 {#qcc448c6}
シェルスクリプトはスペースと改行がとても重要である。中途半端なところで改行はできないし、スペースが絶対必要な場合もある。<br />
たとえば以下のプログラムの場合、[のあとにスペースは絶対必要である。

```
if [ -n file ];then
  echo "exist"
fi
```

これは[自体がコマンドだと考えればスペースが必要な理由がわかりやすいだろう。

# とりあえず動かす {#v4a46338}
## <strong>shでHelloWorld!</strong> {#k0b4af5d}
まず、テキストファイルで以下のように記述し、適当なファイル名を付けて保存します（拡張子 .sh で終わる名前を付けるのが一般的ですが、決まりではありません）


```
#!/bin/sh 
echo "HelloWorld!"
```


次に、UnixやLinuxの場合はターミナルやコンソールから、Windowsの場合はコマンドプロンプトから

```
sh hello.sh
```

のように実行します。
また、1行目の記述はUnixやLinux環境で直接ファイルを実行するための特別な記述です。
これによって、UnixやLinuxでは、

```
./hello.sh
```

のように実行することができます（ただしファイルに実行権が必要）。

## <strong>関数を使ってHelloWorld!</strong> {#r3022675}
今度は関数を使って先ほどと同様のプログラムを書いてみます。
関数の定義は、

```
FUNC_NAME() {
 関数の中身
}
```

です。関数の呼び出しかたは、普通に

```
FUNC_NAME [ARGS....]
```

で呼び出せます。
関数に引数がある場合は、$1, $2 ,,, $9でそれぞれ1から9番目の引数の値を参照できます。


```
#!/bin/sh

# 関数の定義
Hello()
{
   echo "$1"
}

# 関数の呼び出し(関数名+引数)
Hello HelloWorld!

```

## シェル変数を使ったHelloWorld {#c41f1114}
変数に値を代入するには、

```
NAME=VALUE
```

のように記述します。このように記述された変数をシェル変数と呼びます。このとき、=の前後にスペースがあってはいけません。以下のようにスペースがある場合はNAMEというコマンドの引数であると解釈されてしまいます。

```
NAME = VALUE #NAMEコマンドに=とVALUEという引数を渡したと解釈される
```


また、変数に代入した値を参照する場合は、

```
${NAME}
```

もしくは

```
$NAME
```

のように記述します。


```
#!/bin/sh
HELLO="HelloWorld!" 
echo ${HELLO}
```


変数の値として、コマンドや関数の出力を使いたい場合は、` (バッククオート）を使います。


```
#!/bin/sh
#HELLOという変数に、echo "HelloWorld!"を実行したときの出力を代入
HELLO=`echo "HelloWorld!"`
echo ${HELLO}
```


## コマンドライン引数を受け取る {#yc9e700e}
シェルスクリプトも当然他のコマンドのように引数を受け取れます。受け取った引数は、$1から$9という変数に格納されます。


```
例:
#!/bin/sh
# test.sh
echo $1 $2
```


```
実行例:
$ ./test.sh hello world!
hello world!
```


# ループ処理 {#g0e9dd3e}
## For文 {#a28344c3}
シェルスクリプトでForは次のように使えば良い。

```
for list in a b c d
do
  echo ${list}
done
```


これを実行すると以下のようになる


```
$ ./test.sh
a
b
c
d
```


a b c d の部分は、$listに入れるリストでスペースか改行で区切られている必要がある。<br />
つまり以下のような使い方もできる。

```
for file in ./*
do
  file ${file}
done
```


これを実行すると以下のようになる


```
$ ./test.sh
./dir: directory
./hello.txt: UTF-8 Unicode text
./ruby.rb: a /usr/local/bin/ruby script text executable
./test.sh:  POSIX shell script text executable
```


# 参考 {#jbdd0f96}
[Bourne Shell 自習テキスト](http://flex.ee.uec.ac.jp/texi/sh/sh.html)
