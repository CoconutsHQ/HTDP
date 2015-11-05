#lang racket

(define (test1 f)
  (and (string=? (f "hello" 0) "ello")
       (string=? (f "hello" 1) "hllo")
       (string=? (f "hello" 2) "helo")
       (string=? (f "hello" 3) "helo")
       (string=? (f "hello" 4) "hell")))


(define test (list test1))
(provide test)