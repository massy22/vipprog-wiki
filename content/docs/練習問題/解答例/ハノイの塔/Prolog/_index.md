---
title: "Prolog"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Prolog"
draft: false
---

```
hanoi(N, I) :- 
       move(N, a, b, c, I).
move(N, A, B, C, I) :-
       N > 1, N1 is N-1,
       move(N1, A, C, B, I1),
       move(1,  A, B, C, 1),
       move(N1, C, B, A, I2),
       I is I1 + I2 + 1.
move(1, A, B, _, 1) :-
       write(A),write(' to '),write(B),nl.
```
