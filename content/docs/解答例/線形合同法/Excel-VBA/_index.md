---
title: "Excel VBA"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Excel-VBA"
draft: false
---

[練習問題](/docs/練習問題)


```
Sub 線形合同法()
Dim m As Long
Dim a As Long
Dim b As Long
Dim x As Long
Dim x2 As Double
Dim avg As Double
Dim i As Integer
m = 65536
a = 997
b = 1
x = 12345
    For i = 1 To 100
        x = (a * x + b) Mod m
        x2 = x / m
        Cells(i, 1).Value = Format(x2, "0.0000")
    Next
avg = Application.WorksheetFunction.Average(Range("A:A"))
Range("B1") = "平均" & Format(avg, "0.0000")
End Sub
```
