;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ticket Price|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

(define (attendees TICKET-PRICE)
  (- INIT-ATTENDEES (* (- TICKET-PRICE INIT-TICKETPRICE) (/ INCREASE-ATTENDEES MIN-PRICECHANGE))))
(define (cost TICKET-PRICE)
  (+ FIXED-COST (* (attendees TICKET-PRICE) VAR-COST)))
(define (revenue TICKET-PRICE)
  (* TICKET-PRICE (attendees TICKET-PRICE)))
(define (profit TICKET-PRICE)
  (- (revenue TICKET-PRICE) (cost TICKET-PRICE)))
(define (convert TICKET-PRICE)
      (number->string (profit TICKET-PRICE)))
      

(write-file 'stdout "Enter the ticket price: ")
(define TICKET-PRICE (string->number (read-file 'stdin)))


(define INIT-ATTENDEES 120)
(define INIT-TICKETPRICE 5)
(define INCREASE-ATTENDEES 15)
(define MIN-PRICECHANGE .1)
(define FIXED-COST 180)
(define VAR-COST .04)

(profit TICKET-PRICE)