---
title: "lisp"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "lisp"
draft: false
---

```
(defun FizzBuzz (n)
  (if (> n 0)
      (progn
        (print (FizzBuzz (- n 1)))
        (if (= (mod n 15) 0)
            'FizzBuzz
          (if (= (mod n 5) 0)
              'Buzz
            (if (= (mod n 3) 0)
                'Fizz
              n))))
    0))
```
