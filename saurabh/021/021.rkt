#lang racket
(define (string-insert string i) (string-append 
 (substring string 0 i ) "_" (substring string i (string-length string))))
(string-insert "helloworld" 5)
(define result string-insert)
(provide result)