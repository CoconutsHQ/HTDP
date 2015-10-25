#lang racket
(define prefix "hello")
(define suffix "world")

(define result (string-append prefix "_" suffix))

(provide result)