#lang racket

(define x 3)
(define y 4)
(define result
(sqrt (+ (* x x) (* y y))))

(provide result)