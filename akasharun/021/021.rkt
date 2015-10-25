#lang racket

(define (string-insert string i)
  (string-append (substring string 0 i) "_" (substring string i)))
(string-insert "hello" 2)

(define result string-insert)
(provide result)