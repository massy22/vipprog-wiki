---
title: "Python"
date: 2026-07-05T06:17:18+09:00
lastmod: 2026-07-05T06:17:18+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#r471e69d)

解答例1

```
import math, fractions

N = 100

squares = []
for i in range(int(math.sqrt(N**2)), 1, -1):
    squares.append(i**2)

simplifier = {}
for n in range(2, N**2 + 1):
    if n in squares:
        simplifier[n] = (int(math.sqrt(n)), 1)
    else:
        x = 1
        y = n
        for s in squares:
            if y % s == 0:
                y //= s
                x *= int(math.sqrt(s))
        simplifier[n] = (x, y)

for a in range(1, N+1):
    for b in range(2, N+1):  
        c = a * b
        integer, sqrt = simplifier[c]
        frac = fractions.Fraction(integer, b)
        numer, denom = frac.as_integer_ratio()
        if sqrt == 1:
            res = f"{frac}"
        elif frac == 1:
            res = f"√{sqrt}"
        elif numer == 1:
            res = f"√{sqrt}/{denom}"
        elif denom == 1:
            res = f"{numer}√{sqrt}"
        else:
            res = f"{numer}√{sqrt}/{denom}"
        print(f"√{a}/√{b} -> {res}")
```


解答例2

```
from math import gcd
from collections import defaultdict

N = 100

# √nの有理化
# 答え: x√y
def f1(n):
    p = n
    d = 2
    dic = defaultdict(int)
    while d * d <= p:
        while p % d == 0:
            dic[d] += 1
            p //= d
        d += 1
    if p > 1:
        dic[p] += 1
    x, y = 1, 1
    for p, e in dic.items():
        x *= p ** (e // 2)
        y *= p ** (e % 2)
    return x, y

cache = {}

def f2(n):
    if not n in cache:
        cache[n] = f1(n)
    return cache[n]

for a in range(1, N+1):
    for b in range(2, N+1):
        # √a      xa√ya
        # --- = ----------
        # √b      xb√yb
        xa, ya = f2(a)
        xb, yb = f2(b)
        if yb > 1:
            ya *= yb
            xb *= yb
#            yb = 1 #になる
            xxa, yya = f2(ya)
            xa *= xxa
            ya = yya
        g = gcd(xa, xb)
        xa //= g
        xb //= g
        # 分母が1
        if xb == 1:
            if ya == 1:
                right = f'{xa}'
            elif xa == 1:
                right = f'√{ya}'
            else:
                right = f'{xa}√{ya}'
        # 分母がある
        else:
            if ya == 1:
                right = f'{xa}/{xb}'
            elif xa == 1:
                right = f'√{ya}/{xb}'
            else:
                right = f'{xa}√{ya}/{xb}'
        print(f'√{a}/√{b} -> {right}')
```
