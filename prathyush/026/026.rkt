#lang racket

(define (bool-imply x y)
  (or (not x) y))

(bool-imply #true #false)