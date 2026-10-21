---
title: "Scheme"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Scheme"
draft: false
---

[練習問題/解答例/うるう年測定/Scheme](/docs/練習問題/解答例/うるう年測定/Scheme)

```

;;割り切れるかどうかを判別
(define (divisible? a b)
 (zero? (modulo a b)))
;;閏年判定
(define (intercalary? year)
 (if (divisible? year 100)
     (if (divisible? year 400)
	  #t
	  #f)
     (if (divisible? year 4)
	  #t
	  #f)))
```
