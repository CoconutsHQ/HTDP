#lang racket
(define (string-join prefix suffix) (string-append prefix "_" suffix))
(string-join "traffic" "jam")
(define result (list string-join))
(provide result)