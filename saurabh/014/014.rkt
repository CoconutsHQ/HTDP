#lang racket
(define (cube-volume x) (* x x x))
(define (cube-surface x) (* 6 (* x x)))

(cube-volume 3)
(cube-surface 3)

(define result1 cube-volume)
(define result2 cube-surface)

(provide result1)
(provide result2)