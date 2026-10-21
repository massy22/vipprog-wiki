---
title: "Excel VBA"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Excel-VBA"
draft: false
---

[練習問題](/docs/練習問題)

```
Sub Fizzbuzz()
Dim num As Integer
num = Range("A1").Value
   For i = 1 To num
        'i mod 15 = 0でもよい
        If i Mod 3 = 0 And i Mod 5 = 0 Then
            Cells(i, 2).Value = "FizzBuzz"
        ElseIf i Mod 5 = 0 Then
            Cells(i, 2).Value = "Buzz"
        ElseIf i Mod 3 = 0 Then
            Cells(i, 2).Value = "Fizz"
        Else
            Cells(i, 2).Value = i
        End If
   Next i
End Sub
```

そのほかはhttp://www.env.kochi-tech.ac.jp/monma/vba_seminar/pages/quizzes/fizzbuzz.html
