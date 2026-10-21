---
title: "AutoPlayerクラス"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "AutoPlayerクラス"
draft: false
---

[プログラミング言語/Ruby/コードリーディング/しりとりゲーム](/docs/プログラミング言語/Ruby/コードリーディング/しりとりゲーム)

# AutoPlayerクラス {#ddabee6e}

## リスト4-1 AutoPlayerインタフェース {#f75a126a}

```
class AutoPlayer < Player
  include Rands
  def answer(before)
private
  def think_answer(before)
```


スーパークラスを同じくPlayerとするManualPlayerクラスよりもシンプルだ。
公開されているメソッドはanswerしかない。


## リスト4-2 AutoPlayer#answer {#q35b4e4a}

```
 def answer(before)
   if before
     while wd = think_answer(before)
       if @gm.twice? wd
         @dictionary.delete_if{|x| x == wd}
       else
         break
       end
     end
     wd
   else
     array_rand(@dictionary)
   end
 end
```


インデントのネストがわりと深めだ。

"初回の回答"="beforeがnil"はManualPlayerの項で語ったとおりで、
最初のインデントネストのif-elseはその分岐だ。
要件どおり、初回の回答者を任された場合、自身の辞書からarray_randで
ひとつ見繕って返す。

そうでない場合、think_answerで回答を導き出すようだ。

answerの返り値は、wdまたはarray_randの返り値である。


## リスト4-3 think_answer {#fa94ede2}

```
 def think_answer(before)
   @dictionary.detect{|x| /\A#{before[-1, 1]}\w*/ === x}
 end
```


Array#detectメソッド(ComparableモジュールのMix-in)は、
配列の要素に渡されたブロックを試していって、結果が真になる
最初の要素を返す。どれも真にならなければnilだ。

think_answerはほぼこれのラップだ。しりとりできている単語かnilを返す。


## リスト4-4 AutoPlayer#answerの一部 {#ldef2c4d}

```
     while wd = think_answer(before)
       if @gm.twice? wd
         @dictionary.delete_if{|x| x == wd}
       else
         break
       end
     end
     wd
```


このwhileループはthink_answerがnilを返すまで続く。
think_answerがnilを返すときというのは、辞書にしりとりできる
単語がない場合だ。つまり回答不能である。
wdにもthink_answerの返り値としてnilが代入されているはずなので、
answerはnilを返す。

そして、whileの中では自らのGameMasterに考え出した回答が既出かどうか
問い合わせる。twice?が偽、つまり既出ではない有効な回答ならば
ループを終える。wdがその回答として返される。

既出の回答である場合は、それはもう使えない単語なので辞書から消してしまう。
Array#delete_ifは、要素ごとにブロックを試し、結果が真ならばその要素を削ってしまう
破壊的メソッドである。

相手が優秀な回答者ならば、AutoPlayerの辞書から次々単語が消されていき、
やがてthink_answer(の中のArray#detect)が失敗してnilを返すだろう。
