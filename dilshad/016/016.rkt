#lang racket
(require "../../bsl.rkt")
(define (string-last string)
    (string-ith string (- (string-length string) 1)))
;Example :
(string-last "hello_world")

(define result (list string-last))
(provide result)