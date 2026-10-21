---
title: "Java"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Java"
draft: false
---

[練習問題](/docs/練習問題)


```
import java.math.*;

public class Main {
    private BigInteger pow(int a, int n) {
        BigInteger res = BigInteger.ONE;
        BigInteger val = BigInteger.valueOf(a);
        for(int i=0; i<n; i++) {
            res = res.multiply(val);
        }
        return res;
    }
    
    private void doIt() {
        System.out.printf("%s\n", pow(2, 0));
        System.out.printf("%s\n", pow(2, 1));
        System.out.printf("%s\n", pow(2, 2));
        System.out.printf("%s\n", pow(2, 10));
        System.out.printf("%s\n", pow(2, 1024));
        System.out.printf("%s\n", pow(2, 1000007)); // 遅い。3分経っても終わらなかった。
    }

    public static void main(String[] args) { new Main().doIt(); }
}
```
