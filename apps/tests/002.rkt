#lang racket

(define (test1 result)
  (string=? result "hello_world"))

(define test (list test1))

(provide test)