#lang racket

(define (test1 result)
  (equal? result #false))

(define test (list test1))

(provide test)