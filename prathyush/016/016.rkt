#lang racket

(define (string-last s)
  (substring s (- (string-length s) 1)))

(string-last "hello there.")

(define result (list string-last))
(provide result)
