---
title: "Python"
date: 2026-07-06T08:46:15+09:00
lastmod: 2026-07-06T08:46:15+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#simplify-sqrt)

```
from collections import defaultdict

N = 10000

# 素因数分解
def f(n):
    res = defaultdict(int)
    d = 2
    while d * d <= n:
        while n % d == 0:
            res[d] += 1
            n //= d
        d += 1
    if n > 1:
        res[n] += 1
    return res

for i in range(1, N+1):
    a = f(i)
    y = i
    for k, v in a.items():
        while v >= 2:
            y //= (k * k)
            v -= 2
    x = int((i / y) ** .5)
    res = f'√{i} -> '
    if y == 1:
        print(res + f'{x}')
    elif x == 1:
        print(res + f'√{y}')
    else:
        print(res + f'{x}√{y}')
```


解答2。まず素数列挙を行う。本課題のように何度も素因数分解を行う場合は有利。

```
from collections import defaultdict

N = 10000

# 素数列挙 
def sieve(limit):
    is_prime = [0, 0] + [1] * (limit-1)
    sq = int(limit ** 0.5)
    for i in range(2, sq+1):
        if not is_prime[i]: continue
        for j in range(i*i, limit+1, i):
            is_prime[j] = 0
    return tuple(i for i,p in enumerate(is_prime) if p)

# 素因数分解
def factor(n):
    res = defaultdict(int)
    for p in primes:
        if p * p > n: break
        while n % p == 0:
            res[p] += 1
            n //= p
    if n > 1:
        res[n] += 1
    return res

primes = sieve(int(N ** 0.5)+1)

for i in range(1, N+1):
    f = factor(i)
    x, y = 1, 1
    for p, e in f.items():
        x *= p ** (e // 2)
        y *= p ** (e % 2)
    x_ = "" if x == 1 else f"{x}"
    y_ = "" if y == 1 else f"√{y}"
    res = "1" if i == 1 else x_ + y_
    print(f'√{i} -> {res}')
```


\# 初心者向け

```
import math

N = 10000

squares = []
for i in range(int(math.sqrt(N)), 1, -1):
    squares.append(i**2)

print("√1 -> 1")
for n in range(2, N+1):
    if n in squares:
        print(f"√{n} -> {int(math.sqrt(n))}")
    else:
        x = 1
        y = n
        for s in squares:
            if y % s == 0:
                y //= s
                x *= int(math.sqrt(s))
        if x > 1:
            print(f"√{n} -> {x}√{y}")
        else:
            print(f"√{n} -> √{y}")
```
