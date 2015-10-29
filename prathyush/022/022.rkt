#lang racket

(define (string-delete s i)
  (string-append
   (substring s 0 i)
   (substring s (+ i 1)
              (string-length s))))

(string-delete "hello" 2)

(define result (list string-delete))
(provide result)