#lang racket
(define sunny #true)
(define friday #true)

(define result (or (not sunny) friday))
(provide result)