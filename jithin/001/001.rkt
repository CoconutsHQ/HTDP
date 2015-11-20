#lang racket
(define x 4)
(define y 3)
(define result 
  (list(sqrt (+ (sqr x) (sqr y)))))
(provide result)