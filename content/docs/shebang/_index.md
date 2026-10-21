---
title: "shebang"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "shebang"
draft: false
---

# shebang(しばん) {#w0dc1768}

Unix系OSでスクリプトの１行目に書くヤツ。


```
#!/usr/local/bin/perl
```


<strong>#!</strong>から始まる行のことを<strong>shebang line</strong>という。
<strong>#!</strong>以降のパスでプログラムを実行、オプションも指定できる。そのスクリプトを実行したときの実行時引数を実行時引数に加える。
たとえば

```
#!/usr/bin/aaa -op1
```

とかいたスクリプトをbbbとし、

```
$ ./bbb -op2
```

と実行すると、実際には

```
$ /usr/bin/aaa -op1 ./bbb -op2
```

と実行されたことになる。

そのため多くのスクリプト言語では<strong>#</strong>以降をコメントアウトとする(shebang lineを無視するため)。

Unix系OSの場合。実行許可されたファイルを実行した場合、elfその他の実行形式の場合、そのbinfmtで実行する。
<strong>shebang line</strong>を見つけた場合。上記のような振る舞いをする(binfmt_script等々)。
Windows環境においてはただのおまじないになってしまう。(cygwinで変わる？詳しい人よろ)

## 例 {#xbf94cde}

```
#!/usr/local/bin/perl
```


```
#!/usr/bin/perl
```


環境によって異なるため、envがある環境では以下のようにもできる。

```
#!/usr/bin/env perl
```


最近のOSはパッケージ管理が付いているので、多くの場合スクリプト言語のプログラム(ruby, perl, python)は<strong>/usr/bin</strong>にある。
手動インストールした場合は、<strong>configure</strong>で指定しなかった場合<strong>/usr/local/bin</strong>になることが多い。

sh, sedなどは<strong>/bin</strong>にあることがおおい。

```
#!/bin/sh
```


```
#!/bin/sed
```


プログラムのパスが分からないときは、<strong>which</strong>コマンドを使うとよい。

```
$ which perl
/usr/bin/perl
```


## 変態的な例 {#if7cfec1}
### befunge {#m7a8d61e}

```
#!/var/bin/befunge
```


befungeでは<strong>#</strong>に意味がある(次の文字を読み飛ばす)のでそれ以降を無視できないため
この様にする。<strong>/</strong>で割り算、<strong>v</strong>で読み込みの方向が下に向く。

### Quine {#yaa58a90}
以下のプログラムは自分自身のコードを出力するquineとなる

```
#!/bin/cat
```
