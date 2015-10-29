#lang racket
(define x 3)
(define y 4)

(define result (list (sqrt (+ (* x x) (* y y)))))
(provide result)