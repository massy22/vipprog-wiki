---
title: "Python"
date: 2026-07-01T11:14:14+09:00
lastmod: 2026-07-01T11:14:14+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)

```
#!/usr/bin/python
import sys
def fibo(n):
    x, y = 0, 1
    for i in range(n):
        x, y = y, x+y
    return x

n = int(sys.argv[1])
print('{0}: {1}'.format(n, fibo(n)))
```
