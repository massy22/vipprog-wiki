---
title: "Python"
date: 2026-07-01T14:23:11+09:00
lastmod: 2026-07-01T14:23:11+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)


```
def pow(a, n):
  res = 1
  for _ in range(n):
    res *= a
  return res

print(pow(2, 0))
print(pow(2, 1))
print(pow(2, 2))
print(pow(2, 10))
print(pow(2, 1024))
print(pow(2, 1000007)) # 遅い。測ったら1分ちょっとかかった。(2013)
```


\#別解

```
a = int(input("a = "))
n = int(input("n = "))
x = 1
for i in range(n):
    x *= a
print(x)
```
