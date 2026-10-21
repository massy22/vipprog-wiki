---
title: "C"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C"
draft: false
---

```
#include <stdio.h>
#include <stdlib.h>

int fib(int n);

int main (int argc, char **argv) {
       int n;
       if (argc < 2)
               return 1;
       n = atoi(argv[1]);
       if (n < 1)
               return 1;
       printf("%d\n", fib(n));
       return 0;
}

int fib(int n) {
       if (n == 1 | n == 2)
               return 1;
       return fib(n-1) + fib(n-2);
}
```
