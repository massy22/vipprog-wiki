---
title: "Python"
date: 2026-07-10T08:51:52+09:00
lastmod: 2026-07-10T08:51:52+09:00
slug: "Python"
draft: false
---

```
#!/usr/bin/python

M = 2 ** 16
a = 997
b = 1
x = 12345
N = 100

f = lambda e: '{0:<06}'.format(round(e, 4))

arr = []
for _ in range(N):
    x = (a * x + b) % M
    arr.append(float(x) / M)
print(''.join(e + ('\t' if (i+1)%10 else '\n') for i,e in enumerate(map(f, arr))))
print('平均={0}'.format(f(sum(arr) / N)))
```


```
N = 100

def rng(M=2**16, a=997, b=1, seed=12345):
    x = seed
    while True:
        x = (a * x + b) % M
        yield x / M
rand = rng()
arr = [next(rand) for _ in range(N)]

fmt = lambda e: f'{round(e, 4):<06}'
for i,e in enumerate(arr):
    print(fmt(e), end=(' ' if (i+1)%10 else '\n'))
print()
print(f'平均={fmt(sum(arr) / N)}')


# ヒストグラム表示
import bisect
bounds = [n/10 for n in range(10)]
hist = [0] * len(bounds)
for e in arr:
    bin_idx = bisect.bisect(bounds, e) - 1
    hist[bin_idx] += 1
print()
WIDTH = 30
print('\n'.join(f"{b}: {'*' * int(hist[i]/(N/10)*WIDTH)}" for i,b in enumerate(bounds)))
```


> 

```
0.0: ***************************************
0.1: ******************
0.2: ************************************
0.3: ******************
0.4: ******************************
0.5: *********************************
0.6: *********************************
0.7: ************************
0.8: *********************************
0.9: ************************************
```
