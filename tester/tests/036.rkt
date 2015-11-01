#lang racket

(define (test1 f)
  (and (string=? (f "hello") "h")
  (string=? (f "there") "t")
  (string=? (f ".mukaala mukaabula o laila o laila") ".")))


(define test (list test1))
(provide test)
