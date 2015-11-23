#lang racket

; A Price falls into one of three intervals: 
; — 0 through 1000;
; — 1000 through 10000;
; — 10000 and above.
; interpretation the price of an item

;constants
(define AVG-PRICE-TAX 0.05)
(define LUX-PRICE-TAX 0.08)

; Price -> Number
; computes the amount of tax charged for price p
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 12017) (* 0.08 12017))
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) 0]
    [(and (<= 1000 p) (< p 10000)) (* AVG-PRICE-TAX p)]
    [(>= p 10000) (* LUX-PRICE-TAX p)]))
