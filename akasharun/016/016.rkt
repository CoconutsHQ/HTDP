#lang racket

(define (string-last string)
  (string-ith string (- (string-length string) 1)))

(string-last "hello")

(define result string-last)
(provide result)

        