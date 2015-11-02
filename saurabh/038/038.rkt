
#lang racket
; image->number

; counts the number of pixels in the given image

 (check-expect (image-area (square 20 "solid" "red")) 400 )
 (check-expect (image-area "") "")

; (define (image-area img) (... s ...)

(require 2htdp/image)

(define (image-area img) (* (image-height img) (image-width img)))
