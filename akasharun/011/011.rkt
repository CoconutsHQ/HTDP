#lang racket

(require 2htdp/image)
(define in "hello")

(define result (if (string? in)
    (string-length in)
    (if (image? in)
        (* (image-height in) (image-width in))
        (if (number? in)
            (if (<= in 0)
                in
                (- in 1))
            (if (boolean=? in #true) 
                   10
                   20)))))
(provide result)
 

            
         
               

     
    