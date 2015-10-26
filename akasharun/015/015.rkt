#lang racket

(define (string-first string)
  (string-ith string 0))

(string-first "hello")
(define result (list string-first))
(provide result)