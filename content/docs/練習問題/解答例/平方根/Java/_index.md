---
title: "Java"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Java"
draft: false
---

[問題文](/docs/練習問題#y8402045)

```
import java.util.*;

public class Main {
    private Scanner sc;
    private Main() { this.sc = new Scanner(System.in); }
    private void doIt() {
        System.out.printf("Input a number: ");
        double d = sc.nextDouble();
        double res = d;
        for(int i=0; i<100; i++) {
            res = (res + d / res) / 2;
        }
        System.out.printf("%.15f\n", res);
    }

    public static void main(String[] args) { new Main().doIt(); }
}
```
