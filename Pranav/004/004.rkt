#lang racket

(define str "helloworld")
(define ttt "0123456789")
(define i 5)

(define result 
  (string-append (substring str 0  i ) (substring str (+ i 1))))

(provide result)