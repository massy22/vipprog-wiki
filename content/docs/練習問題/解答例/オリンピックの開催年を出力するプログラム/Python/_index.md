---
title: "Python"
date: 2026-07-04T16:41:27+09:00
lastmod: 2026-07-04T16:41:27+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#olympics)

```
for i, y in enumerate(range(1896, 2016, 4)):
    if not y in [1916, 1940, 1944]:
        print(f"第{i+1:2}回  {y}年")
```


\#少しダメな例、上記の方が効率的

```
for n in range(30):
    y = 1896 + 4*n
    if y == 1916 or y == 1940 or y == 1944:
        continue
    else:
        print("第" + str(n + 1) + "回   " + str(y))
```
