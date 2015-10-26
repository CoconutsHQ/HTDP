#lang racket

(define (bool-imply sunny friday)
  (or (not sunny) friday))
(bool-imply #false #true)

(define result (list bool-imply))
(provide result)