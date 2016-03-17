#lang racket
(require test-engine/racket-gui)

; String -> String
; Returns a string with first
; character removed.

(check-expect (string-rest "hello") "ello")
(check-expect (string-rest "life") "ife")
              
(define (string-rest s)
  (substring s 1))

(test)

(define result (list string-rest))
(provide result)