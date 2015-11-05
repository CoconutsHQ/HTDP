#lang racket
; string->string

; extracts last character from the given string

;(check-expect (string-last "saurabh" ) "h" )
;(check-expect (string-last "" ) "")

; (define (string-first str) (... s ...)

(define (string-last str) (substring str (- (string-length str) 1 ) ))

(define result (list string-last))
(provide result)
