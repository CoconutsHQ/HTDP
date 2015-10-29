#lang racket
(require "../../bsl.rkt")

(define (string-last string)
  (string-ith string (- (string-length string) 1)))

(string-last "hello")

(define result (list string-last))
(provide result)

        