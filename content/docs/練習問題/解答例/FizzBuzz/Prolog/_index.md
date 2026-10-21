---
title: "Prolog"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Prolog"
draft: false
---

```
%swi-prolog
fizzbuzz(N) :- fizzbuzz(N, 0).

fizzbuzz(N, M) :- 
       M < N, M1 is M+1,
       M1 mod 15 =:= 0,
       write('FizzBuzz '),
       fizzbuzz(N, M1).

fizzbuzz(N, M) :- 
       M < N, M1 is M+1,
       M1 mod 5 =:= 0,
       write('Buzz '),
       fizzbuzz(N, M1).

fizzbuzz(N, M) :- 
       M < N, M1 is M+1,
       M1 mod 3 =:= 0,
       write('Fizz '),
       fizzbuzz(N, M1).

fizzbuzz(N, M) :- 
       M < N, M1 is M+1,
       write(M1), write(' '),
       fizzbuzz(N, M1).

fizzbuzz(N, N).
```
