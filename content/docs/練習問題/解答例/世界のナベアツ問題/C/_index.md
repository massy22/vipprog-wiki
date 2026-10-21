---
title: "C"
date: 2026-07-22T05:41:00+09:00
lastmod: 2026-07-22T05:41:00+09:00
slug: "C"
draft: false
---

## C言語 {#top}

```c
#include <stdio.h>
#define MAX 41

/* 判定 */
int judge(const int x){
  int i;
  if(x % 3 == 0)
    return 1;

  for(i=x; i; i /= 10)
    if(i % 10 == 3)
      return 1;
  
  return -1;
}

int main(){
  int i;
  for(i=1; i <= MAX; i++){
    if(judge(i) == -1)
      printf("%d\n", i);
    else
      printf("Aho\n");
  }

  return 0;
}
```
