#lang racket
(define(result x y)(list(sqrt(+ (sqr x) (sqr y)))))
(provide result)