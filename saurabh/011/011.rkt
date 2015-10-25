#lang racket
(define in false)

(define result (if (string? in)
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
    )
(provide result)