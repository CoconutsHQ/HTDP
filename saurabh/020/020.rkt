#lang racket
(define (string-join prefix suffix) (string-append prefix "_" suffix))
(string-join "traffic" "jam")
(define result string-join)
(provide result)