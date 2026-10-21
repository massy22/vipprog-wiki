---
title: "Python"
date: 2026-06-29T22:57:51+09:00
lastmod: 2026-06-29T22:57:51+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)

ライブラリ使っちゃえばいいんじゃないかとも思うけど、<br />
それじゃあアルゴリズムの勉強にはならないか。


```
# from calendar import isleap

def isleap(year):
  return (year%4==0 and year%100!=0) or year%400==0

year = int(input('西暦を入力してください: '))
print('%d年は閏年%s'%(year, 'です' if isleap(year) else 'ではありません'))
```


\#初心者用

```
n = int(input("うるう年かどうかたしかめます。年を西暦で入力してください。:  "))
if n % 100 == 0 and n % 400 != 0:
   print("平年")
elif n % 4 == 0:
   print("うるう年")
else:
   print("平年")
```
