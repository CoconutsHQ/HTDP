#lang racket

(require "status.rkt")

(define (ignore n)
  (if (member n (list 5 6 7 8 10)) #true
      #false))

(define (test-file exercise)
  (string-append "tests/" (pad3 (number->string exercise)) ".rkt"))

(define (import-test exercise)
  (dynamic-require (test-file exercise) 'test (lambda () 'no-test)))

