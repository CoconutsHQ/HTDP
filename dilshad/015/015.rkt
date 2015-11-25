#lang racket
(require "../../bsl.rkt")
(define (string-first string)
   (string-ith string 0))
;Example :
(string-first "hello_world")

(define result (list string-first))
(provide result)