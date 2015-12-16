#lang racket
(define (bool-imply sunny friday)
  (or (not sunny) friday))
(define result (list bool-imply))
(provide result)