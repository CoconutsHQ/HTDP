#lang racket
(require test-engine/racket-gui)

; string->string

; extracts first character from the given string

(check-expect (string-first "saurabh" ) "s")
(check-expect (string-first "" ) "")

; (define (string-first str) (... s ...)

(define (string-first str) (substring str 0 1))

(define result (list string-first))
(provide result)