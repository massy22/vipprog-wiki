---
title: "C++"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C--"
draft: false
---

[問題文](/docs/練習問題#s98f80e0)<br />
Linuxのg++ 4.6.3で確認。

```
#include <iostream>
#include <cstdlib>
#include <clocale>
#include <ctime>
using namespace std;

int main(void) {
    setlocale(LC_ALL, "ja_JP.UTF-8");
    srand(time(NULL));
    const wchar_t s[] = L"あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよわをん";
    int sz = sizeof(s) / sizeof(s[0]) - 1;
    for(int i=0; i<100; i++) {
        wcout << s[rand()%sz] << s[rand()%sz] << endl;
    }
    return 0;
}
```
