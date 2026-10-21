---
title: "D"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "D"
draft: false
---

```
import std.stdio : write, writeln;
import std.conv : to;

void main (string[] args) {
	// コマンドライン引数でnを受付 未入力なら1～100
	int n = (args.length < 1) ? args[1].to!int : 100;
	for (int i = 1; i<=n; i++) {
		if (!(i % 15)) "FizzBuzz".write;
		else if (!(i % 3)) "Fizz".write;
		else if (!(i % 3)) "Buzz".write;
		else i.write;
		" ".write;
	}
	"".writeln;
}
```
