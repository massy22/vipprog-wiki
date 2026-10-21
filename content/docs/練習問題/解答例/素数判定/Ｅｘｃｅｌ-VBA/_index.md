---
title: "Ｅｘｃｅｌ VBA"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Ｅｘｃｅｌ-VBA"
draft: false
---

```
Sub Exit_For使用例()
'いわゆる試し割りで素数かどうか判定する
'いろいろ調べてもっと効率よく計算できるように改造しましょう
Dim num As Integer
num = Range("A1").Value
   '1と2は除外
   If num = 2 Then
       Range("A1").Value = "2は素数"
    ElseIf num = 1 Then
       Range("A1").Value = "1は素数ではない"
   Else
   End If
   '2 < num のとき試し割りを実行
   For i = 2 To (num - 1)
      If num Mod i = 0 Then
          '1とnum以外（2から(num - 1)までの数）で割り切れる数があった場合、
          '素数ではないのでループを抜ける
          Range("A1").Value = num & "は素数ではない"
          Exit For
      Else
          Range("A1").Value = num & "は素数"
      End If
   Next
End Sub
```
