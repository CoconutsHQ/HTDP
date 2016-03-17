#lang racket
;Image->number
;Calculates the area of the image
;(image-area (image-area (square 10 "solid" "black")) => 100

;Template
;(define (image-area image)
; (......image......))

(require 2htdp/image)

(define (image-area image)
          (* (image-height image) (image-width image)))

(define result (list image-area))
(provide result)