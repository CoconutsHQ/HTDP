#lang racket
(require "../../bsl.rkt")

; String -> String
; Displays last character of a string
; (string-last "hello") => 'o'
; (string-last "racket") => 't'

; Template
; (define (string-last string)
;   (.....string....))
(define (string-last string)
    (string-ith string (- (string-length string) 1)))
;Example :
(string-last "hello_world")

(define result (list string-last))
(provide result)