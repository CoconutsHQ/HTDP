#lang racket

(define (image-area img)
  (* (image-width img)
     (image-height img)))

(define result (list image-area))
(provide result)

