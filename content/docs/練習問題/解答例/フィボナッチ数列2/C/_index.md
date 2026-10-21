---
title: "C"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C"
draft: false
---

[練習問題](/docs/練習問題)

long longの上限値を考慮して第90項まで対応。


```
#include <stdio.h>
#include <stdlib.h>
#define LIMIT 90
typedef long long i64;

i64 fib(int n);
i64 dp[LIMIT];

int main(int argc, char *argv[]) {
    int n;
    if(argc < 2) { return 1; }
    n = atoi(argv[1]);
    if(n < 1) { return 1; }
    if(LIMIT < n) { return 1; }
    printf("%3d: %lld\n", n, fib(n));
    return 0;
}

i64 fib(int n) {
    int i;
    dp[1] = dp[2] = 1LL;
    for(i=2; i<=n; i++) {
        dp[i] = dp[i-1] + dp[i-2];
    }
    return dp[n];
}
```
