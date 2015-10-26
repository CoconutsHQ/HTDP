#lang racket

(require 2htdp/image)
(define (image-area image)
  (* (image-height image) (image-width image)))

(define result (list image-area))
(provide result)