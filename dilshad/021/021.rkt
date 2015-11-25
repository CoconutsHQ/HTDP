#lang racket
(define (string-insert string i)
     (string-append (substring string 0 i) "_" (substring string i)))

;Example
(string-insert "helloworld" 3)

(define result (list string-insert))
(provide result)