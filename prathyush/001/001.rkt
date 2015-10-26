#lang racket

(define x 3)
;(define x 5)

(define y 4)
;(define y 12)

(define result (list (sqrt (+ (* x x) (* y y)))))

(provide result)