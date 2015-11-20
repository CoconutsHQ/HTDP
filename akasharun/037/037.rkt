#lang racket

(require "../../bsl.rkt")

; String -> String
; Shows the last character of string
; (string-first "thenga") => "a"
; (string-first "kola") => "a"

; Template
; (define (string-first string)
; (...string...))

(define (string-last string)
  (string-ith string (- (string-length string) 1)))

(define result (list string-last))
(provide result)
