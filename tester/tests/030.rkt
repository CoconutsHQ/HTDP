#lang racket

(define (test1 val)
  (= 1064.1 val))

(define test (list test1))
(provide test)