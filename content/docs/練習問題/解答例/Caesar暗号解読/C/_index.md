---
title: "C"
date: 2026-06-23T10:02:59+09:00
lastmod: 2026-06-23T10:02:59+09:00
slug: "C"
draft: false
---

- ソースコード


```
#include <stdio.h>
#include <string.h>
//シフトする順
unsigned char* table = "abcdefghijklmnopqrstuvwxyz .,-a";
//呼び出すごとにstrをシフト
void shift(char* str){
  int i;
  while(*str != '\0'){
	 for(i=0; i<30; i++){
		if(table[i] == *str){
			*str = table[i+1];
			break;
		}
	}
	str++;
  }
}
//hintの含まれる文字列に解読に成功するとシフト量を返す。-1は失敗
int decode(char* str, char* hint){
  int i;
  for(i=1; i<=29; i++){
	  shift(str);
	  if(strstr(str, hint) != NULL)
		return i;
  }
  return -1;
}

int main(){
  int i;
  unsigned char buf[] = 
	  "qdq-gi.q-a ziatmxxitmdqibtqi-ustbi "
	  "ri.qmoqrcxi.qbubu zir -ibtqi-qp-qaai "
	  "ripmymsqkir -ibtqi-qy dmxi ri.cnxuoi "
	  "rruoumxakir -ibtqiqzmobyqzbki-q.qmxi"
	  " -imyqzpyqzbi rixmeaki -puzmzoqai -i-"
	  "qscxmbu zaimzpir -i btq-iymbbq-a;iz -"
	  "iatmxximzgi.q-a zinqiuzimzgiemgipuao-u"
	  "yuzmbqpimsmuzabir -ia. za -uzsiacotim"
	  "i.qbubu zj";
  if((i = decode(buf, "person")) != -1)
	 printf("%s\nshit=%d\n", buf, i);
  else
	fprintf(stderr, "faild in decode.\n");
}

```

- 実行結果


```
$./a.out
every person shall have the right of peaceful petition
for the redress of damage, for the removal of public
officials, for the enactment,  repeal or amendment of laws,
ordinances or regulations and for other matters; nor shall
any person be in any way discriminated against for
sponsoring such  a petition.
shit=18
```
