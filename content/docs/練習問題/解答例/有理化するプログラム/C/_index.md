---
title: "C"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C"
draft: false
---

[練習問題](/docs/練習問題)


```
#include <stdio.h>
void yurika(int , int );
int main()
{
	int a, b; 
	for (a = 1; a < 101; a++)
		for (b = 1; b < 101; b++)
			yurika(a,b); 			
	return 0;
}

void yurika(int a, int b)
{
	int a1, a2, i; 
	printf("√%2d / √%2d ＝ ", a, b); 
	if (a == b) { printf("1\n"); return; } 
	if (a % b == 0) { a = a / b;  b = 1; }
	else	a = a * b; 
	for (i = 1; i*i <= a; i++)
		if (a % (i*i) == 0) { a1 = i; a2 = a / (i*i); } 
	for (i = 1; i < 15; i++)
		if (a1 % i == 0 && b % i == 0) { a1 = a1 / i; b = b / i; } 
	if (a1 == 1 && b == 1) { printf("√%d\n", a2); return;	} 
	else if (a2 == 1 && b == 1) { printf("%d\n", a1); return; } 
	else if (b == 1) { printf("%d√%d\n", a1, a2); return;	} 
	else if (a2 == 1) { printf("%d / %d\n", a1, b); return; } 
	else if (a1 == 1) { printf("√%d / %d\n", a2, b); return; } 
	else printf("%d√%d / %d\n", a1, a2, b);
	return;
}
```


以下、解説付き


```

// √a / √b を有理化するプログラム
// 有理化の例：√1 / √2 ＝ √2 / 2

#include <stdio.h>
int yrk(int , int );     // √引数 / √引数　を有理化する関数
 
int main()
{
    int k = 20;    // √1 / √1　から　√k / √k まで調べる
     int a, b;      // √a / √b

    for (a = 1; a < (k+1); a++)
        for (b = 1; b < (k+1); b++)
            yrk(a,b);           // √a / √b　を有理化する関数

    return 0;
}

int yrk(int a, int b)      // √a / √b　を有理化する関数
{
    int a1, a2;            // √a => a1√a2
    int i;

    printf("√%2d ÷ √%2d ＝", a, b);

    if (a == b) {          // √3 / √3 => 1
        printf("     1\n");
        return 0; }

    if (a % b == 0) {      // √8 / √2 => √4 / 1
        a = a / b;
        b = 1; }
    else
        a = a * b;         // √8 / √6 => √48 / 6

    for (i = 1; i*i <= a; i++)
        if (a % (i*i) == 0) {      // √48 => 4√3
            a1 = i;
            a2 = a / (i*i); }
    for (i = 1; i < 15; i++)
        if (a1 % i == 0 && b % i == 0) {        // 3√5 / 18 => 1√5 / 6
            a1 = a1 / i;
            b  = b  / i; }

    // ---------------- //
    // 以下、答えの出力 //
    // ---------------- //

    if (a1 == 1 && b == 1) {
        printf("  √%2d\n", a2);             //  1√3 / 1  =>  √3
        return 0; }
    else if (a2 == 1 && b == 1) {
        printf("    %2d\n", a1);            //  5√1 / 1  =>  5
        return 0; }
    else if (b == 1) {
        printf("%2d√%2d\n", a1, a2);        //  3√7 / 1  =>  3√7
        return 0; }
    else if (a2 == 1) {
        printf("    %2d / %2d\n", a1, b);   //  2√1 / 5  =>  2 / 5
        return 0; }
    else if (a1 == 1) {
        printf("  √%2d / %2d\n", a2, b);    //  1√31 / 9  =>  √31 / 9
        return 0; }
    else
        printf("%2d√%2d / %2d\n", a1, a2, b);     //  4√6 / 7

    return 0;
}
```
