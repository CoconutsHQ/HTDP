#lang racket

(define (test1 val)
  (equal? 1064.1 val))

(define test (list test1))
(provide test)