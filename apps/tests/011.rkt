#lang racket

(define (test1 result)
  (= result 20))

(define test (list test1))

(provide test)