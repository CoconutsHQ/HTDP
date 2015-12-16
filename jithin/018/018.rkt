#lang racket
(require 2htdp/image)
(define (image-area x)
  (* (image-height x) (image-width x)))
(define result (list image-area))
(provide result)