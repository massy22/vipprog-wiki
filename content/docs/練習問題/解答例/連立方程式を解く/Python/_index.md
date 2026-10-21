---
title: "Python"
date: 2026-07-02T16:43:47+09:00
lastmod: 2026-07-02T16:43:47+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)

ガウスの消去法（部分ピボット選択）

```
"""
拡大係数行列とは、例えば
  3x + 2y = 7
  4x +  y = 6
を
  3 2 7
  4 1 6
と表したものです。
"""

a = []
print('拡大係数行列を入力:')
while True:
    s = input().strip()
    if s == '': break
    row = [float(elem_str) for elem_str in s.split()]
    a.append(row)
N = len(a)

# 前進消去
for i in range(N):
    # ピボット選択
    pivot_row = i
    for ii in range(i, N):
        if abs(a[ii][i]) > abs(a[pivot_row][i]):
            pivot_row = ii
    a[i], a[pivot_row] = a[pivot_row], a[i]
    
    for ii in range(i+1, N):
        ratio = a[ii][i] / a[i][i]
        for jj in range(i, N+1):
            a[ii][jj] -= ratio * a[i][jj]

# 後退代入
x = [0.] * N
for i in range(N)[::-1]:
    total = sum(a[i][ii] * x[ii] for ii in range(i+1, N))
    x[i] = (a[i][N] - total) / a[i][i]
    
print(x)
```


---

ガウスの掃き出し法を使っています。


```
a = input('1次の連立方程式を、例えばax+by=c dx+ey=fであれば、a,b,c|d,e,fと入力してください。')

a = a.split('|')	#入力された文字列を式単位に分割してリスト型に変換します。
for h in range(len(a)):	#式を係数単位で分割してリスト型に変換します。
	a[h] = a[h].split(',')
	for g in range(len(a[h])):	#係数をfloat型に変換します。
		a[h][g] = float(a[h][g])

for i in range(len(a)):
	if a[i][i] == 0:	#行列の(i,i)成分が0である場合、i以降の行で、i成分が0でないj行とi行を入れ替えます。
		for j in range(i,len(a)):
			if a[j][i] != 0:
				a[i],a[j] = a[j],a[i]
				break
	tpv = a[i][i]	#i行の対角成分をtpvとします。
	for k in range(len(a[i])):	#i行を対角成分で割ります。
		a[i][k] = a[i][k] / tpv
	for l in range(i):	#第1行からi-1行までのループ処理です。
		rat = a[l][i]	#比率を定めます。
		for m in range(len(a[l])):	#i行を(l,i)倍して、l行から引きます。
			a[l][m] = a[l][m] - rat * a[i][m]
	for n in range(i+1,len(a)):	#第i+1行から最後の行までのループ処理です。
		rat = a[n][i]
		for o in range(len(a[n])):
			a[n][o] = a[n][o] - rat * a[i][o]
print(list(zip(*a))[-1])
```
