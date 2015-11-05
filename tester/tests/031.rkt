#lang racket

(define (test1 f)
  (and (= (f 1)
-360.0)
(= (f 2) 285.0)
(= (f 3) 630.0)
(= (f 4) 675.0)
(= (f 5) 420.0)))

(define test (list test1))
(provide test)