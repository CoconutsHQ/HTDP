#lang racket

(define (cube-volume a)
  (* a a a))
(define (cube-surface a)
  (* 6 (sqr a)))

(define result (list cube-volume cube-surface))

(provide result)
