#lang racket

(define str "helloworld")
(define i 5)

(define result
(string-append (substring str 0 i) "_" (substring str i ) 
))

(provide result)