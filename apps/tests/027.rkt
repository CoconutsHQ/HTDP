#lang racket

(require 2htdp/image)

(define (test1 f)
  (and (string=? (f (circle 3 "solid" "red")) "square")
       (string=? (f (rectangle 30 40 "solid" "blue")) "tall")
       (string=? (f (rectangle 100 20 "solid" "yellow")) "wide")))

(define test (list test1))
(provide test)