;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |036|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; Shows the first character of string
; (string-first "thenga") => "t"
; (string-first "kola") => "k"

; Template
; (define (string-first string)
; (...string...))

(define (string-first string)
  (string-ith string 0))

(define result (list string-first))
(provide result)
