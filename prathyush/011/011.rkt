#lang racket

(require 2htdp/image)

(define in false)

(define result (list (if (string? in)
    (string-length in)
    (if (image? in)
        (* (image-width in)
           (image-height in))
        (if (number? in)
         (if (<= in 0) in
             (- in 1))
         (if in 10 20))))))

(provide result)