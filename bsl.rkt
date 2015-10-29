#lang racket

(define (string-ith s n)
	(substring s n (+ n 1)))


(provide string-ith)