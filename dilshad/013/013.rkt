#lang racket
(define (distance x y)
     (sqrt (+ (sqr x) (sqr y))))

;Example :
(distance 3 4)


(define result (list distance))
(provide result)
