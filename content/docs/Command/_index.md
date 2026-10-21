---
title: "Command"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "Command"
draft: false
---

[デザインパターン](/docs/デザインパターン)

# Commandパターン {#cb18be17}

命令に共通のインターフェイスを持たせてクラスに切るパターンですお。

```
<?php
interface Command{
    public function execute();
}
class CommandA implements Command{
    public function execute(){
        //なんか処理がいろいろありますお
    }
}
class CommandB implements Command{
    public function execute(){
        //なんか処理がｒｙ
    }
}
if($condition === COND_A){
    $command = new CommandA();
}elseif($condition === COND_B){
    $command = new CommandB();
}
$command->execute();//CommandA, CommandB, Commandほにゃらら は共通のインターフェイスを持つからexecuteで呼び出せますお！
?>
```


Webアプリで使われてるのだと、フロントコントローラーパターンとの組み合わせじゃないかと思いますお。
フロントコントローラーから呼び出されるControllerがこの場合でのCommandに当たりますお。

２ちゃん風の掲示板を作るなら、
test.php?mode=一つスレ見る&start=l50&thread=1211724956<br />
modeで一つスレ見るControllerのexecuteを呼び出すお。あとはmode=スレ一覧見るなどなどありますおね。


WinProgとかは知らんので追記おながいしますお（　＾ω＾）おっおっおっ
