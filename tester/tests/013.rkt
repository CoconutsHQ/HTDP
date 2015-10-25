#lang racket

(define (test13 f)
  (and (= (f 3 4) 5)
       (= (f 5 12) 13)))
 
(provide test13)