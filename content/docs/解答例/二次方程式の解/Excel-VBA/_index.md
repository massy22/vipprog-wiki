---
title: "Excel VBA"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Excel-VBA"
draft: false
---

[練習問題](/docs/練習問題)


```
Sub 係数入力()
Dim a As Double
Dim b As Double
Dim c As Double
a = Range("A1").Value
b = Range("B1").Value
c = Range("C1").Value
解計算 a, b, c
End Sub
Sub 解計算(ByVal a As Double, b As Double, c As Double)
Dim d As Double
Dim x1 As Double
Dim x2 As Double
Dim x3 As String
d = b * b - 4 * a * c
If d >= 0 Then
  x1 = -(b + Math.Sqr(d)) / (2 * a)
  x2 = -(b - Math.Sqr(d)) / (2 * a)
Else
   x1 = b / (2 * a)
   x2 = Math.Sqr(-d) / (2 * a)
End If
x3 = "x1：" & x1 & "、x2：" & x2
Range("D1").Value = x3
End Sub
```
