---
title: "Excel VBA"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Excel-VBA"
draft: false
---

[練習問題](/docs/練習問題)<br />
Excel関数のTRANSPOSEを使ったプログラム。

```
Sub 転置行列01()
'指定したセル範囲の値の転置行列
Dim a As Variant
Dim b As Variant
Dim c As String
'あらかじめ指定してあるセル範囲を配列にする
a = Selection.Value
'行と列の入れ替え
b = Application.WorksheetFunction.Transpose(a)
'貼り付けるセルの指定
c = Range("A1").Address
'指定したセルを先頭にして貼り付け
Range(c).Resize(UBound(b, 1), UBound(b, 2)) = b
End Sub
```

TRANSPOSEを使わないプログラム。

```
Sub 転置行列02()
'3行3列の転置行列
Dim a As Variant
Dim i As Integer
Dim j As Integer
a = Range("A1:C3")
    '行と列の入れ替え、E1を先頭にして結果を貼り付け
    For i = 1 To 3
        For j = 1 To 3
            Cells(j, i + 4) = a(i, j)
        Next
   Next
End Sub
```
