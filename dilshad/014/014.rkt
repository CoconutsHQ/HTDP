#lang racket
(define (cube-volume x)
          (* x x x))
(define (cube-surfacearea x)
          (* (* x x) 6))
;Example
(cube-volume 3)
(cube-surfacearea 3)


(define result
     (list cube-volume cube-surfacearea))

(provide result)