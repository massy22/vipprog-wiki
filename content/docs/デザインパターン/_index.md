---
title: "デザインパターン"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "デザインパターン"
draft: false
---

# デザインパターン {#sc8f0f4a}
## デザインパターンとは {#n9f1c4a3}
オブジェクト同士の協調の例をまとめたものです。設計原則とサンプルコード(実装例)の中間に居るような感じです。
あくまでも「パターン」に過ぎないものです。これに当てはめれば問題が解決できるとか、そういうものではありません。そこを履き違えないように上手に使いましょう。
GoFとは、四人の野郎共(Gang of Four)と言う偉い人達が纏めたOOPの良い設計です。
実装レベルに近いので覚え易いのですが、その反面適切な使い方が分からず濫用してしまいがちなので注意しましょう。

熟れれば自然と、てのが多いかと。

# パターン {#u216ca41}

いろいろありますが、大まかに分けて

- 生成 (オブジェクトを作る、Factoryパターンなど)
- 構造 (繋いだり組み立てたりする、Adapterパターンなど)
- 振る舞い (キモとなるクラスがなんかする、Commandパターンなど)


(これは一概には言えませんが)生成に関するパターンはプログラムの最初の方で実行、構造は裏方、振る舞いがクライアントに対してインターフェイスを提供するなど、ある程度活躍の場が決まっています。


## 生成に関するパターン {#ea1c9d5b}

- [Abstract Factory](/docs/Abstract-Factory) - 抽象行程（具象を司る者）
- Builder  - 築造行程（築き上げし者）
- [Factory](/docs/Factory)  - 一般行程（具象せし者）
- [Prototype](/docs/Prototype)  - 原基行程（蹟意を寫せし者）
- [Singleton](/docs/Singleton)  - 單機行程（各個起せし者）

## 構造に関するパターン {#qa490316}

- Adapter - 調節構造（適合せし者）
- Bridge - 克服構造（梁を亙す者）
- Composite - 複葉構造（共に穿つ者）
- Decorator - 修飾構造（飾り着けし者）
- Facade - 屹然構造（屹ちし者；建築物の正面、前面。これはフランス語で正しくは façade と綴りセディーユを有す）
- Flyweight - 輕量構造（跳びあがる者；ライト級）
- Proxy - 代理構造（近づき易き者）

## 振舞に関するパターン {#gec14977}

- Chain of Responsibility - 縮合行動（強か足枷を着けし者）
- [Command](/docs/Command) - 委讓行動（全きを委ねし者）
- Interpreter - 自律行動（取り次ぐ者；インタープリタ）
- Iterator - 反復行動（飽くほどに繰り返す者）
- Mediator - 調律行動（中央に在て媒介する者）
- Memento - 典禮行動（憶える者；これはラテン語で憶える、轉じて記念。memento mori など、カソリツク用語）
- [Observer](/docs/Observer) - 監視行動（注視せる者）
- State - 宣誓行動（そこにあつて名乗る者；状態）
- Strategy - 眺望行動（指麾を執る者）
- [Template Method](/docs/Template-Method) - 定式行動（遵ひ追隨する者）
- Visitor - 訪問行動（眺めきたりし者）


## 参考リンク {#vad55784}

- [結城浩 - The Essence of Programming &gt; 「デザインパターン」関連ページ](http://www.hyuki.com/catlink/83668355834383938370835E815B8393.html)
  - [デザインパターンFAQ](http://www.hyuki.com/dp/dpfaq.html)
  - [デザインパターン・メーリングリスト &gt; リンク](http://www.hyuki.com/dp/dpml.html#link)
  - [ギコ猫とデザインパターン](http://www.hyuki.com/dp/cat_index.html)
  - [デザインパターン紹介 ―GoF以外のパターンを紹介します―](http://www.hyuki.com/dp/dpinfo.html)
- [Programing Place &gt; デザインパターン編](http://www.geocities.jp/ky_webid/design_pattern/index.html)
- [サルでもわかる 逆引きデザインパターン](http://www.nulab.co.jp/designPatterns/designPatterns1/designPatterns1-1.html) - 株式会社 ヌーラボ のサイト - 『アジャイル開発のヌーラボ』 内コンテンツ。
- [Strategic Choice](http://d.hatena.ne.jp/asakichy/) - 個人ブログ。ブログ内コンテンツにカタログ的なデザインパターンの解説あり。
  - [[デザインパターン] - Strategic Choice](http://d.hatena.ne.jp/asakichy/searchdiary?word=%2a%5b%a5%c7%a5%b6%a5%a4%a5%f3%a5%d1%a5%bf%a1%bc%a5%f3%5d)
  - [GoFのデザインパターン - Strategic Choice](http://d.hatena.ne.jp/asakichy/20090227/1235739976)
  - [Grandのデザインパターン - Strategic Choice](http://d.hatena.ne.jp/asakichy/20090401/1238559855)
  - [POSAのデザインパターン - Strategic Choice](http://d.hatena.ne.jp/asakichy/20090623/1245715313)
  - [PLoPの汎用設計パターン - Strategic Choice](http://d.hatena.ne.jp/asakichy/20090507/1241663082)
- -
