#lang racket
(require "../../bsl.rkt")
; String -> String
; Displays first character of a string
; (string-first "hello") => 'h'
; (string-first "racket") => 'r'

; Template
; (define (string-first string)
;   (.....string....))

(define (string-first string)
   (string-ith string 0))
;Example :
(string-first "hello_world")

(define result (list string-first))
(provide result)