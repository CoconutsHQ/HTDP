#lang racket

;; Owner's observation
(define BASELINE-ATTENDANCE 120)
(define BASELINE-PRICE 5.0)
(define ATTENDANCE-CHANGE 15)
(define PRICE-CHANGE 10)

;; Fixed costs
(define COST-PER-SHOW 180)
(define COST-PER-ATTENDEE 0.04)

(define (attendees ticket-price)
  (- BASELINE-ATTENDANCE (* (- ticket-price BASELINE-PRICE) (/ ATTENDANCE-CHANGE PRICE-CHANGE))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))


(define (cost ticket-price)
  (+ COST-PER-SHOW (* COST-PER-ATTENDEE (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define result (list profit))
(provide result)