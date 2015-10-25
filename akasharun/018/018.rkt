#lang racket

(require 2htdp/image)
(define (image-area image)
  (* (image-height image) (image-width image)))

(define result image-area)
(provide result)