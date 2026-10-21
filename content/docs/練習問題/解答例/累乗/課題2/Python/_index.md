---
title: "Python"
date: 2026-07-01T14:29:09+09:00
lastmod: 2026-07-01T14:29:09+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)

繰り返し二乗法。


```
def pow(a, n):
  res = 1
  while n > 0:
    if n & 1: res *= a
    a **= 2
    n >>= 1
  return res

print(pow(2, 0))
print(pow(2, 1))
print(pow(2, 2))
print(pow(2, 10))
print(pow(2, 1024))
print(pow(2, 1000007)) # だいたい10秒ぐらい。
print(2 ** 1000007)  # これも10秒ぐらいだった。
```
