#lang racket
(define sunny #true)
(define friday #true)

(define result (list (or (not sunny) friday)))
(provide result)