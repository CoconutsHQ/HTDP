#lang racket

(define (attendees ticket-price)
  (- INIT-ATTENDEES (* (- ticket-price INIT-TICKETPRICE) (/ INCREASE-ATTENDEES MIN-PRICECHANGE))))
(define (cost ticket-price)
  (+ FIXED-COST (* (attendees ticket-price) VAR-COST)))
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))
(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))

(define INIT-ATTENDEES 120)
(define INIT-TICKETPRICE 5)
(define INCREASE-ATTENDEES 15)
(define MIN-PRICECHANGE .1)
(define FIXED-COST 180)
(define VAR-COST .04)

(define result (list profit))
(provide result)
