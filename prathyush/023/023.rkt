#lang racket

(define (ff a) (* 10 a))

(+ (ff 10) (ff 10))

;; No Racket doesn't reuse evaluations.