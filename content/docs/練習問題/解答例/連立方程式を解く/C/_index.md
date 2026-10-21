---
title: "C"
date: 2026-07-02T15:14:43+09:00
lastmod: 2026-07-02T15:14:43+09:00
slug: "C"
draft: false
---

[練習問題](/docs/練習問題)

2元の場合に限定した実装なので解答にはなっていない。

```
// 連立方程式を自動で作成し、そのまま自動で解くプログラム

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void main()
{
    double a[6];
	
    double x1, x2, x;
    double y1, y2, y;
    double z1, z2;
    int i;
    srand(time(NULL));

    while (1) {
	
        for (i = 0; i < 6; i++) {
             a[i] = (rand() % 40) + 1;
             if (a[i] > 20)
                 a[i] -= 41;  }

     x1 = a[0];   y1 = a[1];   z1 = a[2];   x2 = a[3];   y2 = a[4];   z2 = a[5];

     printf("\n%3dx + %3dy = %3d", (int)x1, (int)y1, (int)z1);
     printf("\n%3dx + %3dy = %3d", (int)x2, (int)y2, (int)z2);

     x = (z1 - (y1/y2)*z2)/(x1 - (y1/y2)*x2);
     y = (z1 - (x1*x)) / y1;

     printf("\n\nx = %6.3f   y = %6.3f    キー入力(0で終了) --- ", x, y);
     scanf("%d", &i);
     if (i == 0) break; }
}
```
