#lang racket
(require test-engine/racket-gui)

; String -> String
; Produces a string with the last character
; removed

(check-expect (string-remove-last "tomato")
              "tomat")
(check-expect (string-remove-last "diabetes")
              "diabete")

(define (string-remove-last s)
  (substring s 0 (sub1 (string-length s))))

(test)

(define result (list string-remove-last))
(provide result)