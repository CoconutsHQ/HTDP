#lang racket
(define (string-first a) (string-ith a 0 ))
(string-first "confused")
(define result (list string-first))

(provide result)