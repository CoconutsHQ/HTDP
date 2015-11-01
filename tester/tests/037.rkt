#lang racket

(define (test1 f)
  (and (string=? (f "hello") "o")
  (string=? (f "there") "e")
  (string=? (f ".mukaala mukaabula o laila o laila") "a")))


(define test (list test1))
(provide test)