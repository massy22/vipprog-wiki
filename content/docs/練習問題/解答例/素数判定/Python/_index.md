---
title: "Python"
date: 2026-07-22T05:30:21+09:00
lastmod: 2026-07-22T05:30:21+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#prime)

解答例1

```
def is_prime(x):
  if x < 2:
    return False
  if x == 2:
    return True
  if x % 2 == 0:
    return False

  a = 3
  while a**2 <= x:
    if x % a == 0:
      return False
    a = a + 2

  return True

x = int(input('値を入力してください: '))
if is_prime(x):
  print('素数です')
else:
  print('素数ではありません')
```


解答例2

```
def is_prime(n):
    sq = int(n ** .5)
    for d in range(2, sq+1):
        if n % d == 0:
            return 0
    return n > 1

n = int(input('値を入力してください: '))
print(f"{n}は素数" + ('です' if is_prime(n) else 'ではありません'))
```


解答例3<br />
実質的に素数列挙であり相当に非効率的。計算量は大きく見積もって O(n^(1.5)/log(n)) 。解答例1・2の O(√n) に大きく劣る。

```
a = 代入する値
primes = [2]
is_prime = False

if a < 2:
    pass
elif a % 1 != 0:
    pass
elif a == 2:
    is_prime = True
elif a % 2 == 0:
    pass
else:
    for x in range(3, a+1, 2):
        for p in primes:
            if p**2 > x:
                break
            if x % p == 0:
                x = 0
                break
        if x:
            primes.append(x)
    
    if a in primes:
        is_prime = True
        
if is_prime:
    print("素数である")
else:
    print("素数ではない")
```
