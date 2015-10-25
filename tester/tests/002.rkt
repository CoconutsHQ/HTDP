#lang racket

(define (test result)
  (string=? result "hello_world"))

(provide test)