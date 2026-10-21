---
title: "複製"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "複製"
draft: false
---

```
;;math.mt-random(メルセンヌツイスタを使うためのモジュール)
(use math.mt-random)
;;メルセンヌツイスタを作成
(define m (make <mersenne-twisster> :seed (sys-time)))
(define (main args)
   (let ((answer (mt-random-integer m 50)))
     (letrec ((game (lambda ()
		       (let ((n (read)))
			 (cond ((equal? answer n) #t)
			       ((> answer n) (display "小さいです。") (newline) (game))
			       ((< answer n) (display "大きいです。") (newline) (game)))))))
	(game))))
```
