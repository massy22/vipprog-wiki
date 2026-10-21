---
title: "Python"
date: 2026-06-26T03:11:39+09:00
lastmod: 2026-06-26T03:11:39+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)

解答例1 エラトステネスの篩

```
def sieve(limit):
    is_prime = [0, 0] + [1] * (limit-1)
    sq = int(limit ** .5)
    for i in range(2, sq+1):
        if is_prime[i]:
            for j in range(i*i, limit+1, i):
                is_prime[j] = 0
    return is_prime

res = sieve(int(1e6))
print(' '.join(map(str, (i for i, p in enumerate(res) if p))))
```


解答例2<br />
計算量は大きく見積もって O(n^(1.5)/log(n)) 。解答例1の O(n log log n) に劣る。

```
a = 代入する値
primes = [2]
print(2)
for i in range(3, a+1, 2):
    for p in primes:
        if p**2 > i:
            break
        if i % p == 0:
            i = 0
            break
    if i:
        primes.append(i)
        print(i)
```
