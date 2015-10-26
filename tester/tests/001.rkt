#lang racket

(define (test1 result)
  (= result 5))

(define test (list test1))

(provide test)