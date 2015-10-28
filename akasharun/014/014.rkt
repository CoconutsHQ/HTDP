#lang racket

(define (cube-volume a)
  (* a a a))
(define (cube-surface a)
  (* 6 (sqr a)))

(define result1 cube-volume)
(define result2 cube-surface)

(provide (list result1 result2))
