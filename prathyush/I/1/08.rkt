;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |8|) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(require 2htdp/image)

(define bark (rectangle 10 40 "solid" "brown"))
(define base-leaves (circle 20 "solid" "green"))
(define small-leaves (circle 10 "solid" "green"))
