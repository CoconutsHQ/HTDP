#lang racket

(define sunny #true)

(define friday #false)

(define result (list (or (not sunny) friday)))

(provide result)

;; 4 combinations
;; t f
;; t t
;; f t
;; f f
