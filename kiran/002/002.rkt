#lang racket
(define prefix "hello")
(define suffix "world")
(define result (list
(string-append prefix "_" suffix )))
provide result)
