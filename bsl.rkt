#lang racket
(require test-engine/racket-gui)

(define (string-ith s n)
	(substring s n (+ n 1)))


(provide string-ith)
(provide check-expect)