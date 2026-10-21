---
title: "Python"
date: 2026-07-05T19:53:17+09:00
lastmod: 2026-07-05T19:53:17+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題#bowling)

本当はちゃんとクラスを書いた方がいい

```
_ = input('投球数: ')
n_pins = tuple(map(int, input('ピン数の列: ').split()))
n_throw = len(n_pins)

EMPTY, NORMAL, STRIKE, SPARE = 0, 1, 2, 3
pts = [-1] * 21
p_types = [EMPTY] * 21
f_total = [0] * 10

f_idx = 0
trial = 0
for i in range(n_throw):
    pt = n_pins[i]
    p_idx = f_idx * 2 + trial
    
    if pt == 10:
        p_types[p_idx] = STRIKE
        if f_idx < 9:  # 最終フレームはボーナスと投球スキップなし
            pt += n_pins[i+1] +  n_pins[i+2]
            trial += 1
    elif trial == 1 and pt + pts[p_idx-1] == 10:
        p_types[p_idx] = SPARE
        if f_idx < 9:
            pt += n_pins[i+1]
    else:
        p_types[p_idx] = NORMAL
    pts[p_idx] = pt
    f_total[f_idx] += pt
    
    if f_idx < 9:
        if trial == 1:
            f_total[f_idx+1] += f_total[f_idx]
            f_idx += 1
        trial = 1 - trial
    else:
        trial += 1

marks = {EMPTY:'_', STRIKE: 'X', SPARE: '/'}
symbolize = lambda i: f"{pts[i]}" if p_types[i] == NORMAL else marks[p_types[i]]

p_splitted = [range(f*2, f*2+2+(f//9)) for f in range(10)]
f_str = [''.join(symbolize(p_idx) for p_idx in ps) for ps in p_splitted]

print()
print(' '.join(f"{s:^3}" for s in f_str))
print(' '.join(f"{t:^3}" for t in f_total))
```
