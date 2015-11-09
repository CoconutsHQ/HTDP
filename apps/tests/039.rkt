#lang racket

(define (test1 f)
  (and (string=? (f "hello") "ello")
  (string=? (f "there") "here")
  (string=? (f ".mukaala mukaabula o laila o laila") "mukaala mukaabula o laila o laila")))


(define test (list test1))
(provide test)