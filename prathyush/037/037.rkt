#lang racket

(require test-engine/racket-gui)

; String -> String
; Given a string extracts it's last character.

(check-expect (string-last "hello") "o")
(check-expect (string-last "father") "r")

;(define (string-last s) "")

;(define (string-last s)
; (... s)

(define (string-last s)
  (substring s (sub1 (string-length s))))

(test)

(define result (list string-last))
(provide result)