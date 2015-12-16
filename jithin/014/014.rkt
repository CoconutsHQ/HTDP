#lang racket
(define (cube-volume x)(* x x x))
(define (cube-surface y)(* 6 y y))
(provide cube-volume)