#lang racket
; string->string

; produces a string with the first character removed


;(check-expect (string-rest "saurabh" ) "aurabh" )
;(check-expect (string-rest "" ) "")

; (define (string-rest str) (... s ...)

(define (string-rest str) (substring str 1))