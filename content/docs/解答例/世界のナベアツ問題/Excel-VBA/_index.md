---
title: "Excel VBA"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Excel-VBA"
draft: false
---

[練習問題](/docs/練習問題)

```
Sub ナベアツLike()
Dim num As Integer
Dim i As Integer
num = Range("A1").Value
   For i = 1 To num
        If i Mod 3 = 0 Or i Like "*3*" Then
            Cells(i, 2).Value = "Aho"
        Else
            Cells(i, 2).Value = i
        End If
   Next i
End Sub
```

文字列比較演算子の変わりにInStr関数を使ったプログラム。

```
Sub ナベアツInStr()
Dim num As Integer
Dim i As Integer
num = Range("A1").Value
   For i = 1 To num
        If i Mod 3 = 0 Or InStr(i, "3") Then
            Cells(i, 2).Value = "Aho"
        Else
            Cells(i, 2).Value = i
        End If
   Next i
End Sub
```

そのほかはhttp://www.env.kochi-tech.ac.jp/monma/vba_seminar/pages/quizzes/nabeatsu.html
