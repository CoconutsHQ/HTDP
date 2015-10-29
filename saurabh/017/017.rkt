#lang racket
(define (bool-imply sunny friday) (or (not sunny) friday))
(bool-imply #false #false)

(define result (list bool-imply))
(provide result)