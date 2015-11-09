#lang racket

(define (test1 f)
  (and (string=? (f "hello") "hell")
  (string=? (f "there") "ther")
  (string=? (f ".mukaala mukaabula o laila o laila") ".mukaala mukaabula o laila o lail")))


(define test (list test1))
(provide test)