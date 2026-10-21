---
title: "Factory"
date: 2026-07-22T05:37:40+09:00
lastmod: 2026-07-22T05:37:40+09:00
slug: "Factory"
draft: false
---

[デザインパターン](/docs/デザインパターン)

# Factory {#top}

インスタンス生成を請け負うクラスを作るよ！というパターンです。
工場をまんまイメージすると理解が楽になります。

## いつ使うのか {#xb10c672}

インスタンスの生成を抽象化したいときに使いませう。
こんなコードがでてきたとき or でてきそうなときは適用できると考えてもよいでしょう。

```php
<?php
$obj = new Object();
$obj->setHoge($hoge);//メンバを初期化
$obj->setFoo($foo);//メンバｒｙ
$obj->setBar($bar);//ｒｙ
...
...
...
?>
```

これが

```php
<?php
$factory = new ObjectFactory();
$obj = $factory->create( array( $hoge, $foo, $bar, ... ) );
?>
```

こんなん。
前者だと、工場の生産ラインを直に見てる感じ。後者は工場の中身は見てない。

## メリット {#reb62d07}

インスタンスの生成が抽象化できる。「setHogeしてsetFooしてsetBarして...」から「ObjectFactoryにcreateさせる」という風に人間に分かりやすいコードになる。←これ重要
