#lang racket

(define (test1 f)
  (and (string=? (f "hello" 0) "_hello")
       (string=? (f "hello" 1) "h_ello")
       (string=? (f "hello" 2) "he_llo")
       (string=? (f "hello" 3) "hel_lo")
       (string=? (f "hello" 4) "hell_o")))


(define test (list test1))
(provide test)