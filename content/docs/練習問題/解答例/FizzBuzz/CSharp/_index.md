---
title: "CSharp"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "CSharp"
draft: false
---

```
using System;
using System.Collections.Generic;
using System.Linq;

namespace FizzBuzz
{
    static class Program
    {
        static IEnumerable<string> FizzBuzz()
        {
            for (var i = 1; ; i++)
            {
                var result = "";
                if ( i % 3 == 0 ) result += "Fizz";
                if ( i % 5 == 0 ) result += "Buzz";
                yield return result == "" ? i.ToString() : result;
            }
        } 

        static void Main(string[] args)
        {
            foreach ( var s in FizzBuzz().Take(100) )
            {
                Console.WriteLine(s);                
            }
        }
    }
}
```


短くしてみた

```
using System;
using System.Collections.Generic;
using System.Linq;

namespace FizzBuzz
{
    static class Program
    {
        static void Main(string[] args)
        {
            var filter = new Dictionary<int,string>() {{3, "Fizz"}, {5, "Buzz"}};
            Enumerable.Range(1, 100).Select(i => filter.Where(kv => (i % kv.Key) == 0)
                .Aggregate("", (s, kv) => s += kv.Value, s => s == "" ? i.ToString() : s))
                .ToList().ForEach(Console.WriteLine);
        }        
    }
}
```
