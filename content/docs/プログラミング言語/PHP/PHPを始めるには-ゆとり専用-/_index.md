---
title: "PHPを始めるには(ゆとり専用)"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "PHPを始めるには-ゆとり専用-"
draft: false
---

[プログラミング言語/PHP](/docs/プログラミング言語/PHP)

# 簡単にPHP開発環境を、いれるん（windows限定） {#ib96804a}

# XAMPP {#f389a7ab}
すごいお手軽。インストーラーをダウンロードして実行して放置するだけ。
[apache friends](http://www.apachefriends.org/jp/xampp-windows.html)からXAMPPインストーラ版をダウンロード。
んでダウンロード完了したらそれを実行。インストールする場所とかいろいろ聞かれるけどデフォのまま進めばおｋ。

## Hello, world!を動かそう {#f99a34e9}
まず、

```
<?php
print 'Hello, world!';
?>
```

という内容のファイルを作りhello.phpとかいう名前で保存する(名前はなんでもいいよ)。
んで、そのファイルを(もしインストールしたフォルダを変更してれば適宜読みかえて)C:\xampp\htdocs\に置く。
次にApacheを動かす。<em>XAMPP Control Panel</em>というショートカットがデスクトップにできてると思うのでダブクリ。起動したらApacheの部分に「起動」というボタンがあるのでクリック。
あとはブラウザを開いてhttp://localhost/hello.phpにアクセスすれば、

```
Hello, world!
```

と表示されるはず。
ちなみにhtdocs以下のフォルダ構成がそのままURLと対応してるのでC:\htdocs\hoge\hello.phpという感じにすればhttp://localhost/hoge/hello.phpとなる。

環境はこれだけでおｋ。

# T.N.L HTTP Serverをダウンロード {#m6d58a72}
[T.N.L HTTP Server　ver0.05](http://www.vector.co.jp/soft/win95/net/se345012.html)をダウンロードする。

## インスコ方法 {#y6d92095}

- 圧縮(.zip)ファイルを解凍する、おわり。（アンインスコは、そのままフォルダー削除でおｋ）


## インスコが終了したら {#p98d81b6}

- 解凍したtnlhs005フォルダーからsampleそしてserverフォルダーへ行き、HTTPServer.exeを実行
- するとブラウザー起動して、[<em>http://localhost/</em>](http://localhost/)に勝手にアクセスしてくれる。
- T.N.L HTTP Server Sampleというページが見れれば…

ちょｗｗｗｗｗｗ成功ｗｗｗｗｗｗｗ

- ついでに、PHPが使えるか確認。このままphpinfo.phpを、クリックして何か表が出てたらおｋ。


---

## PHPを動かしてみる {#gfb5b801}

### とりあえず文字を出力 {#led91cc5}

```
<?php
echo "Hello Vipper!";
?>
```

とメモ帳で書いて、「hello.php」と保存
tnlhs005→sample→htmlフォルダー内に、さっきの「hello.php」を保存する。

そして、
[<em>http://localhost/hello.php</em>](http://localhost/hello.php)
にアクセスすると文字でるでるｗｗｗｗｗｗ

今後できたPHPスクリプトは、htmlフォルダーにいれて実行する。

これでおわり、ゆとりでも簡単ｗｗｗｗｗｗｗｗｗｗ
## マルチバイト関数とかを追加（付録1） {#sf91c0e0}

- マルチバイト関数が入ってないから、php4本体をダウンロードして解凍
  - [php-4.3.10-Win32.zip](http://museum.php.net/win32/php-4.3.10-Win32.zip)

解凍したフォルダーの中に、extensionsというフォルダーがある。

それを、tnlhs005→sample→phpフォルダー内にコピーする。

これでおｋ、使えるようになた。

のこりはいらないので、ゴミ箱へ直行。（4.3.10しか使えないのが難点だな）
