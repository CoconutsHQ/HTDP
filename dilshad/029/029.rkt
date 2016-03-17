#lang racket

(define (attendees ticket-price)
  (- start-attendance (* (- ticket-price start-price) (/ attendance-change price-change))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixed-cost (* var-cost (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define start-attendance 120)
(define start-price 5.0)
(define attendance-change 15)
(define price-change 0.1)
(define fixed-cost 180)
(define var-cost 0.04)

;Example
(profit 2)

(define result (list profit))
(provide result)