#lang racket
(require 2htdp/image)

(define in false)

(define result (list (if (string? in)
    (string-length in)
(if (image? in)
    (* (image-width in) (image-height in) )
(if (number? in)  
    (cond
      [(<= in 0) in]
      [(> in 1) (- in 1)])
(if (boolean? in)
    (cond
      [(eqv?  in #true) 10]
      [(eqv? in #false) 20]) 
     "invalid"))))
    ))

(provide result)