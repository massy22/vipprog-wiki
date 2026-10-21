---
title: "Excel VBA"
date: 2026-07-02T17:33:35+09:00
lastmod: 2026-07-02T17:33:35+09:00
slug: "Excel-VBA"
draft: false
---

[練習問題](/docs/練習問題)

```
Sub 星座()
Dim stars As Variant
Dim days As Variant
Dim month As Integer
Dim day As Integer
Dim i As String
stars = Array("山羊", "水瓶", "魚", "牡羊", "牡牛", "双子", "蟹", "獅子", "乙女", "天秤", "蠍", "射手", "山羊")
days = Array(19, 18, 20, 19, 20, 21, 22, 22, 22, 23, 22, 21, 19)
month = Range("A1").Value
day = Range("A2").Value
   If day <= days(month - 1) Then
       i = stars(month - 1)
   Else
       i = stars(month)
   End If
Range("A3").Value = month & "月" & day & "日の星座は" & i & "座です"
End Sub
```
