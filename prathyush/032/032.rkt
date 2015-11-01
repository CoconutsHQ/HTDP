#lang racket

;; Owner's observation
(define BASELINE-ATTENDANCE 120)
(define BASELINE-PRICE 5.0)
(define ATTENDANCE-CHANGE 15)
(define PRICE-CHANGE 0.1)
(define INFLUX (/ ATTENDANCE-CHANGE PRICE-CHANGE))

;; Fixed costs
(define COST-PER-ATTENDEE 1.5)

(define (attendees ticket-price)
  (- BASELINE-ATTENDANCE (* (- ticket-price BASELINE-PRICE) INFLUX)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* COST-PER-ATTENDEE (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 3)
(profit 4)
(profit 5)

(define result (list profit))
(provide result)
