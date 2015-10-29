#lang racket

(define clarity 5)

;; substring doesn't necessarily require
;; string-length calculation.
(define simplicity 1)
(define cleverness 0)
(define feel 2)
(define marks (+ clarity simplicity cleverness feel))

(provide marks)
