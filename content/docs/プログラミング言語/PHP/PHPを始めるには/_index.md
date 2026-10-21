---
title: "PHPを始めるには"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "PHPを始めるには"
draft: false
---

ことわりがない限りWindows主体なので注意

<br />
# まずはApacheをインスコ {#ecc996df}

- Apache
  - [Apache 2.0.63](http://www.apache.org/dist/httpd/binaries/win32/apache_2.0.63-win32-x86-no_ssl.msi)


↑これはサーバーになるわけだ 

Mac OS Xの場合は、ApacheとPHP、Perlなどは既にインストールされてるので設定ファイルの編集までGO!(Apacheの起動は環境設定で。PHPはhttpd.confの設定をすれば、稼働します)

## インスコ方法 {#v8e6c613}

1. NEXTで進めていく
1. Network Domainとか出るページがあると上から「<strong>localhost</strong>」「<strong>localhost</strong>」<br />

空白だと鯖起動時にエラー(インストールは可能)みたいなので、<br />
「admin@localhost.localdomain」とでも入力 

1. 下のチェックボックスは上の●をクリック（Run as a service for All Users）
1. CompleteをクリックしてNEXT
1. インスコフォルダを指定してNEXT
1. インスコ開始


## インスコが終了したら {#v71ddd07}
[http://localhost/](http://localhost/)にアクセス汁！！ 


[画像](http://allabout.co.jp/internet/database/closeup/CU20031113/apa9.jpg)<br />
↑このページが見れれば成功だお( ^ω^) 

# 次にPHPをダウソ {#la671bce}

- PHP5.2.2
  - [PHP5.2.2](http://jp.php.net/get/php-5.2.2-Win32.zip/from/this/mirror)


- ↑これをダウンロードして解凍汁
- フォルダ名を「<strong>PHP</strong>」に書き換える
- <strong> C:\ </strong>にPHPフォルダを移動させる


## 設定 {#y5a2746e}

- php5ts.dllのコピー
  - Windows 2000 の場合
    - <strong>php5ts.dll</strong>を<strong>C:\WINNT内</strong>にコピー
  - Windows 98/Me XP Windows Server 2003 の場合
    - <strong>php5ts.dll</strong>を<strong>C:\WINDOWS内</strong>にコピー
- php.ini-distのコピー
  - Windows 2000 の場合
    - <strong>php.ini-dist</strong>を<strong>C:\WINNT</strong>内にコピー
    - コピー後、<strong>php.ini-dist</strong>を<strong>php.ini</strong>と名前変更
  - Windows 98/Me XP Windows Server 2003 の場合
    - <strong>php.ini-dist</strong>を<strong>C:\WINDOWS内</strong>にコピー
    - コピー後、<strong>php.ini-dist</strong>を<strong>php.ini</strong>と名前変更


## php.iniの修正 {#w4853564}

- 先ほどコピーしたphp.iniを開いてください
- extension_dirを指定


```
extension_dir =
```

これを

```
extension_dir = "''c:/PHP/ext''"
```

にする

- 使用するDLLを指定


```
;extension=php_bz2.dll
;extension=php_cpdf.dll
;extension=php_curl.dll
;extension=php_dba.dll
```

と、なっているのを全て<strong>先頭のセミコロン「;」をはずそうか</strong>

```
extension=php_bz2.dll
extension=php_cpdf.dll
extension=php_curl.dll
extension=php_dba.dll
```


## httpd.confの修正 {#rcc721f8}

- <strong>C:\Program Files\Apache Group\Apache2\conf</strong>にある<strong>httpd.conf</strong>を開く


一番上に下記のように記述汁


```
# PHP 5 の場合
LoadModule php5_module "C:/PHP/php5apache2.dll"

# php.ini の場所を設定
PHPIniDir "C:/WINDOWS"

ScriptAlias /php/ "c:/php/"
AddType application/x-httpd-php .php

# PHP 5 の場合
Action application/x-httpd-php "/php/php.exe"
```

自分がPHPを置く場所を指定する

```
#
# DocumentRoot: The directory out of which you will serve your
# documents. By default, all requests are taken from this directory, but
# symbolic links and aliases may be used to point to other locations.
#
DocumentRoot "【自分がPHPを置く場所への絶対パス】"
```

俺の場合

```
#
# DocumentRoot: The directory out of which you will serve your
# documents. By default, all requests are taken from this directory, but
# symbolic links and aliases may be used to point to other locations.
#
DocumentRoot "D:/web/php"
```

と記述すると、D:/web/phpに置いた.phpファイルが実行できる
下にいくと

```
#
# This should be changed to whatever you set DocumentRoot to.
#
<Directory "D:/web/php">
```

とあるので、これも設定しておこう


Mac OS Xの場合は、環境設定パネル->共有のWeb共有をチェックすればApacheが起動します。
10.4まではApache 1.2が、10.5からはApache 2がインスコされてます。
LoadModule php5_moduleとAddType application/x-httpd-php .phpにの頭に付いてる#をはずせばおk。

## Apacheの再起動 {#g70558e9}

- <strong>スタート</strong>→<strong>プログラム</strong>→<strong>Apache→Control Apache Server</strong>→<strong>Restart</strong>
- Apacheが<strong>再起動</strong>される
- ※再起動してエラーが出たらhttpd.confの設定ミスです＞＜；


Mac OS Xなどでは、再起動はターミナルなどコマンドラインで sudo apachectl -restart（管理者パスワード必須）。Mac OS Xでの再起動は設定パネルでも可能(共有のOn/Offを切り替えれば再起動します)。

Syntax Errorとか出たらhttpd.confの設定ミスです＞＜；


# PHPを動かそう {#kbd88b92}
PHPが動くか確認♪<br />
先ほど<strong>DocumentRoot</strong>で指定したフォルダを覚えておいてください。<br />
俺の場合は

```
DocumentRoot "D:/web/php"
```

と設定しているので、

```
D:/web/php
```

へ移動します。

次に、メモ帳で下記のように入力してください。<br />


```
<?php
phpinfo();
?>
```


そして、「<strong>info.php</strong>」と名前をつけて、<strong>指定したフォルダ</strong>に保存してください。<br />
保存できましたか？では、それを見てみます。

[http://localhost/info.php](http://localhost/info.php)←へアクセスしてください。<br />
[画像](http://allabout.co.jp/internet/database/closeup/CU20040928A/ok1.jpg)<br />
↑こんな画面が出てきたかな、かな？<br />
出てきたらPHPの環境構築は終了です＞＜；

上の場合は、「D:\web\php」が「http://localhost/」になると考えてください。

# PHPができる環境が整ったので、初歩的なことだけ・・・。 {#y1447b20}
とりあえず文字を出力


```
<?php
echo "Hello Vipper!";
?>
```


とメモ帳で書いて、「hello.php」と保存してください。
これが文字出力の基本的な文になります＞＜；
