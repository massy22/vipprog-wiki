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
  int y;
  while(1){
    printf("西暦 = ");
    scanf("%d", &y);
    if(y%4==0 && y%100!=0 || y%400==0)
      printf("%d年は閏年です\n", y);
    else
      printf("%d年は閏年ではありませぬ\n", y);
  }
}
```
