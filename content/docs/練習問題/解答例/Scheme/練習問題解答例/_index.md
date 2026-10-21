---
title: "練習問題解答例"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "練習問題解答例"
draft: false
---

# ループ1 {#i29c71f8}

```
(for-each print
          (map
            (lambda (_) "Hello World!")
            (iota 5)))
```


# ループ2 {#s4350f12}

```
(define (foo n)
  (for-each print
            (map
              (lambda (i)
                (format #f "~a ~d" "Hello World!" (+ i 1)))
              (iota n))))
(define (main args)
  (foo (string->number (list-ref args 1))))
```


# FizzBuzz {#l501edf8}

```
(print
  (string-join
    (map
      (lambda (x)
        (cond
          ((zero? (modulo x 15)) "FizzBuzz")
          ((zero? (modulo x  5)) "Buzz")
          ((zero? (modulo x  3)) "Fizz")
          (else (format #f "~d" x))))
      (iota 100 1))))
```


# 素数判定 {#jd32f6c4}

```
(define (check-prime n d)
  (if (> d (sqrt n))
    #t
    (if (zero? (modulo n d))
      #f
      (check-prime n (+ d 1)))))
(define (is-prime? n)
  (if (< n 2)
    #f
    (check-prime n 2)))
(define prime?
  (lambda (n)
    (if (is-prime? n)
      (print (format #f "~dは素数です。" n))
      (print (format #f "~dは素数ではありません。" n)))))
(prime? 1)
(prime? 2)
(prime? 3)
(prime? 4)
(prime? 5)
(prime? 997)
(prime? 998)
(prime? 15485863)
(prime? 122949823)
(prime? 674506081)
(prime? 982451653)
```


# うるう年判定 {#l746f1d2}

```
(define (is-leap-year? n)
  (cond
    ((zero? (modulo n 400)) #t)
    ((zero? (modulo n 100)) #f)
    ((zero? (modulo n   4)) #t)
    (else                   #f)))
(define (leap-year? n)
  (if (is-leap-year? n)
    (print (format #f "~d年はうるう年です。" n))
    (print (format #f "~d年はうるう年ではありません。" n))))
(leap-year? 1992)
(leap-year? 2000)
(leap-year? 2001)
```


# 累乗1 {#ybfcac36}

```
(define pow
  (lambda (a n)
    (if (zero? n)
      1
      (* a (pow a (- n 1))))))
(print (pow 2 10))
```


# フィボナッチ数列 {#l1f0f136}

```
(define fib-kernel
  (lambda (current next remaining)
    (if (zero? remaining)
      current
      (fib-kernel next (+ current next) (- remaining 1)))))
(define fib
  (lambda (n)
    (fib-kernel 1 1 (- n 1))))
(define (main args)
  (print (fib (string->number (list-ref args 1)))))
```
