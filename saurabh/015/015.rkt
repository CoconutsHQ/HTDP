#lang racket
(define (string-first a) (substring a 0 1))
(string-first "confused")
(define result string-first)
(provide result)