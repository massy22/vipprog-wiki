---
title: " テレホマンマスコット"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "-テレホマンマスコット"
draft: false
---

# テレホマンマスコット {#ke63f382}
C#チュートリアルとして，[マのネタ帳](/docs/マのネタ帳)にあるタスクトレイ常駐型テレホマンマスコットを作成します．


# これは何？ {#g454211d}
午後11時になると突如登場するテレホマン。ノスタルジーに浸れるデスクトップマスコット。

```
　　　　　　　　　　　＿＿＿＿＿＿＿＿＿＿＿＿＿
　　 ＿＿＿　　　／
　／´∀｀;::::＼＜　　テレホマン　フライングアタ～～～～ック!!!
/　　　　/::::::::::|　＼＿＿＿＿＿＿＿＿＿＿＿＿＿
| ./|　　/:::::|::::::|
| |｜／::::::::|::::::|

説明しよう！
テレホマンフライングアタックとは
23時まで残すところ2分59秒の瞬間に繋ぐテレホマンの事である。
へっぽこプロバイダだと
回線が23時の瞬間に一斉に埋まってしまうため、
10円損してでも回線をゲットするという目的から生まれた大技である！
その凄まじいまでのインターネットへの執念は
DSLマンやFTTHマンの回線速度を上回る最強の攻撃力を発揮する。

がんばれ　ぼくらのテレホマン　みんなのテレホマン 
```

- 時報同様に「ﾃｯ､ﾃｯ､ﾃﾚﾎｰ」で出現するのがミソらしい。


# 制作開始 {#hf63e4c6}
## まずはテレホマンを用意します． {#h9d59593}
こんな感じで

<img src="telephoman.png" alt="telephoman.png" />

今回は画像で用意しました．
AAでもいいですよ．

## Windowsフォームアプリケーション {#z1ababe8}
で作成を開始しましょう．

### 背景にテレホマン {#c84ce53b}
まずはFormの背景をテレホマンにしましょう．<strong>BackgroundImage</strong>プロパティに先ほどつけ込んでおいたテレホマンを指定しましょう．
このままだと繰り返して表示されてウザイので<strong>BackgroundImageLayout</strong>プロパティを<strong>Zoom</strong>とか<strong>Stretch</strong>にするといいでしょう．

### 枠をなくす {#j9e22026}
Formの外枠を無くしてみましょう．<strong>FormBorderStyle</strong>プロパティを<strong>None</strong>にしましょう．
枠なくすと×ボタンもなくなるのでそのままでは終了できなくなるので注意．

### 真ん中に表示する {#y5bec8f8}
せっかくですから登場するときはど真ん中にしたいですね．
<strong>StartPosition</strong>プロパティを<strong>CenterScreen</strong>にすると真ん中になります．

## タスクトレイに表示する {#odcf1ed6}
今回は常駐型デスクトップマスコットですから，
タスクトレイにアイコンを表示させましょう．
それにはツールボックスから<strong>NotifyIcon</strong>を使います．
<strong>NotifyIcon</strong>アイコンを設置したら<strong>Visible</strong>プロパティを<strong>true</strong>します．
これでアイコンが表示されます．アイコンはお好みで用意しましょう．

タスクトレイに表示したらタスクバーの表示はもう必要ないでしょう．
<strong>Form</strong>の<strong>ShowInTaskbar</strong>プロパティを<strong>False</strong>にしてください．

## タイマー {#l7a74343}
さて，23時にﾃｯ､ﾃｯ､ﾃﾚﾎｰするためには指定した時間になるとメソッドを呼んでくれると良さそうです．
しかし，そんな便利な機構って意外とないんですねー．


### 指定した時間にお知らせしてくれるメソッド {#pd16b703}
そこで，指定した時間おきにメソッドを呼んでくれる<strong>Timer</strong>クラスがあります．
それを利用して11時になったらお知らせするメソッドを自分で作ることにしましょう．
ツールボックスからTimerを設置しましょう．

<strong>Timer</strong>の<strong>Interval</strong>プロパティを1000にします．
Intervalは何ミリ秒ごとにメソッドを実行するかを指定します．今回は1000ミリ秒ですから1秒ごとですね．
そして，<strong>Enabled</strong>プロパティを<strong>True</strong>にしておきます．これでタイマーが有効になります，

### Timerイベントの登録 {#g94d770e}
<strong>Timer</strong>を選択して，プロパティウィンドウのところの雷アイコンを押してください．
雷アイコンを押すと，プロパティがイベントに変わります．

イベントはなんか起きたとき誰かが呼んでくれるメソッドみたいなそんな感じのやつです．
<strong>Timer</strong>クラスには<strong>Tick</strong>イベントがあります．ここにメソッドを登録すると1秒おきにそのメソッドを実行してくれます．
Tickをダブルクリックすると，そのメソッドを自動で作ってくれます．

さてそのメソッドの中で今23時かどうか調べれば良いわけです．
現在の時刻は<strong>DateTime</strong>クラスの<strong>Now</strong>プロパティで取得できます．
さらに時間，分，秒は<strong>DateTime</strong>クラスの<strong>Hour</strong>, <strong>Minute</strong>, <strong>Second</strong>プロパティで取得できるので，これと比較すればおｋ．


```
private void timer1_Tick(object sender, EventArgs e)
{
	//現在時刻
	DateTime now = DateTime.Now;
	if (now.Hour == 23 && now.Minute == 0 && now.Second == 0)
	{
		//時間になったらテレホー
		this.Show();
	}
}
```


23時になるとテレホーするためにフォームを表示させます．
<strong>Form</strong>クラスの<strong>Show</strong>メソッド
