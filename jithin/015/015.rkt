#lang racket
(require "../../bsl.rkt")

(define (string-first  x)
         (string-ith x 0))
(define result (list string-first))
(provide result)
 
