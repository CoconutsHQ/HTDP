#lang racket

(define (distance x y)
  (sqrt (+ (* x x)
           (* y y))))

(distance 3 4)
;; => 5

(distance 12 5)
;; => 13

(define result (list distance))
(provide result)