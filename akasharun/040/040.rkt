#lang racket

; String -> String
; Removes the last character of string
; (string-rest "kola") => kol

; Template
; (define (string-last string)
; (... string ...)

(define (string-last string)
  (substring string 0 (- (string-length string) 1)))

(define result (list string-last))
(provide result)


  