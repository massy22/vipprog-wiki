---
title: "C言語"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C言語"
draft: false
---

### 平方根 {#za2487f5}

```
#include<stdio.h>
main(i){
	float x2;//x2の平方根xを求める。
	float x=x2;
	for(;i<100;i++)
		x=(x+x2/x)/2.0;
	printf("%f", x);
}
```
