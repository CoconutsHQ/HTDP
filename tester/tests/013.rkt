#lang racket

(define (test1 f)
  (and (= (f 3 4) 5)
       (= (f 5 12) 13)))

(define test (list test1))
 
(provide test)