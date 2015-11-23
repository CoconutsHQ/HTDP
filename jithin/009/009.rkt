#lang racket
(define sunny #true)
(define friday #false)
 (define result(list(or (not sunny)  friday )))
(provide result)