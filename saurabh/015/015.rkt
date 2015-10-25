#lang racket
(define (string-first a) (string-ith a 0 ))
(string-first "confused")
(define result string-first)
(provide result)