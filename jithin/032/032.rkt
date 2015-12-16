
#lang racket

(define (attendees ticket-price)
  (- actual-attendees (* (- ticket-price actual-ticketprice) (/ change-attendees min-pricechange))))
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))
(define (cost ticket-price)
   (* constant (attendees ticket-price)))
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
(define actual-ticketprice 5.0)
(define actual-attendees 120)
(define change-attendees 15)
(define min-pricechange 0.1)
(define constant 1.5)
(define new-ticket price (
 (profit 3)
(profit 4)
(profit 5)
(define result (list profit) )
(provide result)