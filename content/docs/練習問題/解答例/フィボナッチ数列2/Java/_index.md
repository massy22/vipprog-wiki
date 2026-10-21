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

class Fibonacci {
    private Fibonacci() {}
    public static BigInteger calc(int n) {
        BigInteger[] dp = new BigInteger[n+1];
        dp[0] = dp[1] = BigInteger.ONE;
        for(int i=2; i<n; i++) {
            dp[i] = dp[i-2].add(dp[i-1]);
        }
        return dp[n-1];
    }
}

public class Main {
    private void doIt(int n) {
        System.out.printf("%d: %s\n", n, Fibonacci.calc(n));
    }

    public static void main(String[] args) {
        new Main().doIt(Integer.parseInt(args[0]));
    }
}
```
