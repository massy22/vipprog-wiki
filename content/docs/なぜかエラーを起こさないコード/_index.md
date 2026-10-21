---
title: "なぜかエラーを起こさないコード"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "なぜかエラーを起こさないコード"
draft: false
---

# なぜかエラーを起こさないコード {#rc76833b}
[プログラミングスレまとめ in VIP](/docs/プログラミングスレまとめ-in-VIP)

<br />

## C言語編 {#j7c6f608}

### printfにNULLポインタのみを渡す {#m92ef29b}


```
#include<stdio.h>

int main(int argc, char *argv[])
{
  printf((char *)0);
  return 0;
}
```


```
codepad.orgで動かしてみたところエラーなしという結果に。
```


<br />
