#lang racket

(define (test1 f)
  (and 
   (equal? (f "hello" "world") "hello_world")
   (equal? (f "t" "h") "t_h")
   (equal? (f "_" "_") "___")))


(define test (list test1))
(provide test)