#lang racket

(define (string-join string1 string2)
  (string-append string1 "_" string2))

(define result string-join)
(provide result)