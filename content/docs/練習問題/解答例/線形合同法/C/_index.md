---
title: "C"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C"
draft: false
---

```
#include<stdio.h>

void main(){
  long m=65536, a=997, b=1, x=12345, sum=0, i;
  for(i = 0; i < 100; i++){
    x=(a * x + b)%m;
    sum += x;
    printf("%1.4f ", (float)x / m);
    if(i % 10 == 9)
      printf("\n");
  }

  printf("\n平均=%1.4f\n", (float)sum / m / i);
}
```
