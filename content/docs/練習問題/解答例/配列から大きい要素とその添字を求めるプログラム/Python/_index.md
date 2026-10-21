---
title: "Python"
date: 2026-07-04T06:30:50+09:00
lastmod: 2026-07-04T06:30:50+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#u170a96a)

リストの要素数をn。上位の個数（今回は3）をkと呼ぶことにする。


---

解答例1。全要素ソートなので計算量 O(n log n)。kが小さいと他に比べて不利。

```
arr = [12, 6, 8, 3, 10, 1, 0, 9]
a = list(range(len(arr)))
a.sort(key=arr.__getitem__, reverse=True)
print('\n'.join(f'{i} -> {arr[i]}' for i in a[:3]))
```


解答例2。初心者用。計算量 O(nk)。kが少し大きくなると不利。

```
a = [12, 6, 8, 3, 10, 1, 0, 9]
NEG_INF = min(a) - 1
for i in range(3):
    mx = max(a)
    i = a.index(mx)
    print(f"{i} -> {mx}")
    a[i] = NEG_INF
```


解答例3。ヒープを使う。計算量 O(n log k) で高速。kがnに近づくと解答例1の素のソートの方が速い。

```
import heapq

arr = [12, 6, 8, 3, 10, 1, 0, 9]
top_k = heapq.nlargest(3, range(len(arr)), key=arr.__getitem__)
print('\n'.join(f'{i} -> {arr[i]}' for i in top_k))
```
