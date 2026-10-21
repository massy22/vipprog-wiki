---
title: "Playerクラス"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "Playerクラス"
draft: false
---

[プログラミング言語/Ruby/コードリーディング/しりとりゲーム](/docs/プログラミング言語/Ruby/コードリーディング/しりとりゲーム)

# Playerクラス {#eb63c884}


## リスト2-1 Player {#yafae24d}

```
class Player
  def initialize(id, dictionary=[], gm=nil)
    @id = id
    @dictionary = dictionary
    @gm = gm
  end
  
  def game_master=(gm)
    @gm = gm
  end
  
  attr_reader :id
  attr_accessor :dictionary
end
```


Playerクラスは、ManualPlayerクラスとAutoPlayerクラスの
基底クラスであり、実際には使わない。

コンストラクタは識別名id、単語を収めた配列dictionary、そして
自分が参加するしりとりのGameMasterオブジェクトを受け取る。

shiritori.rb本文ではManualPlayer.new("あなた")のように生成されている。
@dictionaryと@gmはアクセサで後から設定するからである。
