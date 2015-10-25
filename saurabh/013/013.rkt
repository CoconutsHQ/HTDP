#lang racket
(define (dist x y ) (sqrt (+ (* x x) (* y y))))


(dist 3 4)
(define result dist)
(provide result)