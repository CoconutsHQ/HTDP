#lang racket

; String -> String
; Removes the first character of string
; (string-rest "manga") => anga

; Template
; (define (string-rest string)
; (... string ...)

(define (string-rest string)
  (substring string 1 (string-length string)))

(define result (list string-rest))
(provide result)

  