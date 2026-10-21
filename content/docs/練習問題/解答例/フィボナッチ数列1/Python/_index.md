---
title: "Python"
date: 2026-07-01T11:12:44+09:00
lastmod: 2026-07-01T11:12:44+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)


```
import sys    #コマンドライン引数を使うため、sysモジュールをインポートします。

def fibo(num):    #フィボナッチ数列の一般項を求める関数を定義します。
    if num ==1:
        return 1
    elif num == 2:
        return 1
    else:
        return fibo(num - 1) + fibo(num - 2)    #再帰呼出しを用います。

a = int(sys.argv[1])    #コマンドライン引数を整数型に変換します。

print(fibo(a))
```
