#lang racket

; Image -> Number
; Calculates the area of image
; (image-area (empty-scene 100 100)) => 10000

; Template
; (define (image-area image)
; (... image ...)

(require 2htdp/image)

(define (image-area image)
  (* (image-height image) (image-width image)))

(define result (list image-area))
(provide result)
