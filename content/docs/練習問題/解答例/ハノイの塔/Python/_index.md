---
title: "Python"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)


```
#!/usr/bin/python
# -*- coding: utf-8 -*-
cnt = 1

def hanoi(n, frm, work, dest):
    global cnt
    if n < 1:
        return
    hanoi(n-1, frm, dest, work)
    print('{0:2}: {1}を{2}から{3}に移動したよ。'.format(cnt, n, frm, dest))
    cnt += 1
    hanoi(n-1, work, frm, dest)

hanoi(4, 'A', 'B', 'C')
```
