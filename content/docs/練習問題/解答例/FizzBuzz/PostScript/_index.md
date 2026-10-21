---
title: "PostScript"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "PostScript"
draft: false
---

```
%!

/N 100 def % 繰り返しの回数

1 1 N {
   dup 15 mod 0 eq {(FizzBuzz)}
   {dup 5 mod 0 eq {(Buzz)}
   {dup 3 mod 0 eq {(Fizz)} if} ifelse} ifelse
   =
   clear
} for
```
