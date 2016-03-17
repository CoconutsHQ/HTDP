#lang racket
(define (bool-imply sunny friday)
   (or (not sunny) friday))

;Example:
(bool-imply #t #t)

(define result (list bool-imply))
(provide result)