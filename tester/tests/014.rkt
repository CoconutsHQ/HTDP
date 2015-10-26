#lang racket

(define (test1 f)
  (and (= (f 0) 0)
  (= (f 1) 1)
  (= (f 3) 27)))

(define (test2 f)
  (and (= (f 0) 0)
       (= (f 1) 6)
       (= (f 3) 54)))

(define test (list test1 test2))
(provide test)