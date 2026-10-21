---
title: "Excel VBA"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Excel-VBA"
draft: false
---

[練習問題](/docs/練習問題)
西暦を12で割ったあまりを配列の添え字に紐付けする

```
Sub 干支_配列()
Dim zodiac As Variant
Dim years As Integer
Dim i As Integer
zodiac = Array("申", "酉", "戌", "亥", "子", "丑", "寅", "卯", "辰", "巳", "午", "未")
years = Range("A1").Value
i = years Mod 12
Range("A2").Value = "西暦" & years & "年の干支は" & zodiac(i) & "です"
End Sub
```

おまけ

```
Sub 干支_Case文()
Dim zodiac As String
Dim years As Integer
years = Range("A1").Value
 Select Case years Mod 12
       Case Is = 0
           zodiac = "申"
       Case Is = 1
           zodiac = "酉"
       Case Is = 2
           zodiac = "戌"
       Case Is = 3
           zodiac = "亥"
       Case Is = 4
           zodiac = "子"
       Case Is = 5
           zodiac = "丑"
       Case Is = 6
           zodiac = "寅"
       Case Is = 7
           zodiac = "卯"
       Case Is = 8
           zodiac = "辰"
       Case Is = 9
           zodiac = "巳"
       Case Is = 10
           zodiac = "午"
       Case Is = 11
           zodiac = "未"
       Case Else
    End Select
Range("A2").Value = "西暦" & years & "年の干支は" & zodiac & "です"
End Sub
```
