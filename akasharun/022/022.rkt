#lang racket

(define (string-delete string i)
  (string-append (substring string 0 i) (substring string (+ i 1))))

(define result (list string-delete))
(provide result)