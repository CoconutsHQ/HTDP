#lang racket

(require 2htdp/image)
(define (image-classify image)
  (if (< (image-height image) (image-width image))
    "wide"
    (if (> (image-height image) (image-width image))
        "tall"
        "square")))

(define result image-classify)
(provide result)
  

