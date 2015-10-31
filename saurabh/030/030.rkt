#lang racket
(define (profit price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))
(profit 5)
(profit 1)
(profit 2)
(profit 3)
(profit 4)

(define result profit )
(provide result)