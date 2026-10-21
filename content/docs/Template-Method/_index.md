---
title: "Template Method"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "Template-Method"
draft: false
---

[デザインパターン](/docs/デザインパターン)

# Template Method {#vad6c5e6}

これはデザインパターンというより、普通のテクニックという感じです。
理論とか無視してざっくばらんに言ってしまえば「だぶってるところを共通化しようぜ！」というものです。

論よりコード！Webアプリを想定してます！

```
<?php
abstrat class Page{
    public function putHtml(){//HTML出力する
         $this->putHeader();
        $this->putBody();
        $this->putFooter();
    }
    private function putHeader(){
        //CSSの読み込みとか、metaタグとかのヘッダー出力
    }
    protected function putFooter(){
        //作った人のメアドとかフッター    
    }
    abstract protected function putBody();//ページによって異なる
}

class TopPage extends Page{
    protected function putBody(){
        //トップページの内容が出力されるのだろう！
    }
}
class ProfilePage extends Page{
    protected function putBody(){
       //プロフィールが出力されたりするんでしょう！ 
    }
}
?>
```


コード見た上で言えば、「共通してる部分を抜きだして抽象クラスに実装しろ」ということになります。
理論的に言えば、処理の雛形(言いかえると、処理の手順を定めたもの)を作って、処理の詳細(putBody()とかですね)を派生クラスで実装しろというものです。Templateの日本語訳は雛形！

## いつ使うのか {#z3cfcc97}
関数での共通化をしっかりやったプログラマーさんならいつの間にか適用しているようなデザインパターンです。適用のタイミングもだいたい同じです。
ただ、むやみに「共通化するぜ！！！」とやりまくると後々悲惨なことになるので、クラスたちの性質を考えて抽象クラスは作る必要があります。これはどっちかっていうとOOPの継承における問題の話題なのでそちらに。。
