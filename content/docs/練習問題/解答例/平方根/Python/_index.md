---
title: "Python"
date: 2026-07-08T12:43:19+09:00
lastmod: 2026-07-08T12:43:19+09:00
slug: "Python"
draft: false
---

### 平方根 {#sqrt}

解答例1<br />
ニュートン法10回。n > 1 であれば実は5回で倍精度ほぼ最近接（約15桁）が出る。

```
def my_square(n):
    x = 1.0
    while x * x < n:
        x += 1
    x = (x + (x-1)) / 2
    
    for _ in range(10):
        x = (n/x + x) / 2
    return x

print(my_square(2))
print(my_square(12345))
```


解答例2<br />
任意桁バージョン。下記では小数点以下100桁まで。

```
UNTIL = 100

def int_size(n):
    x = 0
    while x * x < n:
        x += 1
    return len(str(x))

def sq(n):
    a, b, odd = n, 0, 1  # sum of odds [1,3, ...] will be cnt^2
    size = 0
    cnt = 0
    while size <= UNTIL:
        subtrahend = b*2 + odd
        if a >= subtrahend:
            a, odd = a-subtrahend, odd+2
            cnt += 1
        else:
            a, b, odd = a*100, (b+cnt)*10, 1
            size += 1
            cnt = 0
    res = str(b)[:-1]
    isize = int_size(n)
    return res[:isize] + '.' + res[isize:]

print(sq(2))
print(sq(10000))

```

解答例3<br />
初心者が書いたもの。入力値によっては無限ループに陥る。いろいろあるが、浮動小数点の扱いのミスが重大（コメント部分）。初心者が経験すべき良い間違い。

```
c = input( "平方根を求めたい数値を入力:  " )
x = int( c )
a = float(0)
t = 1
n = 0
while t > a:
     k = float(10**n)
     n += 1
     while a**2 > x:
         a = a - 1/k  # 情報落ち。1/kが微小だとaが変化せずループ脱出不可
     while a**2 < x:
         a = a +1/k   # 情報落ち。同上
     t = a + 1
     print("+-" + str(a))
     if a**2 == x:  # ピッタリxになるとは限らない
         break
```


解答例4 分数を使ったもの

```
from fractions import Fraction
from decimal import Decimal, getcontext
from operator import truediv
from functools import reduce

getcontext().prec = 50
ZERO = Fraction('0/1')
ONE = Fraction('1/1')
HALF = Fraction('1/2')

def my_sqrt(num):
    '''
    ニュートン法で平方根を求める。
    '''
    if not 0 < num <= 10000:
        return 'Not implemented...'
    p = Fraction(num).limit_denominator()
    x0 = ZERO
    x1 = HALF * (ONE + p)
    for _ in range(12):
        x0 = x1
        x1 = HALF * (x0 + p / x0)
    return reduce(truediv, map(Decimal, x1.as_integer_ratio()))

print(my_sqrt(0))
print(my_sqrt(1))
print(my_sqrt(2))
print(my_sqrt(3))
print(my_sqrt(10))
print(my_sqrt(100))
print(my_sqrt(0.0001))
print(my_sqrt(10000))
```
