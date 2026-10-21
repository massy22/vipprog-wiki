---
title: "Observer"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "Observer"
draft: false
---

[デザインパターン](/docs/デザインパターン)

オブザーバパターン。變更通知。登録と監視の二つが必要になる。


```
<?php
class Object{ # ルートクラス
 function observeValueForKey($key,$object,$change){} # これは上書きされる。
 function addObserver($key,$observer){
  # オブザーバ登録。key はセッタで變更する際に使ふ物を指定すると樂。
  # ここではハッシュ的に管理することにする。
  $this->obsever[$key] = $observer;
  }
 function removeObserver($key,$observer){
  # オブザーバ解除。$observerを渡して居るのは同じオブジェクトか調べるため。
  # 生成時に通し番號を附けてやるとかすれば、同一性の確認が PHP でもできるだらう。
  # ここでは簡單に除去するだけの實裝
  unset($this->obsever[$key]);
  }
 function setValueForKey($value,$key){
 
 # ここらへんにセッターを實裝する。
 # 單純には次のやうにセッタを呼ぶけれど、確りとエラー處理をせねばならない。
 # また必要なら <key> を set<Key> にするなどの工夫が必要。
 # かういつた規約は自分で決めること。他の API やライブラリでの實裝を眞似などしてもよい。
 $key = "set".$key;
 $this->$key($value);
 
 # セットした前後でオブザーバに通知する。
 # 三番目の引數は元のインスタンス變數の値を格納したりして渡すと便利。
 # 取得方法は自分で考へて欲しい。
 # オブザーバがあるか無いかなど調べる實裝も必要。
 $this->obsever[$key]->observeValueForKey(key,$this,array($value))
 }
function valueForKey($key){
 # セッタに同じ。これはゲッタ。
 $key = "get".$key;
 return $this->$key
 }
}

# このクラスを繼承すれば、オブザーバとセッタの恩惠をうけられる。
class Observer extends Object{
 function observeValueForKey($key,$object,$change){
  # このメソッドは上書きする。もし、通知された内容に問題があればその處理をここでする。
  echo $key . "の變更を受信";
  }
 }
class Subject extends Subject{
 function setABC($value){
  #適當にインスタンス變數にぶちこめ。
  }
 }
?>
```


これを次のやうに遣へばよい。

```
$sub = new Subject;
$obs = new Observer;
$sub->addObserver("ABC",$obs);
$sub->setValueForKey("test1","ABC");
$sub->removeObserver("ABC",$obs);
$sub->setValueForKey("test1","ABC");
```


何らかの監視對稱が「$sub」である。監視するのはこの實裝自體であり、どこかで通知方法を實裝せねばならない。そこで共通のセッタを實裝して値の變更を常にこれを通じて行へば、監視することができる。

何らかの通知對稱は「$obs」である。通知された内容の適性を判斷する。これは、Subject クラスに關して公開するけれども、Observer クラスの仔細その實裝や判斷基準は伏せておきたい時などに有效で、何となく隱蔽の匂ひがしませんか？　さうである。イベント管理で有效なのだ。

この實裝は Cocoa NSObect の KVO と KVC のものから一例として取った。ルートクラスではなくて、機能を分散させる遣り方もある。その場合、「observeValueForKey」にあたる通知メソッド以外は Subject クラスの役目になる。それは、處理の流れを追へばわかるはづである。
