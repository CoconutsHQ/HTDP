#lang racket

(define (test1 f)
  (and
   (f #true #true)
   (f #false #false)
   (f #false #true)
   (not (f #true #false))))

(define test (list test1))
(provide test)