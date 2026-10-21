---
title: "C"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C"
draft: false
---

[問題文](/docs/練習問題#p5d7bfb2)

```
#include <stdio.h>
#include <math.h>

void f(double a, double b, double c) {
    double D, x1, x2;
    D = b*b - 4*a*c;
    if(D >= 0) {
        x1 = (fabs(b) + sqrt(D)) / (2. * a);
        x1 = b < 0 ? x1 : -x1;
        if(D > 0) {
            x2 = c / (a * x1);
            printf("%lf, %lf\n", x1, x2);
        } else {
            printf("%lf\n", x1);
        }
    }
}

int main(void) {
    f(0.0000000045, 10, 1);
    return 0;
}
```
