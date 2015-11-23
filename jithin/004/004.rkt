

#lang racket
(require "../../bsl.rkt")
(define str "helloworld")
(define i 5)

(define result(list(string-append  (substring str 0  i ) (substring str(+ 1 i )))))
(provide result)