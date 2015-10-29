#lang racket

(define clarity 5)

;; eqv? is used instead of
;; boolean=?. boolean=? ensures
;; that the input is boolean.
(define simplicity 1)
(define cleverness 0)
(define feel 2)
(define marks (+ clarity simplicity cleverness feel))

(provide marks)
