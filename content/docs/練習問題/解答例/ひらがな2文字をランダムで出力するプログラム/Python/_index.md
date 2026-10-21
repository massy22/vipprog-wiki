---
title: "Python"
date: 2026-06-23T15:16:25+09:00
lastmod: 2026-06-23T15:16:25+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#s98f80e0)

```
from random import choice
s = 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん'
print('\n'.join(f"{choice(s)}{choice(s)}" for _ in range(100)))
```


\#choiceを知らなかったとき

```
import random
 
a = "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん"
m = random.randrange(len(a))
n = random.randrange(len(a))
print(a[m] + a[n])
```
