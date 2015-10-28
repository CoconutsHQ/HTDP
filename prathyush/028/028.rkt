#lang racket
(define (string-insert s i)
  (string-append (substring s 0 i) "_" (substring s i)))
(string-insert "helloworld" 6)

; Expectation
; helloworld
; 0123456789
; hellow_orld