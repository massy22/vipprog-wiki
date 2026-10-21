---
title: "ManualPlayerクラス"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "ManualPlayerクラス"
draft: false
---

[プログラミング言語/Ruby/コードリーディング/しりとりゲーム](/docs/プログラミング言語/Ruby/コードリーディング/しりとりゲーム)

# ManualPlayerクラス {#p043f212}

## リスト3-1 ManualPlayerインタフェース(一部を再掲) {#wf66be75}

```
class ManualPlayer < Player
  include Rands
  def answer(before)
  def before_input
private
  def read_answer(before, prompt, err_msg)
```


公開されているインタフェース(メソッド)はanswerとbefore_inputである。
要件上、人間が負けた場合はその際の回答を聞きたいので、AutoPlayerの
publicメソッドがanswerだけなのだけに比べてbefore_inputを用意した。


## リスト3-2 ManualPlayer#answer {#h33a430a}

```
 def answer(before)
   before = char_rand unless before
   @wd = read_answer(before,
                     "[#{before[-1, 1]}...] > ",
                     "エラー: もう一度入力してください")
   @gm.twice?(@wd) ? nil : @wd
 end
```


beforeに渡されているのはGameMasterの@beforeであるが、
それは始めnilに初期化されている。
つまり一回目の回答、前の言葉をしりとりすることができない場合を、
beforeがnilのときとしている。

RandsモジュールからMix-inされたchar_randは、"a"から"z"の間の長さ1の
文字列をランダムに返す。"a"という言葉をしりとりすればaから始まる言葉
になるのでこれで要件を満たす。

そして、そのbeforeを根拠に何やらread_answerと、おそらくプレイヤーである
人間に回答を要求し、答えた単語を@wdに保持する。

既出の回答を人間がすると負けなので、@gm(自らのGameMaster)にtwice?を
問い合わせて、既出だったらnil=回答不能を返す。


## リスト3-3 ManualPlayer#before_input {#v516babf}

```
 def before_input
   @wd
 end
```


人間の最新の回答は@wdに保持されているので、それを返す。


## リスト3-4 read_answer {#b69c5d45}

```
 def read_answer(before, prompt, err_msg)
   line = nil
   loop do
     $stderr.print prompt
     line = $stdin.gets or raise Interrupt
     line.strip!
     break if /\A#{before[-1, 1]}\w*/ =~ line && @dictionary.include?(line)
     $stderr.puts err_msg
   end
   line
 end
```


RubyにはGNU Readlineライブラリを利用するインタフェースであるreadline.soという
拡張ライブラリが標準で用意されているが、今回はいろいろ不都合があったので
使用を見送る。

このメソッドの本筋はloop内の処理だが、始めにlineにnilを代入しているのは
GameMaster#log_searchの説明で語ったローカルスコープ対策である。

標準入力によって人間にしりとりの回答を要求するが、EOF(UNIXならCTRL+C, 
WindowsならCTRL+Z)を送られるとInterrupt例外を挙げる。
これはrubyがスクリプトを実行中にCTRL+Cされると挙げるものだ。

そして、その入力から、改行含め前後の余計な空白をString#strip!で剥ぎ取っている。


## リスト3-5 read_answerの一部 {#fe987c37}

```
break if /\A#{before[-1, 1]}\w*/ =~ line && @dictionary.include?(line)
```


loopは渡されたブロック内の処理を無限に繰り返すメソッドである。そのブロックの中で
ループを終わらせるのはここだけである。

String#[idx, len]はそのStringオブジェクトのidxバイト目からlenの長さの部分を返す。
idxが負の場合、文字列の終端からの勘定となる。
つまりbefore[-1, 1]は、beforeの最後の一文字ということだ。

例えばbeforeが"apple"ならば、リスト3-5の正規表現は式展開をうけて{{br}}
/\Ae\w*/となり、eから始まる単語にマッチする。

このマッチが成功すればしりとりが正しく成されているということであり、
さらに辞書にちゃんと書いてある単語だったら回答としてオッケーなので
入力の要求を切り上げて終わり、というわけだ。
