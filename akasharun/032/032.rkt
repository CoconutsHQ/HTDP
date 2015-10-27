#lang racket

(define (attendees ticket-price)
  (- INIT-ATTENDEES (* (- ticket-price INIT-TICKETPRICE) PRICE-ATTENDEES )))
(define (cost ticket-price)
  (* (attendees ticket-price) VAR-COST))
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))
(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))

(define INIT-ATTENDEES 120)
(define INIT-TICKETPRICE 5)
(define INCREASE-ATTENDEES 15)
(define MIN-PRICECHANGE .1)
(define PRICE-ATTENDEES (/ INCREASE-ATTENDEES MIN-PRICECHANGE))
(define VAR-COST 1.5)

(profit 1)
(profit 2)
(profit 3)
(profit 4)
(profit 5)

(define result (list profit))
(provide result)