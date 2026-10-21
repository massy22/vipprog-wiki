---
title: "CSharp"
date: 2026-04-23T00:28:46+09:00
lastmod: 2026-04-23T00:28:46+09:00
slug: "CSharp"
draft: false
---

```
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SosuHantei
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var input = int.Parse(Console.ReadLine());

            var ans = SosuHantei(input);

            Console.WriteLine(ans ? "素数" : "素数ではない");
        }

        /// <summary>
        /// 素数かどうかを検証します
        /// </summary>
        /// <param name="n"></param>
        static bool SosuHantei(int n)
        {
            if(n <= 1) {  return false; }

            for (var i = 2; i * i <= n; i++)
            {
                if (n % i == 0)
                {
                    return false;
                }
            }

            return true;
        }
    }
}
```
