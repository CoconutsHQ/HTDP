#lang racket

;String->String
;Dilsplays the string with last character removed
;(string-remove-last "hello") => 'hell'

;Template
;(define (string-remove-last string)
;  (.....string.....))

(define (string-remove-last string)
  (substring string 0 (- (string-length string) 1)))

(define result (list string-remove-last))
(provide result)

