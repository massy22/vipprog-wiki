---
title: "C"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C"
draft: false
---

```
#include<stdio.h>
#define LIMIT 1000


void print_preme(int n)
{
  int Mark[LIMIT], i, j; 

  /*1をセット*/
  for ( i = 0 ; i < n ; i++ ) Mark[i] = 1;

  Mark[0] = Mark[1] = 0;

  /*倍数をふるい落とす*/
  for ( i=2; i<n; i++) {
    if( Mark[i] ) {
      for ( j=i*2; j<n; j+=i) Mark[j] = 0;
    }
  }

  /*残ったものを表示*/
  for ( i=0; i<n; i++) {
    if (Mark[i]) {
    printf("%d\n",i);
    }
  }
}


int main()
{
  int n;

  while(1){
    puts("入力してください");
    scanf("%d",&n);

    if( n > LIMIT)puts("数値が大きすぎます");
    else break;
  }

  print_preme(n);
  return 0;
}
```
