#lang racket
(require 2htdp/image)
(define (image-classify img)
  (cond
    [(> (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(< (image-height img) (image-width img)) "wide"]))

(image-classify (circle 3 "solid" "red"))
(define result (list image-classify))
(provide result)