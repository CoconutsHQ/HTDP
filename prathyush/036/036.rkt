#lang racket

; String -> String

; Calculates the first character of string.
; (string-first "hello") => "h"
; (string-first "orange") => "o"

; Template
; (define (string-first s)
; (... s ...))

(define (string-first s)
(substring s 0 1))

(define result (list string-first))
(provide result)
