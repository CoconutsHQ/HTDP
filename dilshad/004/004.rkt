#lang racket

(define str "helloworld")
(define i 5)
(define result
  (list
    (string-append (substring str 0 i) (substring str (+ i 1)))))

(provide result)