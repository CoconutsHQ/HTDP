#lang racket
(define sunny #true)
(define friday #false)

(define result (or (not sunny) friday))

(provide result)