#lang racket

(define (bool-imply sunny friday)
  (or (not sunny)
      friday))

(bool-imply #true #false)
(bool-imply #true #true)

(define result (list bool-imply))
(provide result)