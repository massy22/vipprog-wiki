---
title: "Python"
date: 2026-07-01T05:39:20+09:00
lastmod: 2026-07-01T05:39:20+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)


```
#1～100の乱数を発生させる
import random
n = random.randint(1, 100)
m = 0
#答えmとユーザの入力した値nが違っている間はループ
while m != n:
    m = int(input("いくつ？"))
    if m > n:
        print("もっと少ないよ")
    elif m < n:
        print("もっと大きいよ")
    else:
        pass
print("おめ！")
```
