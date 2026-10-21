---
title: "Java"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Java"
draft: false
---

[練習問題](/docs/練習問題)

繰り返し二乗法。


```
import java.math.*;

public class Main {
    private BigInteger pow(BigInteger val, int n) {
        BigInteger res = BigInteger.ONE;
        while(n > 0) {
            if((n & 1) == 1) { res = res.multiply(val); }
            val = val.multiply(val);
            n >>= 1;
        }
        return res;
    }

    private BigInteger pow(int a, int n) {
        return pow(BigInteger.valueOf(a), n);
    }
    
    private void doIt() {
        System.out.printf("%s\n", pow(2, 0));
        System.out.printf("%s\n", pow(2, 1));
        System.out.printf("%s\n", pow(2, 2));
        System.out.printf("%s\n", pow(2, 10));
        System.out.printf("%s\n", pow(2, 1024));
        System.out.printf("%s\n", pow(2, 1000007)); // 30秒ぐらい。
        System.out.printf("%s\n", BigInteger.valueOf(2).pow(1000007));  // これも30秒ぐらい。
    }

    public static void main(String[] args) { new Main().doIt(); }
}
```
