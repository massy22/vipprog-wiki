---
title: "CPU使用率メータ"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "CPU使用率メータ"
draft: false
---

## CPU使用率を表示する {#yde0ae84}
デスクトップアクセサリといえばCPUカウンタではないでしょうか？C#では簡単に作る事ができます。てかコード1行しか書かなかったんだけど^^

<div class="pukiwiki-ref"><img src="cpu_app.png" alt="cpu_app.png" /></div>

完成図

### PerformanceCounter {#k1932f20}
PerformanceCounterはいろんな情報を取得できるクラスみたいです。今回はこれでCPU使用率を取得したいと思います。使い方はネットで調べれば詳しく乗ってますので探してみてください。

PerformanceCounterはツールボックスに入ってますので探してフォームにD&Dしましょう。PerformanceCounterはフォームには表示されず下のほうに表示されるはずです。今回はプロパティを以下のようにします。

```
CategoryName = "Processor"
CounterName = "% Processor Time"
InstanceName = "_Total"
```

候補が表示されるので上の通り選択しましょう。Memoryとか選ぶとメモリ使用率とか取得できるみたいです。

(Name)プロパティはインスタンスの名前になります。最後に1とかVSは勝手につけてうざいのでとってしまいましょう。短くpcとか名前をつけてもいいですよ。

### ProgressBar {#wd0f8f5c}
使用率の表示にProgressBarを使うことにします。ラベルの使い方は習いましたし、グラフっぽく表示できると面白そうです。これもツールボックスからD&Dしましょう。好きなように配置してください。

### Timer {#ifaca29c}
CPU使用率ですから定期的に値が変わったほうがいいですね。Timerは指定した時間ごとに<strong>イベント</strong>を発生させます。時間がくれば指定したメソッドを実行してくれます。

Intervalプロパティはイベントの発生する間隔です。msで指定するので1秒おきなら1000を入れましょう。

Enabledプロパティはそのコントロールが有効であるか指定します。最初はfalseでタイマーが働いていないのでtrueにしておきましょう。

### Tickイベントの登録 {#k7400a22}
TimerコントロールがPerformanceCounterの横にあるのでダブルクリックしてください。そうすると

```
private void timer_Tick(object sender, EventArgs e)
{
}
```

が書き足されたと思います。これはTimerコントロールが指定した時間おきにTickイベントというものを発生させます。このtimer_Tick関数はTickイベントが発生したときに呼ばれるようになります。ほんとは裏でいろいろコードを書かなければいけないのですがVS使うとダブルクリックで全部完了します。やべぇ

### 値を取得して表示 {#nc401172}
使用率を取得するにはPerformanceCounterクラスのNextValueメソッドで取得できるみたいです。引数無しで返ってくる値は<strong>float</strong>みたいです

floatはdoubleよりも範囲が狭く、有効桁も7桁くらいです。

ProgressBarはValueプロパティに値を入れるだけでいいみたいです。プロパティは変数みたいなものです。変数と同じように使えます。int型ですね。intにfloatは突っ込めないのでキャストしてあげましょう。

まとめると

```
private void timer_Tick(object sender, EventArgs e)
{
	this.progressBar.Value = (int)this.performanceCounter.NextValue();
}
```


と書くだけ。てかもう完成しましたよ。早っ

### 常に最前面に表示する {#y8c384af}
他のウィンドウに隠れると見えなくて残念です。常に最前面に表示してみましょう。てかFormのTopMostプロパティをtrueにするだけです。

### 透明にする {#f7840f30}
FormのOpacityプロパティを変えてみるだけです。100%で普通の表示で、0%で完全に見えなくなります。半透明とかできます。

### 完成版ソース {#y0441c1c}

<a href="CpuRate.zip">CpuRate.zip</a>

少し改造しています。参考にどうぞ
