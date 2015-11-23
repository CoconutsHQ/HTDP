#lang racket

(require "../../bsl.rkt")

; String -> String
; Shows the first character of string
; (string-first "thenga") => "t"
; (string-first "kola") => "k"

; Template
; (define (string-first string)
; (...string...))

(define (string-first string)
  (string-ith string 0))

(define result (list string-first))
(provide result)
