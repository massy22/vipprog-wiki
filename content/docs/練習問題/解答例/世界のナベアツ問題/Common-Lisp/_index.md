---
title: "Common Lisp"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Common-Lisp"
draft: false
---

## Common Lisp {#a7e1f7f2}

```
;; ユーティリティ
(defun find-num (x num)
  (unless (zerop num)
    (if (= (mod num 10) x)
	t
	(find-num x (truncate num 10)))))

(defun divisible-p (num div)
  (zerop (mod num div)))

(defun say (x)
  (format t "~a~%" x))

(defun make-cycle (lst)
  (let ((backup-list (copy-list lst)))
    #'(lambda ()
	(or (pop lst)
	    (and (setq lst backup-list) nil)))))

;; ここからナベアツ部分
(defun aho-p (n)
  (or (divisible-p n 3)
      (find-num 3 n)))

(defun make-nabeatsu (max)
  (loop for n from 1 to max
     collect (if (aho-p n) 'aho n)))

(defun make-nabeatsu-closure (max)
  (make-cycle (make-nabeatsu max)))

(defun nabeatsu (max)
  (let ((c (make-nabeatsu-closure max)))
    (loop (let ((x (funcall c)))
	    (if x (say x) (return))))))
```
