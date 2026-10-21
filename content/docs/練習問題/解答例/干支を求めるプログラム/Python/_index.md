---
title: "Python"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)

```
# -*- coding: utf-8 -*-
a = u'庚辛壬癸甲乙丙丁戊己'
b = u'申酉戌亥子丑寅卯辰巳午未'
y = int(input('西暦を入力してください: '))
print(u'{0}{1}'.format(a[y%len(a)], b[y%len(b)]))
```
