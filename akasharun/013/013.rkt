#lang racket

(define (distance-point x y)
  (sqrt (+ (sqr x) (sqr y))))
(define result distance-point)

(provide result)

