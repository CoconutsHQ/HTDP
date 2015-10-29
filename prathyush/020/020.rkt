#lang racket

(define (string-join s1 s2)
  (string-append s1 "_" s2))

(string-join "hello" "world")

(define result (list string-join))
(provide result)
