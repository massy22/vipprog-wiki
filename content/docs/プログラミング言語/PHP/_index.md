---
title: "PHP"
date: 2026-06-23T04:41:48+09:00
lastmod: 2026-06-23T04:41:48+09:00
slug: "PHP"
draft: false
---

# 言語の特徴 {#fc1818c9}
PHPのナイスな点としては

- MySQL等に代表されるデータベースとの親和性の高さ


等が上げられるような気がします。<br />
[まずは、PHPの実行環境を整えましょう。](/docs/プログラミング言語/PHP/PHPを始めるには) ([ゆとり専用](/docs/プログラミング言語/PHP/PHPを始めるには-ゆとり専用-))

# Javaとオブジェクト指向を用いたPHPの比較 {#s0a3d0e9}

(PHP)

```php
class Hello {
  public static function main($args = array()) {
    printf("( ^ω^) ");
  }
}
Hello::main();
```


(Java)

```java
public class Hello {
  public static void main(String[] args) {
    System.out.print("( ^ω^) ");
  }
}
```


# 参考サイト、書籍 {#y890c8cc}

- 一般
  - [日本PHPユーザーの会](http://www.php.gr.jp/)
  - [PHP公式マニュアル](http://www.php.net/manual/ja/)
- 初心者向け
  - [レッツPHP!](http://php.s3.to/tt/)~PHPのチュウトリアルがあり、またPHPで作られた便利なサービスを提供しています。
  - [phpspot](http://phpspot.net/php/)~PHPエディタ、その他PHPによるwebアプリ等、PHPに関することならなんでもござれなサイトです。
  - [PHPpro](http://www.phppro.jp/)~PHPのコミュニティポータルサイト。
  - [初心者向けPHP教習所まとめ](http://www.geocities.jp/vipphp/)~かつてVIPにあった初心者向けのスレをはっけん。


# ５分で作る超簡単アクセスカウター {#xcf3d923}

```
<?php
// 初期化
$count = 0;
$wr = false;
if (file_exists("c.dat")) {
   $fp = fopen("c.dat", 'r+');
} else {
   $fp = fopen("c.dat", 'w');
}
//
if ($fp != null) {
    flock($fp, LOCK_EX);
    $count = fgets($fp);
    if ($count == '') $count = 0;
    rewind($fp);
    $wr = fwrite($fp, ++$count);
    if ($wr === false) {
        $count = 0;
    }
    flock($fp, LOCK_UN);
    fclose($fp);
}
echo("来訪者数" . $count . "だお");
?>
```


# ５分で作る超簡単掲示板 {#e4297c25}

```
<?php
$db = sqlite_open("log.db");
//最初に１回実行
sqlite_query($db, "create table T(num INTEGER PRIMARY KEY, name   VARCHAR(40), str TEXT)");
if ($_POST['OK'] == 'OK') {
  sqlite_query($db, "insert into T values(
    NULL, '". htmlspecialchars($_POST['name'], ENT_QUOTES)  ."',
    '". nl2br(htmlspecialchars($_POST['str'], ENT_QUOTES)). "');
  ");
}
$f = sqlite_array_query($db, "select * from T");
sqlite_close($db);
?>
<html><head><title>けいじばｎ</title></head><body>
<?php
for ($i = 0; $i < count($f); $i++) { 
?>  
  <?= $f[$i]['num'] ?>:<b><?= $f[$i]['name'] ?>さん </b><br><blockquote><?= $f[$i]['str'] ?></blockquote><hr>
<?php
}
?>
<form method="post" action="./this.php">
名前：<input type="text" name="name"><br>本文:<textarea  name="str"></textarea><br>
<input type="submit" name="OK" value="OK">
</form>
```


# 自作関数でも公開してみないか？ {#tf0dd69d}
説明はこんな感じだと分かりやすい

---

## 動作内容 {#dd288d02}

```
/*
  Test(①[, ②[, ③[, ④]]])
  ①…1番目の引数
  ②…2番目の引数
  ③…3番目の引数
  ④…4番目の引数
  戻…戻り値
*/
```


---

## URLにリンクを貼る {#g02755a0}

```
/*
  str_link(①[, ②[, ③]])
  ①…URLまたはURLを含む文字列
  ②…ターゲット
  ③…タイトル(未入力の場合はURL)
  戻…変換後の文字列
*/
function str_link($url, $target=NULL, $title='\0'){
  if($target){
     $target = " target=\"".$target."\"";
  }
  $url = preg_replace('/(http:\/\/|https|\/\/)[a-zA-Z0-9\.\/_\-]+/', '<a href=":\/\/|https:\/\/)[a-zA-Z0-9\.\/_\-]+/', '<a href="\0"'.$target.'>'.$title.'</a>', $url);"'.$target.'>'.$title.'</a>', $url);
  return $url;
}
```


---


## 重複するファイルを削除する {#yca1bf78}

```php
<?php
/*
    check_dir( ① )
    ①…走査するディレクトリ
    戻…成功すればtrue, 失敗すればnull
*/
```


```
/*
サンプル
```


```
//走査するディレクトリ
define('MY_CHECK_DIR','C:\Documents and Settings\My Documents\My Pictures');
```


```
$dir = scandir(MY_CHECK_DIR);
check_dir($dir);
*/
```


```
function check_dir($dir){
    //最初に見つけたファイルは削除しない
    $denial_items = array();
    foreach($dir as $item){
        //.と..は無視
        if(preg_match('/^(\.|\.\.)$/',$item)){
            continue;
        }
        //ディレクトリだったらそのディレクトリ内も走査
        if(is_dir($item)){
            check_dir(scandir(MY_CHECK_DIR.$item));
        }else{
            //最初のファイルは削除リストに加えない
            if(!in_array(md5_file($item),$denial_items)){
                $denial_items[] = md5_file($item);
            }else{
                $md5_list[getcwd().'\\'.$item] = md5_file($item);
            }
        }
    }
    //削除
    foreach($md5_list as $path => $md5){
        unlink($path);
        print $path.'を削除しました。'.PHP_EOL.'MD5ハッシュ:'.$md5.PHP_EOL;
    }
    
    return true;
}
?>
```
