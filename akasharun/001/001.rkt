#lang racket

(define x 5)
(define y 12)
(define result
(sqrt (+ (* x x) (* y y))))

(provide result)