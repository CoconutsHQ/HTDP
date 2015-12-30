#lang racket

;String->String
;Displays the string with first character removed
;(string-rest "hello") => 'ello'

;Template
;(define (string-rest string)
;  (.....string.....))

(define (string-rest string)
  (substring string 1))

(define result (list string-rest))
(provide result)