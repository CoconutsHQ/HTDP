#lang racket
(define x 3)
(define y 4)
(define result
  (list 
     (sqrt (+ (sqr x) (sqr y)))))

(provide result)
