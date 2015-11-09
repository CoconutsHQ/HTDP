#lang racket

(require 2htdp/image)
(require test-engine/racket-gui)

; Image -> Number
; Calculates the rectangular area
; of a given image.

(check-expect (image-area (circle 3 "solid" "blue")) 36)
(check-expect (image-area (rectangle 20 40 "solid" "red")) 800)

(define (image-area a)
  (* (image-width a)
     (image-height a)))

(test)