---
title: "C"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C"
draft: false
---

```
#include<stdio.h>

long f(int y, int m, int d){
  if(m<3){
    y--;
    m+=12;
  }
  return 365*y+y/4-y/100+y/400+306*(m+1)/10-428+d;
}

void main(){
  int y, m, i;
  while(1){
    printf("年 = ");
    scanf("%d", &y);
    printf("月 = ");
    scanf("%d", &m);
    printf("\n日 月 火 水 木 金 土");
    for(i=1-f(y, m, 1)%7; i<=f(y, m+1, 1)-f(y, m, 1); i++){
      if(f(y, m, i)%7==0)
        printf("\n");
      if(i<1)
        printf("   ");
      else
        printf("%2d ", i);
    }
    printf("\n\n");
  }
}
```
