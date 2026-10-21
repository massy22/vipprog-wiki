---
title: "C"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C"
draft: false
---

```
#include<stdio.h>

int preme_check(int num)
{
  int i;

  if( num<2 ) return 0;
  if( num==2 ) return 1;
  if( !( num%2 )) return 0;

  for ( i=3; i*i<=num; i+=2) {
    if( !(num%i))return 0;
  }
 return 1;
}

int main()
{
  int num;

  puts("数値を入力してください");
  scanf("%d",&num);

  if(preme_check(num)){
    puts("素数です");
  }
  else puts("素数ではありません");

  return 0;
}
```
