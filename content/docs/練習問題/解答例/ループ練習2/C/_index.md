---
title: "C"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C"
draft: false
---

[問題文](/docs/練習問題#eb2c4338)

```
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int i, n;
    n = atoi(argv[1]);
    for(i=0; i<n; i++) {
        printf("%s %d\n", "Hello World!", i+1);
    }
    return 0;
}
```
