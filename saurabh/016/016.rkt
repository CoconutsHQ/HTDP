#lang racket
(define (string-last a) (string-ith a (- (string-length a) 1)))
(string-last "braindamage")
(define result (list string-last))
(provide result)