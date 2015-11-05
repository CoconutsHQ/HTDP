
#lang racket
; string->string

; produces a string with the last character removed


(check-expect (string-remove-last "saurabh" ) "saurab" )
(check-expect (string-remove-last "" ) "")
(check-expect (string-remove-last "apple" ) "appl" )

; (define (string-remove-last str) (... s ...)

(define (string-remove-last str) (substring str 0 (- (string-length str) 1)) )