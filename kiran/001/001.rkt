#lang racket
(define x 6)
(define y 8)

(define result 
(list
      (sqrt (+ (* x x ) (* y y ))) ))

(provide result)
  