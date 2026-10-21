---
title: "Python"
date: 2026-07-02T02:47:59+09:00
lastmod: 2026-07-02T02:47:59+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#ffeaab60)

```
from random import shuffle
N = 4
a = list(range(1, 10))
shuffle(a)
a = ''.join(map(str,a[:N]))
x = ''
while x != a:
    hit, blow = 0, 0
    x = input(f'Input {N} digit number: ')
    for i, e in enumerate(a):
        if x[i] == e:
            hit += 1
        elif e in x:
            blow += 1
    print(f'{hit} hit, {blow} blow')
```


\#初心者用


```
import random

print("数当てゲーム Hit & Blow")
ans = []
guess = []
n = int(input("遊びたい桁を入力してください(1桁以上9桁以下):  "))
n = min(max(1, n), 9)
hit = 0

'''
# 基本的にはあまり褒められない実装。
while len(a) != n:
    r = random.randint(1, 9)
    if r not in a:
        a.append(r)
'''
# random.shuffle を知らなかった場合
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
for i in range(n):
    picked = random.randrange(i, len(nums))
    ans.append(nums[picked])
    nums[i], nums[picked] = nums[picked], nums[i]  # swap

while hit != n:
    while len(guess) != n:
        x = int(input("予想する数字を大きい桁から１つずつ入力してください:  "))
        x = min(max(1, x), 9)
        if x not in guess:
            guess.append(x)
            print(guess)
        else:
            print("同じ数は入力できません")

    hit, blow = 0, 0
    for i in range(n):
        if guess[i] == ans[i]:
            hit += 1
        elif guess[i] in ans:
            blow += 1
    print(f'{hit} hit, {blow} blow')
    guess = []
print("おめでとう！")
```
