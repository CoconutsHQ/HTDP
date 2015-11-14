#lang racket

; String -> String
; Shows the first character of string
; (string-first "thenga") => "a"
; (string-first "kola") => "a"

; Template
; (define (string-first string)
; (...string...))

(define (string-first string)
  (string-ith string 0))

(define result (list string-first))
(provide result)
