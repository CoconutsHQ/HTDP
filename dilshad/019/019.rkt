#lang racket
(require 2htdp/image)

(define (image-classify image)
   (if (> (image-height image) (image-width image)) "tall"
            (if (< (image-height image) (image-width image)) "wide" "square")))

;Example :
(image-classify (square 10 "solid" "black"))

(define result (list image-classify))
(provide result)