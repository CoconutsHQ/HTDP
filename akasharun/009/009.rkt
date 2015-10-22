#lang racket

(define sunny #false)
(define friday #false)

(define result (or (not sunny) friday))
(provide result)