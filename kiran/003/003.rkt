#lang racket
(require "../../bsl.rkt")

 
(define str "helloworld")
(define i 5)
(define result
(list (string-append (substring str 0 i) "_" (substring str i))))

(provide result)
  
