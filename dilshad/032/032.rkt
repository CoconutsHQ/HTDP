#lang racket

(define (attendees ticket-price)
  (- start-attendance (* (- ticket-price start-price) price-per-attendance)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
 (* var-cost (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define start-attendance 120)
(define start-price 5.0)
(define attendance-change 15)
(define price-change 0.1)
(define var-cost 1.50)
(define price-per-attendance (/ attendance-change price-change))

(profit 3)
(profit 4)
(profit 5)
(define result (list profit))
(provide result)