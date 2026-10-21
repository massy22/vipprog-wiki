---
title: "C"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C"
draft: false
---

[問題文](/docs/練習問題#w9c362ad)

```
#include <stdio.h>
#define SZ 33

int main(void) {
    int s[SZ][SZ], r, c;
    for(r=0; r<SZ; r++) { s[r][0] = 0; }
    for(c=2; c<SZ; c++) { s[0][c] = 0; }
    s[0][1] = 1;
    for(r=0; r<SZ-1; r++) {
        for(c=1; c<SZ; c++) {
            s[r+1][c] = s[r][c] ^ s[r][c-1];
            if(s[r][c]) { printf("*"); }
            else        { printf(" "); }
        }
        printf("\n");
    }
    return 0;
}
```
