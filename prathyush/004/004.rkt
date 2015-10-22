#lang racket

(define str "helloworld")
(define i 9)

(define result (string-append (substring str 0 i)
               (substring str (+ i 1) (string-length str))))

(provide result)