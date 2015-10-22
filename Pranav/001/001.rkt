;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |001|) (read-case-sensitive #t) (teachpacks ((lib "master.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "arrow.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "master.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "convert.rkt" "teachpack" "htdp") (lib "arrow.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
#lang racket

;;Exercise 1
(define x 3)
(define y 4)

(define (distance-formula x y)
 (sqrt (+ (* x x) (* y y)))
  )

;;Test
(distance-formula x y)




