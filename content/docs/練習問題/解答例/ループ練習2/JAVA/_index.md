---
title: "JAVA"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "JAVA"
draft: false
---

```
public class Hellows {
	public static void main(String[] args) {
		try {
			int j = Integer.parseInt(args[0]);
			for (int i = 0; i < j; i++) {
				System.out.println("Hello World! " + (i+1));
			}
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println(" java Hellows 1 のように実行してください");	
		}
	}
}
```
