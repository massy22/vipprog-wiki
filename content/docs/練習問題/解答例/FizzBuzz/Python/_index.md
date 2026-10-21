---
title: "Python"
date: 2026-07-04T17:48:29+09:00
lastmod: 2026-07-04T17:48:29+09:00
slug: "Python"
draft: false
---

```
n = int(input("整数を入力してください: "))
if n < 1:
    n = 0
    print("１以上の正の整数を入力して下さい")
if n > 300:
    n = 0
    print("300以下の数を入力してください")
for a in range(1, n+1):
    if a % 15 == 0:
        print("FizzBuzz")
    elif a % 3 == 0:
        print("Fizz")
    elif a % 5 == 0:
        print("Buzz")
    else:
        print(a)

```

ワンライナーで&#70;izzBuzz。

```
print('\n'.join(str(i)*(i%3!=0 and i%5!=0) + 'Fizz'*(i%3==0) + 'Buzz'*(i%5==0) for i in range(1, 101)))
```
