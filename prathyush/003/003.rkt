#lang racket

(define str "helloworld")
(define i 2)

(define result (string-append (substring str 0 i) "_"
(substring str i (string-length str))))

(provide result)