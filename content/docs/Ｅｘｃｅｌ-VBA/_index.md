---
title: "Ｅｘｃｅｌ VBA"
date: 2026-07-22T05:34:13+09:00
lastmod: 2026-07-22T05:34:13+09:00
slug: "Ｅｘｃｅｌ-VBA"
draft: false
---

マクロの自動記録で雛型作って適当に改造というお手軽さ。<br />
一般企業の業務システムなんて殆ど何でも作れちゃうし！<br />
でもトラブルの元になることもあったりする。<br />

# はじめに {#ue758f7e}
VBAはMicrosoft Officeに搭載されている統合開発環境Visual Basic Editor（VBE）上で開発する。<br />
コードはMicrosoft Excel 2003と2007で動かしているが2003以前でも2007以降でもたぶん動く。<br />
# HelloWorld {#e42bc4f1}

- <strong>下準備</strong>
  - <strong>2003</strong><br />
    ツール→マクロ→セキュリティ→中もしくは低をクリック
  - <strong>2007</strong>（2010も2013も同じ）<br />
    多少面倒くさい。今後のために開発タブを表示させその後設定を変更する。~<br />
    左上のMicrosoft Officeボタン→Excelのオプション→基本設定→Excelの使用に関する基本オプション→~<br />
    開発タブをリボンに表示する→マクロの設定→<br />
    警告を表示しすべてのマクロを無効にする又はすべてのマクロを有効にするをクリック
- <strong>VBEの起動・プログラムの実行</strong>
  - <strong>2003</strong><br />
    ツール→マクロ→Visual Basic Editor
  - <strong>2007</strong><br />
    開発タブ→Visual Basic~<br />
    あとは以下をコピペして実行→Sub/ユーザーフォームの実行→HelloWorldを選択して実行

```
Sub HelloWorld()
'これはコメント、アポストロフィーのあとに入力する
'メモみたいなもん
'実行結果はA1セルにHelloWorldと表示される
Range("A1").Value = "HelloWorld"
End Sub
```

- <strong>解説</strong><br />
  Sub HelloWorld()からEnd Subまでがプログラムを構成する最小単位であるプロシージャである。~<br />
  Sub HelloWorld()はプロシージャ名となる。HelloWorldの部分を書き換えれば好きな名前に出来る。~<br />
  次に何（オブジェクト）をどうするのかを命令（メソッド）したり設定（プロパティ）を変更したりする。

```
オブジェクト名.メソッド名
オブジェクト名.プロパティ名 = 値
```

Range("A1").Value はRange(セル)にValue（値の代入の設定を行うプロパティ）をするという意味である。<br />
Valueは他にもセル内の値を参照するときにも使う。= は値を代入するときに使う記号である。<br />
""内に代入したい値を入力する。ただし数値であれば""は不要である。= 1 + 2 のようにすれば計算結果を代入できる。<br />
""(ダブルクオーテーション)を使うと（= "1 + 2"）計算結果ではなく1 + 2という文字列が代入される。<br />
また= "1" + "2"のようにすると12という文字列が代入される。
文字列はどのような場面でも必ず""で囲む。数字や変数名(後述)、式は囲まない。覚えておこう。

- プロシージャ名のルール

# 変数の利用 {#kfb3527e}

- <strong>変数とは</strong><br />
  利用したいデータ（文字列や数値）を一時的に取り置くための箱のようなもの<br />
  パソコンのメモリに一定のスペースを確保しそこにデータを記憶させる。<br />
- <strong>プログラム</strong>


```
Sub 変数()
'あらかじめA1セルとB1セルに入力されている整数を掛けて計算結果をC1セルに表示する
Dim i As Integer
Dim j As Integer
i = Range("A1").Value
j = Range("B1").Value
Range("C1").Value = i * j
End Sub
```

- <strong>解説</strong><br />
  まずは変数名と変数で何のデータを扱うのか（変数の型）を定める。これを変数の宣言という。~<br />
  VBAの場合はDim 変数名 As 変数の型となる。Integerは-32768から32767までの整数を扱うための型である。

```
Dim i As Integer
Dim j As Integer
```

次に用意した変数に値を代入する。今回はセルを参照してそこに入力されている値を代入する。

```
i = Range("A1").Value
j = Range("B1").Value
```

C1セルに計算結果を代入する。

```
Range("C1").Value = i * j
```

- <strong>VBAの特殊仕様</strong><br />
  これは他言語ではよく見られる仕様であるが…

```
int i,j,k; 
```

VBAではこのようにするとk以外はVariantになってしまう。

```
Dim i, j, k As Integer
```

正しくは

```
Dim i As Integer, j As Integer, k As Integer
```

他にもVBA(VB)は独特の仕様があるから気を付けよう。

- <strong>変数名のルール</strong><br />
- <strong>変数の型一覧</strong><br />
  とりあえずInteger（整数）、Double（小数）、String（文字）の3種類だけ覚えておけばよい。<br />

|型|扱えるデータ|メモ|
|---|---|---|
|Integer|-32768から32767の整数のみ||
|long|-2147483648から2147483647の整数のみ||
|Single|±1.401298E-45から±3.402823E38||
|Double|±4.94065645841247E-324から±1.79769313486232E308||
|String|文字列||
|Byte|0から255の整数|バイナリファイルの読み書きなど。|
|Boolean|真偽|ゲームの当たり判定などで使う。知らない間に内部的な処理で使っていることもある。|
|Currency|-92233703685477.5808から922337203685477.5807|お金を扱うときに使う。|
|Date|日付と時刻||
|Object|Excel上のオブジェクトを扱う。|オートシェイプ、ワークシート、セルなど。|
|Variant|なんでも取り扱える|変数を宣言せずに使うとこの型になる。|

# 計算 {#w57ac774}

```
Sub 計算()
Dim i As Double
Dim j As Double
  i = 3
  j = 2
  '加
  Range("D1").Value = i + j
  '減
  Range("E1").Value = i - j
  '乗
  Range("F1").Value = i * j
  '除
  Range("G1").Value = i / j
  '除（整数）
  Range("H1").Value = i \ j
  'あまり
  Range("I1").Value = i Mod j
  'べき乗
  Range("J1").Value = i ^ j
  '文字列結合演算子
  Range("k1").Value = i & j
End Sub
```

- <strong>解説</strong><br />
  これらの記号(+,-,*,/,\,Mod,^)は算術演算子と呼ばれるもので各種計算を行うためのものである。~<br />
  文字列結合演算子は複数の文字列をひとつにまとめるためのものである。

# セルの操作 {#h7f52bd5}

- <strong>相対参照</strong>
  - <strong>相対参照とは</strong><br />
    現在、選択されているセルから相対的に位置を指定する。<br />
    式の入ったセルの右下を引っ張ってコピーしたときに参照するセルが変わるアレとは関係ない。
  - <strong>プログラム</strong>


```
Sub 相対参照()
'セルG7を選択する
Range("G7").Select
'ActiveCellは現在選択されているセルを参照する。
'Offsetはセルを移動させる。左の数値は上下の指定、右の数値は左右の指定。
'下に1つ、右に3つセルを移動させる。移動後のセルはJ8。
ActiveCell.Offset(1, 3).Select
End Sub
```

  - <strong>解説</strong><br />
    現在のセルの位置（ActiveCell）を基準とした相対位置をOffsetメソッドで指定する。

|-2,-2|-2,-1|-2,0|-2,1|-2,2|
|---|---|---|---|---|
|-1,-2|-1,-1|-1,0|-1,1|-1,2|
|0,-2|0,-1|基準|0,1|0,2|
|1,-2|1,-1|1,0|1,1|1,2|
|2,-2|2,-1|2,0|2,1|2,2|

- <strong>絶対参照</strong><br />
  - <strong>絶対参照とは</strong><br />
    直接、セルを指定する。セルの前に$をつけるとコピーしても参照するセルが変わらないアレとは関係ない。<br />

```
=$C$1+$D$1
```

  - <strong>プログラム</strong>
    - 単一のセルを指定


```
Sub 絶対参照01()
Range("A1").Select
End Sub
```

    - 複数の独立したセルを指定


```
Sub 絶対参照02()
Range("B1,B3,B5,B7,B9").Select
End Sub
```

    - 連続したセルを指定


```
Sub 絶対参照03()
Range("C1:D5").Select
End Sub
```

    - おまけ


```
Sub 絶対参照04()
Range("A1,C1:D5").Select
End Sub
```

- <strong>Cellsによる指定</strong><br />
  行番号と列番号を数字で指定する。列は1がA列、2がB列、3がC列…のようになる。~<br />
  行や列を変数で指定して変化させたい場合、Rangeではなくこちらを使う。<br />

```
Cells(行番号,列番号).Select
```

- <strong>カット・コピー・ペースト</strong>
  - <strong>プログラム</strong>


```
Sub コピペ()
   '文字列の代入
   Range("A1").Value = "（ ＾ω＾）"
   Range("A2").Value = "＼(^o^)／"
   Range("A3").Value = "(´∀｀)"
   Range("A4").Value = "ｷﾀ━(ﾟ∀ﾟ)━!"
   Range("A5").Value = "vipper"
   
   'コピペ
   Range("A1:A5").Copy　　 'Copy→Cutにするとカット
   Range("B1").PasteSpecial'コピー先の先頭を指定してペースト
End Sub
```

  - <strong>解説</strong><br />
    CopyメソッドとCutメソッドは

```
Range("B1,B3,B5,B7,B9").Copy
```

や<br />

```
Range("A1,C1:D5").Copy
```

のようなセルの指定はできない。

- <strong>セルの設定</strong><br />
  フォントや塗りつぶし、文字色などの変更<br />
  - <strong>プログラム</strong><br />

```
Sub 設定()
   'フォント
   Range("A1:A10").Font.Name = "MS明朝"
   '太字
   Range("B1:B10").Font.Bold = True
   '斜体
   Range("C1:C10").Font.Italic = True
   '下線
   Range("D1:D10").Font.Underline = True
End Sub
```

  - <strong>解説</strong><br />
    Nameプロパティによるフォントの指定。""でフォント名を囲む。

```
Range("A1:A10").Font.Name = "MS明朝"
```

Boldプロパティによる太字の設定。Falseは太字の解除を行う。

```
Range("B1:B10").Font.Bold = True
```

Italicプロパティによる斜体の設定。Falseは斜体の解除を行う。

```
Range("C1:C10").Font.Italic = True
```

Underlineプロパティによる下線の設定。Falseは下線の解除を行う。

```
Range("D1:D10").Font.Underline = True
```

  - <strong>その他のプロパティ</strong><br />
    - ColorIndex<br />
      セルを塗りつぶしや文字色の変更。数字で色を指定する。下記は緑。その他の色は[こちらのサイト](http://www.ne.jp/asahi/mabu-messages/greetings-2-you/colorIndexnum.htm)を参照

```
'セルの塗りつぶし
Range("A1").Interior.ColorIndex = 10
'文字色の変更
Range("A1").Font.ColorIndex = 10
```

    - Color<br />
      セルを塗りつぶしや文字色の変更。RGBで色を指定する。

```
'セルを塗りつぶす
Range("A1").Interior.Color = RGB(255, 255, 255)
'文字色の変更
Range("A1").Font.Color = RGB(255, 255, 0)
```

    - Size<br />
      文字サイズの変更。

```
Range("A1").Font.Size = 12
```

# 条件分岐 {#rfb39303}
条件（セルの中の値や計算の結果など）によって処理を分けたいときにはIf文やCase文を使う。<br />

- <strong>If文</strong><br />
  - <strong>プログラム</strong><br />

```
Sub 条件分岐If()
Dim hundred As Integer
hundred = Range("A1").Value
If hundred < 100 Then
   'A1セルに100未満が入力されたとき
    Range("A2").Value = "100未満"
Else
   'A1セルに100以上が入力されたとき
    Range("A2").Value = "100以上"
End If
End Sub
```

  - <strong>解説</strong><br />
    これはIf文の最も基本的な形である

```
If 条件 Then
    '条件が満たされているときの処理
    処理1
Else
    '条件が満たされていないときの処理
    処理2
End If
```

＜ は比較演算子で～未満を表す。意味は変数hundredが100未満のときである。

```
If hundred < 100 Then
```

- <strong>比較演算子</strong><br />
  条件を書くために重要な演算子。

|演算子|記号|メモ|
|---|---|---|
|未満|1 < 2|2を含まないので2 < 2は成立しない。|
|以下|1 <= 2|2を含むので2 <= 2も成立する。|
|超過|2 > 1|2を含まないので2 > 2は成立しない。|
|以上|2 >= 1|2を含むので2 >= 2も成立する。|
|等号|1 = 1,1 <> 1||
|文字列の比較|Like "a"|詳細は後述|

  - <strong>比較演算子の文字列の比較について</strong><br />
    この演算子を使うと正規表現のようなパターンマッチを行うことができる。~<br />
    あくまで正規表現のようなものであって正規表現ではない。<br />
    - 完全一致<br />

```
Sub 文字列の比較1完全一致()
Dim str As String
str = Range("A1").Value
If str Like "a" Then
   'A1セルに半角のaが入力されたとき
   Range("A2").Value = "一致"
Else
   'それ以外
   Range("A2").Value = "一致しない"
End If
End Sub
```

    - 部分一致<br />

```
Sub 文字列の比較2部分一致()
Dim str As String
str = Range("A1").Value
If str Like "*a*" Then '複数の指定はa*b*cのようになる
'A1セルに半角のaを含む文字列が入力されたとき
   Range("A2").Value = "一致"
Else
   'それ以外
   Range("A2").Value = "一致しない"
End If
End Sub
```

    - ある一定の範囲内での一致<br />

```
Sub 文字列の比較3ある範囲内での一致()
Dim str As String
str = Range("A1").Value
If str Like "[a-g]" Then '数字[1-9]・ひらがな[あ-こ]・かたかな[ア-コ]も可
   'A1セルに半角のa,b,c,d,e,f,gのいずれか一文字が入力されたとき
   Range("A2").Value = "一致"
Else
   'それ以外
   Range("A2").Value = "一致しない"
End If
End Sub
```

    - ある一定の範囲外での一致<br />

```
Sub 文字列の比較4ある範囲外での一致()
Dim str As String
str = Range("A1").Value
If str Like "[!a-d]" Then
   'A1セルにa,b,c,d以外のアルファベットが一文字だけ入力されたとき
   Range("A2").Value = "一致"
Else
   'それ以外
   Range("A2").Value = "一致しない"
End If
End Sub
```

    - 任意の文字数<br />

```
Sub 文字列の比較5任意の文字数()
Dim str As String
str = Range("A1").Value
If str Like "???" Then
   'A1セルに3文字の半角全角文字が入力されたとき
   Range("A2").Value = "一致"
Else
   'それ以外
   Range("A2").Value = "一致しない"
End If
End Sub
```

    - 任意の桁数の数字<br />

```
Sub 文字列の比較6任意の桁数の数字()
Dim str As String
str = Range("A1").Value
If str Like "###" Then 'こういう書き方も出来る[0-9][0-9][0-9]
   'A1セルに3桁の半角全角数字が入力されたとき
   Range("A2").Value = "一致"
Else
   'それ以外
   Range("A2").Value = "一致しない"
End If
End Sub
```

- <strong>論理演算子</strong><br />
  こちらも条件を書くときにしばしば使う。

|演算子|記号|メモ|
|---|---|---|
|論理積|条件1 And 条件2|条件1と条件2が両方満たされたとき。|
|論理和|条件1 Or 条件2|条件1と条件2のいずれかが満たされたとき。|
|排他的論理和|条件1 Xor 条件2|条件1と条件2のいずれかが満たされたとき。|
|論理否定|Not 条件|条件が満たされなかったとき。|
|論理等価|条件1 Eqv 条件2|条件1と条件2が両方満たされたとき。もしくは両方満たされなかったとき。|
|論理包含|条件1 Imp 条件2|条件1と条件2が両方満たされなかったとき。|

- <strong>Else If文</strong><br />
  もっと分岐させたいときに使う。条件が複数あるIf文。
  - <strong>プログラム</strong><br />

```
Sub 条件分岐Else_If()
Dim hundred As Integer
If hundred >= 100 Then
   'A1セルに100以上が入力されたとき
   Range("A2").Value = "100以上"
ElseIf hundred >= 90 Then
   'A1セルに90以上が入力されたとき
   Range("A2").Value = "90以上"
ElseIf hundred >= 80 Then
   'A1セルに80以上が入力されたとき
   Range("A2").Value = "80以上"
ElseIf hundred >= 70 Then
   'A1セルに70以上が入力されたとき
   Range("A2").Value = "70以上"
ElseIf hundred >= 60 Then
   'A1セルに60以上が入力されたとき
    Range("A2").Value = "60以上"
Else
    'A1セルに60未満が入力されたとき
    Range("A2").Value = "60未満"
End If
End Sub
```

  - <strong>解説</strong><br />

```
If 条件1 Then
    条件1が満たされているときの処理
ElseIf 条件2 Then
    条件2が満たされているときの処理
ElseIf 条件3 Then
    条件3が満たされているときの処理
…
End If
```

- <strong>Select Case文</strong><br />
  Else If文は個々の条件を書かなければならないので面倒で見づらい。
  - プログラム<br />

```
Sub 条件分岐Select_Case()
Dim hundred As Integer
hundred = Range("A1").Value
Select Case hundred
    Case Is >= 100
        'A1セルに100以上が入力されたとき
        Range("A2").Value = "100以上"
    Case Is >= 90
        'A1セルに90以上が入力されたとき
        Range("A2").Value = "90以上"
    Case Is >= 80
        'A1セルに80以上が入力されたとき
        Range("A2").Value = "80以上"
    Case Is >= 70
        'A1セルに70以上が入力されたとき
        Range("A2").Value = "70以上"
    Case Is >= 60
        'A1セルに60以上が入力されたとき
        Range("A2").Value = "60以上"
    Case Else
        'A1セルに60未満が入力されたとき
        Range("A2").Value = "60未満"
End Select
End Sub
```

  - 解説<br />

```
Select Case 変数や式など
    Case Is 条件1
    　　 条件1が満たされているときの処理
    Case Is 条件2
        条件2が満たされているときの処理
    Case Is 条件3
        条件3が満たされているときの処理
    …
    Case Else
        どの条件も満たされなかったときの処理
End Select
```

条件式を使わない場合（例えばString型の変数に特定の文字列が代入されたことを条件にするというようなとき）、ISは不要。<br />

```
Case "雨"
```

Toを使えば値の範囲を指定できる。<br />

```
Case 1 To 10'1 <= n => 10 のとき
```

# 繰り返し {#t1f7555b}
無限ループを作ってしまったらEscキーで強制終了しよう。

- <strong>For_Next文</strong><br />
  - <strong>プログラム</strong><br />

```
Sub 繰り返しFor_Next()
Dim num As Integer
Dim i As Integer
num = Range("A1").Value
'A1セルに入力された数値だけループを繰り返す
For i = 1 To num Step 1
   'Cellsについてはセルの操作のCellsによる指定を参照
   Cells(i, 2).Value = "このループは" & i & "回目です"
Next i
End Sub
```

  - <strong>解説</strong><br />

```
  For カウンタ変数名 = 初期値 To 終了値 Step 加算値（1なら省略可）
  処理
  Next カウンタ変数名（カウンタ変数名は省略可）
```

初期値はループ開始時のカウンタ変数の値である。このカウンタ変数の値が終了値になるとループが終了する。<br />
ループを一周するごとにカウンタ変数に加算値が加算される。またExit Forを使うとループを途中で抜けることができる。

  - <strong>Exit For使用例</strong><br />
    [練習問題-素数判定](/docs/練習問題#prime)の[解答例](/docs/練習問題/解答例/素数判定/Ｅｘｃｅｌ-VBA)を参照。
- <strong>For_Each文</strong><br />
  関数の活用の項で詳しく説明する。
- <strong>Do_While文</strong><br />
  何回繰り返すかわからないとき（空セルが無くなるまで処理を続けたいときなど）に使う<br />
  - <strong>プログラム</strong>


```
Sub 繰り返しDo_While()
Dim num As Integer
Dim i As Integer
num = Range("A1").Value
i = 1
'A1セルに入力された数値だけループを繰り返す
Do While i <= num
   Cells(i, 2).Value = "このループは" & i & "回目です"
   'ループが一周するごとにiに1が加算される（numの数値に近づく＝終了条件に近づく）
   'i++のような書き方は出来ない
   i = i + 1
Loop
End Sub
```

  - <strong>解説</strong><br />
    終了条件が満たされるまで処理を実行し続ける。Exit Doを使うとループを途中で抜けることができる。

```
Do While 終了条件
処理
Loop
```

このように後判定にすることもできる。後判定にすると必ず1回は処理を実行する。

```
Do 
処理
Loop While 終了条件
```

- <strong>二重ループ</strong>
  - <strong>プログラム</strong><br />

```
Sub 二重ループ()
'九九の表
Dim i As Integer
Dim j As Integer
'外側のループが1回終わる間に内側のループが9回行われる
For i = 1 To 9
   For j = 1 To 9
       Cells(i, j).Value = i & "×" & j & "＝" & i * j
   Next j
Next i
End Sub
```


  - <strong>解説</strong><br />
    ループの中にループを組み込むとこのように二重三重の繰り返し処理をさせることができる。~<br />
    繰り返しや条件分岐は重要な要素なので練習問題の[ループ練習](/docs/練習問題#eb2c4338)や[FizzBuzz](/docs/練習問題#fizzbuzz)、[世界のナベアツ問題](/docs/練習問題#t52a5a48)などでしっかり使い方を覚えよう。

# 配列 {#z2f105a1}

- <strong>配列とは</strong><br />
  複数の同じ型の変数を一括して扱うためのもの。<br />
  通常の変数はひとつひとつがバラバラの箱に入っている

```
Dim i As Integer    
Dim j As Integer → 
Dim k As Integer     | i  |  | j  |  | k  |  | l  |             
Dim l As Integer     |____|　|____|　|____|　|____|
```

しかし配列は大きなひとつの箱に複数の中身が入っている。
そしてそれらは0から始まる添え字によって管理される。配列の中身のことを要素という<br />
この添え字によってX番目のデータを簡単に取り出すことができる。<br />
よくデータの並べ替え（ソートアルゴリズム）で使う。
またListBoxのデータは配列形式である。

```
                              | 0  i    |
                              |.........|
                              | 1  k    |
                              |.........|
                              | 2  j    |
                              |.........|
                              | 3  l    |
                              |_________|
```

- <strong>一次元配列</strong><br />
  イメージは配列とはを参照。
  - <strong>プログラム</strong><br />

```
Sub 一次元配列()
'配列0から9の平均を求める
'配列numの宣言
Dim num(9) As Integer
'この変数に配列に格納された値の合計を代入する
Dim sum As Double
'平均
Dim avg As Double
Dim i As Integer
'配列numの要素
num(0) = 30
num(1) = 67
num(2) = 97
num(3) = 51
num(4) = 39
num(5) = 44
num(6) = 75
num(7) = 23
num(8) = 11
num(9) = 41
'変数sum
sum = 0
'カウンタ変数を添え字に紐付けて
'配列に格納された値を呼び出してsumに足していき合計を求める
For i = 0 To 9
   sum = sum + num(i)
Next
Range("A1").Value = "合計" & sum
avg = sum / 10
Range("A2").Value = "平均" & avg
End Sub
```

  - <strong>解説</strong><br />
    配列の宣言は次の通り。

```
Dim 配列名(扱いたいデータ数) as 変数の型
```

通常、添え字は0からであるが次のようにすれば指定できる。

```
'1から10まで10個データを扱う配列
Dim num(1 to 10) As Integer
```

次に扱うデータを配列に代入する。

```
配列名(添え字) = 数値や文字列等のデータ
```

- <strong>多次元配列</strong><br />
  図は二次元配列の例。一次元配列では行だけであったが列が加わる~<br />
  三次元配列はさらにに奥行きが加わるような感じ。~<br />
  六十次元まで作成可能。どのように値が使われているかはデバッグして調べると良い。~<br />
  参考URL:http://www.relief.jp/itnote/archives/018249.php

```
                              |0-0  i   |1-0  a   |2-0  z   |
                              |.........|.........|.........|
                              |0-1  k   |1-1  s   |2-1  x   |
                              |.........|.........|.........|
                              |0-2  j   |1-2  d   |2-2  c   |
                              |.........|.........|.........|
                              |0-3  l   |1-3  f   |2-3  v   |
                              |_________|_________|_________|
```

  - <strong>プログラム</strong><br />

```
Sub 二次元配列()
'あらかじめA1セルとA2セルで指定している配列の要素の表示
'3行4列の二次元配列
Dim num(2, 3) As String
Dim i As Integer
Dim j As Integer
'配列numの生成
num(0, 0) = "i"
num(0, 1) = "k"
num(0, 2) = "j"
num(0, 3) = "i"
num(1, 0) = "a"
num(1, 1) = "S"
num(1, 2) = "d"
num(1, 3) = "f"
num(2, 0) = "z"
num(2, 1) = "x"
num(2, 2) = "c"
num(2, 3) = "v"
'添え字の指定
i = Range("A1").Value
j = Range("A2").Value
'配列の要素の表示
Range("A3").Value = "配列(" & i & "、" & j & ")の表示"
Range("A4").Value = num(i, j)
End Sub
```

  - <strong>解説</strong><br />
    多次元配列でも以下のようにすれば添え字を指定できる。

```
Dim num(1 To 3, 1 To 4) As String
```

- <strong>Array関数</strong><br />
  Array関数を使えばひとつひとつ要素を生成しなくても一度に生成できる。~<br />
  ただし型はVariant以外は指定できない。また多次元配列では利用できない~<br />
  （不可能ではないがあまり実用的ではない）
  - <strong>プログラム</strong><br />

```
Sub Array関数()
'Sub 一次元配列()を書き直した
Dim num As Variant
Dim sum As Double
Dim avg As Double
Dim i As Integer
num = Array(30, 67, 97, 51, 39, 44, 75, 23, 11, 41)
sum = 0
For i = 0 To 9
   sum = sum + num(i)
Next
Range("A1") = "合計" & sum
avg = sum / 10
Range("A2").Value = "平均" & avg
End Sub
```

- <strong>セルの値を配列で利用する</strong><br />
  - <strong>プログラム</strong><br />

```
Sub セルの値を配列で利用()
'セル範囲にあらかじめ入力されている数値の平均と合計を求める
Dim num As Variant
Dim sum As Double
Dim avg As Double
Dim i As Integer
Dim j As Integer
num = Range("A1:B10")
sum = 0
'行の指定、1行目から10行目を指定しているのでこのようになる
For i = 1 To 10
   '列の指定、A列からB列の2列なのでこのようになる
   For j = 1 To 2
       sum = sum + num(i, j)
   Next
Next
Range("A11").Value = "合計" & sum
avg = sum / 20
Range("A12").Value = "平均" & avg
End Sub
```

  - <strong>解説</strong><br />
    セル範囲を変数に代入すると二次元配列として利用できる。添え字はセル範囲による。(Cellsを使うときと同じ)~<br />
    Variant以外の型は指定できない。

```
num = Range("A1:B10")
```

このように1列だけの場合も一次元配列ではなく二次元配列となる。

```
num = Range("A1:A10")
```

- <strong>動的配列</strong><br />
  宣言時にはいくつ要素を扱うか決めずに後から決める。
  - <strong>プログラム</strong><br />

```
Sub 動的配列()
'配列の要素をA列に貼り付ける。
'配列numの宣言
Dim num() As Integer
Dim i As Integer
'要素数を決める
ReDim num(2)
'配列numの生成
num(0) = 10
num(1) = 11
num(2) = 12
'配列の要素の追加
ReDim Preserve num(3)
num(3) = 13
'配列の要素の貼り付け
For i = 0 To 3
   Cells(i + 1, 1) = num(i)
Next i
End Sub
```

  - <strong>解説</strong><br />
    動的配列は宣言するときに要素数を決めない

```
 Dim 配列名() As 変数の型
```

動的配列は以下のようにして扱う要素数を決定する。動的配列のみで使える方法である。<br />

```
ReDim 配列名(要素数)
```

さらに配列を追加したいときはPreserveを使う。Preserveを使わない場合、すでに生成した要素は消えてしまうので注意。<br />
すでにある要素の合計に新たに加えたい要素数を足した数を()内に入力する。<br />
今回の場合、すでにある要素の合計は3つ(num(2))。さらに1つ加えて4つの要素を扱いたいのでnum(3)とする。 

```
ReDim Preserve 配列名(要素数)
```

# ワークシートとブックの操作 {#w17595bb}

- <strong>ワークシート</strong><br />
  ワークシートの追加やコピー
  - <strong>プログラム</strong><br />

```
Sub ワークシート()
'ワークシートの追加とセル範囲のコピペ
Dim n As Integer
n = Range("A1").Value
'C1からG10セルの範囲をコピー
Range("C1:G10").Copy
For n = 1 To n
   'A1セルに入力した数字だけワークシートを追加する
   '後ろへ後ろへと追加していく
   Worksheets.Add After:=Worksheets(n)
   '現在選択中のワークシート（追加したワークシート）の名前をB列から拾う
   '1枚目はB1セル、2枚目はB2セル、3枚目はB3セル…を参照する
   ActiveSheet.name = Cells(n, 2)
   'コピーしたセル範囲をどのセルを先頭にしてペーストするか
   '特に指定しなければA1セル
   ActiveSheet.Range("C1").Select
   'ペースト
   ActiveSheet.Paste
Next
End Sub
```

  - <strong>解説</strong><br />
    この場合の実行結果は元のワークシートの後ろに12枚のワークシート、1から12が追加される。~<br />
    12枚のワークシートにはすべてC1からG10に入力されているaと罫線がコピーされる。~<br />
    http://bbs.2ch2.net/freedom_uploader/img/1250901796/0256.JPG~<br />
    ワークシートを追加する。この場合では元のワークシートの後ろに1枚追加する。~<br />
    Worksheets("Sheet1")のように書くとどのワークシートの後ろに追加するのか指定できる~<br />
    .Addを.Copyにするとコピーになる。AfterをBeforeにすると前へと追加していく。

```
Worksheets.Add After:= 1
```

ワークシートの名前を設定・取得する。ActiveSheetの部分を<br />
Worksheets("Sheet1")のようにするとどのワークシートの名前を設定するか指定できる。<br />
= の後ろ設定したいファイル名を入力する。

```
ActiveSheet.Name = Cells(n, 2)
```

  - <strong>その他の操作</strong><br />
    - <strong>ワークシートの保護・解除</strong><br />
      保護

```
Worksheets("ワークシート名").Protect"パスワード"
```

保護の解除

```
Worksheets("ワークシート名").Unprotect"パスワード"
```

    - <strong>ワークシートの削除</strong>


```
Worksheets("ワークシート名").Delete
```

    - <strong>ワークシートの非表示</strong><br />
      表示は = xlSheetVisible。また = xlSheetHiddenにすると書式→シート→再表示から表示できる。

```
Worksheets("ワークシート名").Visible = xlSheetVeryHidden
```

- <strong>ブック</strong><br />
  - <strong>プログラム</strong><br />
  - <strong>解説</strong><br />

# 関数の活用 {#od08c566}
Excel関数やVBA関数の活用

- <strong>関数の仕組み</strong><br />
  関数は渡された文字列や数値(これらは引数(ひきすう)という)などを演算してその結果(戻り値)を返す。~<br />
  以下はExdel関数であるSUM関数の例。SUM関数は数値の合計を返す関数である。~<br />
  A1セルの10、A2セルの20、A3セルの30を引数として受け取りA4セルに戻り値として60を返している。~<br />
  http://bbs.2ch2.net/freedom_uploader/img/1250901796/0272.JPG<br />
- <strong>関数を活用したプログラム例-Excel関数編</strong><br />
  - <strong>プログラム</strong><br />
    SUM関数とAVERAGE関数とRANK関数

```
Sub Excel関数()
'セル範囲の数値の合計・平均・順位を求めた後、昇順に並べ替え
Dim s As Integer
Dim avg As Double
Dim r As Object
'SUM関数
s = Application.WorksheetFunction.sum(Range("B2:B11"))
'Average関数
avg = Application.WorksheetFunction.Average(Range("B2:B11"))
Range("D1") = "合計" & s
Range("E1") = "平均" & avg
   'RANK関数
For Each r In Range("B2:B11")
   r.Offset(0, 1).Value = Application.WorksheetFunction.rank(r.Value, Range("B2:B11"))
Next r
 '値を基準にして降順に並べ替え
 '順位を基準にして昇順に並べ替えても同じ結果が得られる
Range("A1:C11").Sort , Key1:=Range("B1"), Order1:=xlDescending, Header:=xlYes, Orientation:=xlTopToBottom
End Sub
```

実行前<br />
http://bbs.2ch2.net/freedom_uploader/img/1250901796/0276.JPG<br />
実行後<br />
http://bbs.2ch2.net/freedom_uploader/img/1250901796/0277.JPG<br />

  - <strong>解説</strong><br />
    Excel関数は次ように使う。セル範囲の値が引数として渡される。~<br />
    今回はセル範囲をきっちり定めているが<br />
    空白セルや関係のない値(SUM関数であれば文字列)を無視するのでRange("A:A")みたいな指定でも動く。<br />

```
'書き方1
Application.WorksheetFunction.関数名(セル範囲)
'書き方2
WorksheetFunction.関数名(セル範囲)
'書き方3、Excel95時代の古い書き方、これでも動く
Application.関数名(セル範囲)
```

For_Each文について解説する。<br />
通常、繰り返し文は何かしらの条件や繰り返し回数を指定するがFor_Each文は特殊でそのようなものは指定しない。<br />
配列やオブジェクト(セル範囲や複数のワークシート)全体に一括して処理を実行するときに使う。<br />
Object型やVariant型の変数にオブジェクトや配列を格納して使う。<br />

```
For Each Object型やVariant型の変数名 In オブジェクトや配列
処理内容
Next Object型やVariant型の変数名(省略可)
```

今回の処理は次の通りである。

```
'Object型の変数r
Dim r As Object
…
   'rにセル範囲Range("B2:B11")(値のセル範囲)を格納
   For Each r In Range("B2:B11")
       'Range("B2:B11")の列をひとつずらしたRange("C2:C11")にrank関数の戻り値を代入
       r.Offset(0, 1).Value = Application.WorksheetFunction.rank(r.Value, Range("B2:B11"))
   Next r
…
```

For_Each文プログラム例その1

```
Sub For_Each文01()
'選択範囲に60以下の数字があったら赤く塗りつぶす
Dim a As Object
For Each a In Selection
   If a.Value < 60 Then
       a.Interior.ColorIndex = 3
   Else
End If
Next a
End Sub
```

For_Each文プログラム例その2

```
Sub For_Each文02()
'選択範囲にの値に10を足す,空セルの場合は代入
Dim a As Object
    For Each a In Selection
        a = a + 10
    Next a
End Sub
```

並べ替えはSortメソッド使う。省略できる設定が多い。<br />
省略した場合は規定値が適用されたり前に書いたVBAの設定が引き継がれる。<br />
また手動で並べ替えオプションを設定する場合にも前に書いたVBAの設定が引き継がれる。<br />
Excelの並べ替えの設定画面と見比べてみるとわかりやすい。

```
セル範囲.Sort,Key1, Order1, Key2, Type, Order2, Key3, Order3, _
Header, OrderCustom, MatchCase, Orientation, SortMethod, _
DataOption1, DataOption2, DataOption3
```

    - <strong>Key1</strong><br />
      基準にする(最も優先して並べ替える)列の先頭を指定する。省略可。

```
'B列の並べ替え
Key1:=Range("B1")
```

    - <strong>Order1</strong><br />
      Key1で指定した列を降順、昇順どちらで並べ替えるか。省略可。規定値は昇順。

```
'降順
Order1:=xlDescending
'昇順、規定値
Order1:=xlAscending
```

    - <strong>Key2</strong><br />
      2番目に基準にする(2番目に優先して並べ替える)列の先頭を指定する。省略可。詳細はKey1を参照。<br />
    - <strong>Order2</strong><br />
      Key2で指定した列を降順、昇順どちらで並べ替えるか。省略可。規定値は昇順。<br />
      詳細はOrder1を参照。<br />
    - <strong>Type</strong><br />
      ピポットテーブルを並び替える場合に使用。詳細はピポットテーブルの項で説明する。<br />
    - <strong>Key3</strong><br />
      3番目に基準にする(3番目に優先して並べ替える)列の先頭を指定する。省略可。詳細はKey1を参照。<br />
    - <strong>Order3</strong><br />
      Key3で指定した列を降順、昇順どちらで並べ替えるか。省略可。規定値は昇順。<br />
      詳細はOrder3を参照。<br />
    - <strong>Header</strong><br />
      並び替えるセル範囲の1行目を見出しと判断するかどうか。省略可。既定値は見出しではないと判断。

```
'1行目を見出しと判断、それ以外の範囲を並び替える
Header:=xlYes
'1行目を見出しではないと判断、セル範囲全体を並び替える、規定値。
Header:=xlNo
'Excelが自動判断
Header:=xlGuess
```

    - <strong>OrderCustom</strong><br />
      ユーザー設定リストを使って並べ替えをするときにリスト内の順番を指定する。省略可。

```
OrderCustom:=1
```

    - <strong>MatchCase</strong><br />
      大文字、小文字を区別するか。省略可。

```
'区別しない
MatchCase:=False
'区別する
MatchCase:=true
```

    - <strong>Orientation</strong><br />
      並べ替える方向を指定。規定値は行方向。

```
'行方向への並べ替え、規定値
Orientation:=xlTopToBottom
'列方向への並べ替え
Orientation:=xlLeftToRight
```

    - <strong>sortMethod</strong><br />
      Key1 - 3に漢字が含まれていたときの並べ替えの順序。省略可。

```
'ふりがなの50音順に並べ替え、ふりがな情報がない場合は音読み順、規定値
'例：男、女、女、男を昇順に並べ替えると男、男、女、女になる
'Key1に設定されている場合は男のkey2に設定した値の昇順と
'女のkey2に設定した値の昇順といったように値がきれいに男女別に分かれる。
SortMethod:=xlPinYin
'画数順に並べ替え
SortMethod:=xlStroke
```

    - <strong>DataOption1</strong><br />
      Key1で設定した列に数値と文字列が混ざっていたときの並べ替えの順序。省略可。

```
'数値と文字列を別々に並べ替え、規定値
'例：すいか2、1、すいか1、2を昇順で並べ替えると1、2、すいか1、すいか2になる
DataOption1:=xlSortNormal
'数値と文字列を同じとみなして並べ替え
'例：すいか2、1、すいか1、2を昇順で並べ替えると1、すいか1、2、すいか2になる
DataOption1:=xlSortTextAsNumbers
```

    - <strong>DataOption2</strong><br />
      Key2で設定した列に数値と文字列が混ざっていたときの並べ替えの順序。省略可。詳細はDataOption1を参照。<br />
    - <strong>DataOption3</strong><br />
      Key3で設定した列に数値と文字列が混ざっていたときの並べ替えの順序。省略可。詳細はDataOption1を参照。<br />
- <strong>関数を活用したプログラム例-VBA関数編</strong><br />
  InputBox関数とMsgBox関数
  - <strong>プログラム</strong><br />

```
Sub vba関数()
'BMI値から痩せすぎ・標準・肥満を判断する。
'これまでのプログラムはセルにあらかじめ値を入力してから
'マクロを実行していたが今回は対話型のプログラムである
Dim height As Double
Dim weight As Double
Dim bmi As Double
Dim result As String
height = InputBox(Prompt:="身長(m)を入力してください", Title:="入力")
weight = InputBox(Prompt:="体重(kg)を入力してください", Title:="入力")
bmi = weight / (height ^ 2)
Select Case bmi
   Case Is <= 18.5
      result = "痩せ過ぎです"
   Case Is <= 25
      result = "標準です"
   Case Is <= 35
      result = "肥満です"
End Select
MsgBox result, vbOKOnly,"判定結果"
End Sub
```

  - <strong>解説</strong><br />
    InputBox関数について解説する。InputBox関数はダイアログ ボックスを表示し~<br />
    ボタンを押したときにテキストボックスに入力された内容を戻り値として返す関数である。~<br />
    下記の項目を設定するとタイトルやメッセージの内容などを設定できる。

```
InputBox(prompt,title,default,xpos,ypos,helpfile context)
```

|項目名|内容|
|---|---|
|prompt|メッセージとして表示する文字列。改行コード(chr(10)とchr(1３))を入れると改行もできる。|
|title|タイトル バーに表示する文字列。省略するとMicrosoft Excelと表示される。|
|default|テキストボックスにあらかじめ表示する文字列。省略すると空。|
|xpos|画面左端からダイアログボックス左端までの距離。省略すると中央になる。|
|ypos|画面上端からダイアログボックス上端までの距離。省略すると上から1/3になる。|
|helpfile|ヘルプボタンを追加する。|
|context|ヘルプファイルのパスを設定する。|

http://bbs.2ch2.net/freedom_uploader/img/1250901796/0302.JPG<br />
次にMsgBox関数について解説する。メッセージボックスを出す。<br />
変数の内容や配列の内容や文字列、数字などを表示させることができる。<br />
メッセージとして表示する内容、配置するボタンの種類<br />
タイトルバー(省略するとMicrosoft Excel)に表示する文字列の順に記述する。
以下はメッセージボックスに配置できるボタン一覧である。

|ボタン名|内容|
|---|---|
|vbOKOnly|OKボタンのみ|
|vbOKCancel|OKボタンとキャンセルボタン|
|vbAbortRetryIgnore|中止ボタンと再試行ボタンと無視ボタン|
|vbYesNo|はいボタンといいえボタン|
|vbYesNoCancelvbRetryCancel|はいボタンといいえボタンとキャンセルボタン|
|vbRetryCancel|再試行ボタンとキャンセルボタン|

以下はif文などで～ボタンを押されたときという処理を書くときに使う。<br />

```
'はいボタンが押されたとき
If vbYes Then
    MsgBox "はいが押されました", vbOKOnly
```

Case文で使うときはInteger型の変数に格納して使う。変数に格納するときは()で囲む。

```
Dim msg As Integer
'はいボタンが押されたとき
msg = MsgBox("ボタンを押して下さい。", vbYesNo, "確認")
     Select Case msg
        Case vbYes
            MsgBox "はいが押されました。", vbOKOnly
```

|処理名|内容|
|---|---|
|vbOK|OKボタンが押された|
|vbCancel|キャンセルボタンが押された|
|vbAbort|中止ボタンが押された|
|vbRetry|再試行ボタンが押された|
|vbIgnore|無視ボタンが押された|
|vbYes|はいボタンが押された|
|vbNo|いいえボタンが押された|

# ユーザー定義関数 {#qa414172}
Excelではあらかじめ用意されているExcel関数だけではなくユーザー定義関数として自作した関数をワークシート上で使うことができる。<br />
また戻り値を他のプログラムで使うことができる。これについては次項で説明する。<br />

  - <strong>プログラム</strong><br />

```
'偏差値を求めるユーザー定義関数、偏差値を求める関数はExcelには用意されていない
'()内は引数、scoreは偏差値を求めたい点数
'areaは全体の点数、セル範囲を指定するのでVariant型
'一番右端のas Doubleは戻り値の型
Function 偏差値(score As Double, area As Variant) As Double
Dim avg As Double
Dim std As Double
Dim dev As Double
'Excel関数であるAverage関数で平均点を求める
avg = Application.WorksheetFunction.Average(area)
'Excel関数であるStDev関数で標準偏差を求める、
'平均値からどれだけ広い範囲に分散しているかという数値
'この数字が大きいほど上と下の差が大きい
'逆に小さいほどみんな平均点近ということがわかる
std = Application.WorksheetFunction.StDev(area)
'偏差値＝(点数－平均点)×10÷標準偏差＋50
dev = (score - avg) * 10 / std + 50
'戻り値、プロシージャ名 = 戻り値のように書く
'VBA関数であるFix関数で小数点以下切捨て
偏差値 = Fix(dev)
End Function
```

  - <strong>解説</strong><br />
    これまではSub～End Sub間に処理を書いていたが今回はFunction～End Function間に処理を書く。~<br />
    HelloWorldの項でプログラムを構成する最小単位であるプロシージャであると説明したが~<br />
    前者をSub プロシージャ、後者をFunction プロシージャという。

```
Function プロシージャ名(引数名 As 引数の型,引数名 As 引数の型…) As 戻り値の型
～
End Function
```

StDev関数は標準偏差を求めるExcel関数である。()内はセル範囲を指定する。

```
std = Application.WorksheetFunction.StDev(area)
```

戻り値はプロシージャ名 = 戻り値のように書く。このプログラムではFix関数で戻り値の小数点以下を切り捨てている。<br />
Fix関数は小数点以下を()内の数値や変数などの小数点以下を切り捨てるVBA関数である。<br />
似たようなVBA関数にInt関数とFormat関数がある。Int関数も小数点以下を切り捨てるが数値が負であった場合、切り上げる。<br />
Format関数は指定した小数点で切り上げる。数値のほかにも日付や曜日などにも使え便利なので覚えておこう。<br />
Excel関数ではこのような働きをするものにRound関数とRoundDown関数とRoundUp関数がある。<br />
Round関数は指定した桁数で四捨五入する。RoundDown関数は指定した桁数で切り捨てる。
RoundUp関数は指定した桁数で切り上げる。<br />
またExcelでは書式設定によって切り捨てや切り上げ、四捨五入を行うことができる。<br />
Excelの書式設定とこれらのVBA関数・Excel関数との違いは前者では切り捨てや切り上げ、四捨五入を行う前の値がセル上に保持されているという点である。<br />
書式設定では数値の見た目は変わっているが計算に使うと切り捨てや切り上げ、四捨五入をを行う前の数値で計算が行われる。<br />
切り捨てや切り上げ、四捨五入ををした数値を計算などに使う予定がなければ書式設定でもかまわない。

```
偏差値 = Fix(dev)
```

ユーザー定義関数をExcel関数としてワークシート上で使うためには関数の分類の一番下のユーザー定義から選択する。<br />
http://bbs.2ch2.net/freedom_uploader/img/1250901796/0314.JPG<br />
次にSUM関数などと同じように引数を渡してやる。<br />
名無しの偏差値を求めるのでScoreはセルD3を指定する。<br />
名無し～やらないおの中での偏差値を求めたいので彼らの点数であるセルD3からセルD13を指定する。<br />
http://bbs.2ch2.net/freedom_uploader/img/1250901796/0315.JPG<br />
絶対参照にして式をセルE4からセルE13へコピペするとブーン～やらないおの偏差値もまとめて求めることができる。<br />
http://bbs.2ch2.net/freedom_uploader/img/1250901796/0316.JPG
# 複数のプロシージャを組み合わせたプログラム {#x62d5164}
処理を分割したり規模の大きなプログラムを作る。

- <strong>Subプロシージャどうしの組み合わせその1</strong><br />
  別のSubプロシージャを呼び出す。
  - <strong>プログラム</strong><br />

```
Sub 複数組み合わせ()
'入力された整数を偶数か奇数か判定する
Dim i As Integer
i = InputBox(Prompt:="数値を入力してください", Title:="入力")
'テキストボックスに入力された整数をA1セルに代入
Range("A1").Value = i
If i Mod 2 = 0 Then
   'テキストボックスに入力された値が2で割り切れたら判定偶数を呼び出す
   Call 判定偶数
Else
   '2で割り切れなければ判定奇数を呼び出す
   Call 判定奇数
End If
End Sub
Sub 判定偶数()
Range("A2").Value = "偶数"
End Sub
Sub 判定奇数()
Range("A2").Value = "奇数"
End Sub
```

  - <strong>解説</strong><br />
    このプログラムは入力された数値に応じて複数組み合わせプロシージャから<br />
    判定偶数プロシージャもしくは判定奇数プロシージャを呼び出している。~<br />
    別のプロシージャを呼び出すにはCallを使う。Callは省略可能だが書いたほうがわかりやすい。

```
Call プロシージャ名
```

- <strong>Subプロシージャどうしの組み合わせその2</strong><br />
  別のSubプロシージャに変数をコピーして引数として渡す。
  - <strong>プログラム</strong><br />

```
Sub 複数プロシージャ()
'入力された整数を偶数か奇数か判定する
Dim i As Integer
i = InputBox(Prompt:="数値を入力してください", Title:="入力")
'テキストボックスに入力された値をA1セルに代入
Range("A1").Value = i
'判定プロシージャを呼び出し変数iのコピーを渡す
Call 判定(i)
End Sub
Sub 判定(ByVal i As Integer)
If i Mod 2 = 0 Then
   '変数iが2で割り切れたら偶数
   Range("A2").Value = "偶数"
Else
   '2で割り切れなければ奇数
   Range("A2").Value = "奇数"
End If
End Sub
```

  - <strong>解説</strong><br />
    Callでプロシージャを呼び出し()内に引数として渡す変数名を書く。もちろん複数の引数も渡すことができる。~<br />
    引数として渡す変数を実引数と呼ぶ。渡すのは<strong>変数のコピー</strong>である。

```
Call 変数を渡してやるプロシージャ名(引数として渡す変数名)
```

次のようにCallを省略してプロシージャ名 変数名でもよいがやはり省略しないほうがよい。
Callを省略するときは次のように変数名を()で囲う必要はない。

```
判定 i
```

引数を受け取るプロシージャはプロシージャ名の後ろの()内のByVal以降に引数名と引数の型を書く。<br />
この引数を仮引数という。実引数と仮引数の型はと数は一致していなければならない。<br />
Fujction プロシージャのように戻り値の型は書かなくてよい。Subプロシージャは戻り値を返さない。

```
Sub プロシージャ名(ByVal 引数として受け取る変数名 As データ型,ByVal 引数として受け取る変数名 As データ型…)
```

たとえば次のようなプログラムは間違い。<br />
入力プロシージャは引数としてi,j,kの3つの変数を渡しているのに判定プロシージャはiとjしか受け取っていない。<br />

```
Sub 入力()
Dim i As Integer
Dim j As Integer
Dim k As Integer
i = Range("A1").Value
j = Range("A2").Value
k = Range("A3").Value
Call 計算(i,j,k)
End Sub
Sub 計算(ByVal i As Integer,ByVal j as integr)
Range("A4").Value = i*j*k
End Sub
```

また次のようなプログラムも間違い。変数i,j,kはDouble型として宣言されているが<br />
計算プロシージャではInteger型になっている。

```
Sub 入力()
Dim i As Double
Dim j As Double
Dim k As Double
i = Range("A1").Value
j = Range("A2").Value
k = Range("A3").Value
Call 計算(i,j,k)
End Sub
Sub 計算(ByVal i As Integer,ByVal j As Integer,ByVal k As Integer)
Range("A4").Value = i*j*k
End Sub
```

- <strong>SubプロシージャとFunctionプロシージャの組み合わせ</strong>
  - <strong>プログラム</strong><br />
  - <strong>解説</strong><br />
- <strong>引数として配列を渡す</strong>
  - <strong>プログラム</strong><br />
  - <strong>解説</strong><br />
- <strong>変数の有効範囲</strong>
  - <strong>プログラム</strong><br />
  - <strong>解説</strong><br />
- <strong>複数のプロシージャを組み合わせるうえでの考え方</strong><br />
  ある程度規模が大きい（例えば100行以上の）プログラムをひとつのプロシージャにまとめると~<br />
  ごちゃごちゃしていて何が何だかわからない見通しの悪いものになってしまう。~<br />
  そのようなことを回避するために処理を複数のプロシージャに分割する。<br />
  - <strong>処理単位ごとに分割する</strong><br />
    関連のある処理をひとつにまとめる。例えばゲームであればプレイヤーキャラ、敵キャラ、キー入力、タイトル、ステージ…といった感じである。~<br />
    もしかしたら似たような処理が多くなってしまい無駄の多いプログラムが完成してしまうかもしれない。~<br />
    しかしこのようにしておけば後から拡張などが必要になったときも見直さなければならない範囲が限定されるので比較的、簡単に修正できる。~<br />
    また各処理がわかれていればバグが発生した際の原因の特定が簡単である。何が原因なのかわからないと悩む時間を減らすことができる。~<br />
    何はともあれまずは修正しやすい構造のプログラムを作成することを心がけよう。~<br />
    無駄を省いていくのはそれからのことである。

# ユーザー定義型の変数 {#w1e77530}

- <strong>ユーザー定義型の変数とは</strong><br />
  いわゆる構造体。異なる型の変数をひとつにまとめるためのもの。~<br />
  例えば名前(String)と体重(Double)、年齢(Integer)、出身地(String)誕生日(Date)などである。~<br />
  これらの変数をひとつひとつ宣言していくのは大変である。複数人分のデータを扱うのであれば配列を使えばよいと思うだろう。~<br />
  しかしそうすると個々人ごとのまとまったデータの扱いが頓雑になってしまう。そこでユーザー定義型の変数を使う。

  - <strong>プログラム</strong><br />
  - <strong>解説</strong><br />

# グラフ {#s128df53}
# ピボットテーブル {#h539fec6}
# データベース {#uca277c3}
# ユーザーフォーム {#u3c9f8de}
# デバッグ {#jc8d8c64}
# エラー処理 {#yfeaf1e4}
# Win32APIの呼び出し {#q53b9111}
# その他 {#x85446da}
高度なトピックやTips、説明漏れ、今後の指標など。
## オブジェクト指向 {#q8a78223}
VBAはオブジェクト指向言語ではないが一応おまけ程度のクラスの仕組みはあるので<br />
意識すればオブジェクト指向のような実装は可能。<br />
クラスのメソッドを経由して親クラスの変数やメソッドにアクセスできない、<br />
子クラス内から親クラスの変数やメソッドにアクセスできないなどの制限がある。<br />
詳細は参考のオブジェクト指向を参照。
## 思うようなサンプルが見つからない {#h030f092}
そのようなときはVB(ただし.net以前のVBである6.0等)のものを参考にすればよい。<br />
VBAはOfficeの活用に特化したVBであり実行ランタイムも同じである。<br />
つまりVBAもVBの一種でありVBでできることの多くはVBAでもできるのである。<br />
VBの資産を有効活用してより効率的なプログラムの開発をしよう。
## バージョン間の互換-2003と2007以降 {#f79663bc}
VBAの言語仕様はほぼ変わっていないがリボンの導入や最大列数・行数の増加、Officeアシスタントの廃止など<br />
操作する対象であるExcel自体がずいぶんと様変わりしてしまった。<br />
そのためプログラムの内容(メニューやツールバー周りや検索するといったようなもの)によっては<br />
予期せぬ結果になってしまったりエラーになってしまう場合もある。<br />
またFileSearchのように一部廃止・変更になっている関数やメソッドもある。<br />
配布や移行などする場合は[これ](http://office.microsoft.com/ja-jp/excel-help/HA010198895.aspx)や[このような](http://technet.microsoft.com/ja-jp/office/ff945357)MSの資料やヘルプ、オブジェクトブラウザに目を通したり<br />
検索や書籍等でして調べるなどしてバージョン間の違いについてしっかり把握しておきたい。<br />
## OpenOfficeやその派生との互換 {#n5d7d398}
ごく基本的なことを除いてあまり互換性はない。まず動かない。<br />
## With文 {#ua37340b}
With文を使うことによってプログラムの記述量を減らすことができる。<br />
また速度的にも有利である。ただしコードが読みづらくなる。<br />
次のプログラムをWith文を使い書き換える。<br />

```
 Sub 設定()
   'セルの指定
   Range("A1:A10").Select
   'フォント
   'Selectionは相対参照の項で使ったActiveCellと同じで現在選択されているセルを参照する。
   'ただし複数セルを選択しているときActiveCellは先頭のセルしか参照しないので注意すること。
   '今回の場合、ActiveCellを使うとA1セルしか以下の設定が反映されない。
   Selection.Font.Name = "MS明朝"
   '太字
   Selection.Font.Bold = True
   '斜体
   Selection.Font.Italic = True
   '下線
   Selection.Font.Underline = True
 End Sub
```

With文を使うと以下のようになる。With～End With間のすべてのSelectionを省略することができる。<br />
オブジェクトの記述を1回にまとめてしまうのだ。<br />

```
Sub 設定()
 'セルの指定
 Range("A1:A10").Select
 With Selection
   'フォント
   .Font.Name = "MS明朝"
   '太字
   .Font.Bold = True
   '斜体
   .Font.Italic = True
   '下線
   .Font.Underline = True
 End With
End Sub
```

With文の基本形

```
With 重複しているメソッドやオブジェクト
…
End With
```


次のように複数のメソッドやオブジェクトを省略することもできる。

```
 'セルの指定
 Range("A1:A10").Select
 With Selection.Font
       'フォント
       .Name = "MS明朝"
       '太字
       .Bold = True
       '斜体
       .Italic = True
       '下線
       .Underline = True
   End With
End Sub
```


このようにIf文（後述）などの他の構文と組み合わせることもできる。

```
Sub 文字列の比較1完全一致()
Dim str As String
str = Range("A1").Value
   With Range("A2")
    If str Like "a" Then
        'A1セルに半角のaが入力されたとき
        .Value = "一致"
    Else
        'それ以外
        .Value = "一致しない"
    End If
   End With
End Sub
```

## 値渡し {#ud081fc7}
# 参考 {#y7791cc5}

- <strong>入門</strong><br />
  - [Excel VBA入門](http://www.officepro.jp/excelvba/)<br />
- <strong>ユーザーフォーム</strong><br />
  - アプリ作成で学ぶExcel VBAプログラミングユーザーフォーム&コントロール<br />
  - ひと目でわかるMicrosoft Excel VBAコントロール&フォーム活用術<br />
  - 【組み合わせ式】 Excel マクロ&ユーザーフォーム部品集
- <strong>web系</strong><br />
  - Excel VBAでIEを思いのままに操作できるプログラミング術<br />
  - 新・Excel VBAで極めるシステムトレード 最強パワーアップ編<br />
- <strong>ゲーム</strong><br />
  水平思考というか職人芸というか。
  - Excel VBA アクションゲーム作成入門<br />
- <strong>3Dグラフィックス</strong><br />
  - Excelで学ぶ コンピュータグラフィックス技術入門<br />
- <strong>シミュレーション・数値計算</strong><br />
  VBAだけではなくソルバーを使ったものやソルバーとの併用もある。~<br />
  さまざまな分野から出ているので目的にあったものを選ぼう。<br />
  - Excelで遊ぶ手作り数学シミュレーション―グラフ機能とVBAプログラムを自在に操る<br />
- <strong>オブジェクト指向</strong><br />
  - [クラスモジュール - EXCEL-LENCE web](http://www.excellenceweb.net/vba/class/)<br />
  - [VBAとJava のオブジェクト指向プログラミング](http://wiki.livedoor.jp/donkichi/d/FrontPage)<br />
    デザインパターン。
  - [だるまのエクセルVBA トップ > オブジェクト指向についてまとめたもの](http://members3.jcom.home.ne.jp/daruma_kyo/aboutooa/)<br />
    VBAでオブジェクト指向プログラミングをする際に頭に入れた方が良いと思ったことを参照。
- <strong>リファレンス</strong><br />
  - できる大事典Excel VBA 2007/2003/2002対応<br />
    2010でも使える。個人的におススメ。
  - Excel VBA 逆引き辞典パーフェクト 2010/2007/2003対応<br />
  - Excel VBAポケットリファレンス<br />
    小さいので持ち運びしやすい。コードは一部しか載っていないので本当の初心者は厳しいかも~<br />
    2003のみなら中古の古い版でもよい。定番シリーズであり他言語のものも多数出ている。~<br />
    SQLとJavascriptとUnixコマンドが個人的におススメ。逆にHTML&スタイルシートはあまりよくないと思った。
