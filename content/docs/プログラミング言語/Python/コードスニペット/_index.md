---
title: "コードスニペット"
date: 2026-07-06T10:07:07+09:00
lastmod: 2026-07-06T10:07:07+09:00
slug: "コードスニペット"
draft: false
---

# flatten {#flatten}
再帰を使わない方法

```
import collections.abc
def flatten(lst):
  i = 0
  while i < len(lst):
    while isinstance(lst[i], collections.abc.Iterable):
      if not lst[i]:
        lst.pop(i)
        i -= 1
        break
      else:
        lst[i:i+1] = lst[i]
    i += 1
  return lst

print([1, 2, 3, 4, 5, 6, 7] == flatten([1, [2, 3], [4, 5, [6, 7]]]))
```


再帰を使う方法

```
def flatten(lst):
  flatList = []
  for e in lst:
    if type(e)==list:
      flatList.extend(flatten(e))
    else:
      flatList.append(e)
  return flatList

print([1, 2, 3, 4, 5, 6, 7] == flatten([1, [2, 3], [4, 5, [6, 7]]]))
```


# 順列 {#permutations}
itertoolsのpermutationsでやる。<br />
その1: リストのすべての要素についての順列を列挙する(permutationsの第2引数を指定しない)。

```
from itertools import permutations
a = [ 1, 2, 3, 4 ]
a = sorted(a)
for e in permutations(a):
  print(', '.join(map(str,e)))
```


参考: C++11での実装(next_permutation)

```
#include <iostream>
#include <vector>
#include <algorithm>
#include <sstream>
using namespace std;
#define all(v) v.begin(), v.end()

int main(void) {
    vector<int> v = { 1, 2, 3, 4 };
    int sz = v.size();
    sort(all(v));
    do {
        stringstream ss;
        for(int i=0; i<sz; i++) {
            if(i) { ss << ", "; }
            ss << v[i];
        }
        cout << ss.str() << endl;
    } while(next_permutation(all(v)));
    return 0;
}
```


その2: 指定された要素数の順列を列挙する(permutationsの第2引数に要素数を指定する)。

```
from itertools import permutations
a = [ 1, 2, 3, 4 ]
a = sorted(a)
for e in permutations(a, 2):
  print(', '.join(map(str, e)))
```


# 組み合わせ {#combinations}
itertoolsのcombinationsでやる。

```
from itertools import combinations
a = [ 1, 2, 3, 4 ]
a = sorted(a)
for e in combinations(a, 3):
  print(', '.join(map(str,e)))
```


# デカルト積 {#cartesian-product}
itertoolsのproductでやる。

```
from itertools import product
for e in product('abcd', repeat=3):
  print(', '.join(e))
```


これは以下のコードと等価。

```
s = 'abcd'
for x in s:
  for y in s:
    for z in s:
      print(', '.join(x+y+z))
```


# 数字からなるリストの各要素をかけ算する {#prod}
以下の例だと、3 x 7 x 11 x 13 x 17 で 51051 になる。

```
from functools import reduce
a = [3, 7, 11, 13, 17]
print(reduce(lambda x, y: x*y, a))
```


# 2つのリストの要素を交互に連結する {#a25dc2d2}
2つのリストから交互にデータを取り出し1つのリストを作る。
以下の例だと、c は [1, 4, 2, 5, 3, 6] になる。

```
a = [1, 2, 3]
b = [4, 5, 6]
c = list(sum(zip(a, b), ()))
```


# リストの重複を排除する {#unique}
リストの重複した要素を削除する。ただし要素の出現順に並べる。
以下の例では、[2, 0, 3, 4, -1, -2] を出力する。

```
a = [2, 0, 0, 3, 2, 3, 4, 3, -1, -2, -1]
print(list(sorted(set(a), key=a.index)))
```


# 二分探索 {#binary-search}

```
# リストaの中にxが含まれている場合、その位置を0-indexedで返す。
# xが含まれていない場合は-1を返す。
from bisect import bisect_left

#def binary_search(a, x, lo=0, hi=None):
#    if hi == None:
#        hi = len(a)
#    while lo < hi:
#        md = (lo+hi) // 2
#        v = a[md]
#        if v < x:
#            lo = md + 1
#        elif x < v:
#            hi = md
#        else:
#            return md
#    return -1

def index(a, x):
    i = bisect_left(a, x)
    if i != len(a) and a[i] == x:
        return i
    return -1

a = range(-int(5e7), int(5e7), 2)
xs = [ -1, 0, int(1e8), -int(1e8), -int(4e6-1), -int(4e6), -45672108, 2222222 ]
for x in xs:
#    print('{0:10}: {1:8}'.format(x, binary_search(a, x)))
    print('{0:10}: {1:8}'.format(x, index(a, x)))
```


# キュー {#queue}
dequeによる実装。append/popleftを使う。

```
from collections import deque
q = deque('xyz')
print(q) # deque(['x', 'y', 'z'])
q.append('a')
q.append('f')
print(q) # deque(['x', 'y', 'z', 'a', 'f'])
print(q.popleft()) # x
print(q.popleft()) # y
print(q) # deque(['z', 'a', 'f'])
print(q.popleft()) # z
print(q.popleft()) # a
print(q.popleft()) # f
if len(q):
  print(q.popleft()) # if文がないとIndexErrorになる。
print(q) # deque([])
```


# スタック {#stack}
dequeによる実装。append/popを使う。

```
from collections import deque
q = deque('xyz')
print(q) # deque(['x', 'y', 'z'])
q.append('a')
q.append('f')
print(q) # deque(['x', 'y', 'z', 'a', 'f'])
print(q.pop()) # f
print(q.pop()) # a
print(q) # deque(['x', 'y', 'z'])
print(q.pop()) # z
print(q.pop()) # y
print(q.pop()) # x
if len(q):
  print(q.pop()) # if文がないとIndexErrorになる。
print(q) # deque([])
```


# クイックソート {#qsort}
[練習問題(アルゴリズム編)](/docs/練習問題-アルゴリズム編-#qsort)の答案

```
from random import shuffle

def qsort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[0]
    smaller = [e for e in arr[1:] if e < pivot]
    larger  = [e for e in arr[1:] if e >= pivot]
    return qsort(smaller) + [pivot] + qsort(larger)

a = list(range(1, 11))
shuffle(a)
print(a)
b = qsort(a)
print(b)
```
