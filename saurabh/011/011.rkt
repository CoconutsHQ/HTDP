;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |011|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")))))
#lang racket
(define in false)

(define result (if (string? in)
    (string-length in)
(if (image? in)
    (* (image-width in) (image-height in) )
(if (number? in)  
    (cond
      [(<= in 0) in]
      [(> in 1) (- in 1)])
(if (boolean? in)
    (cond
      [(eqv?  in #true) 10]
      [(eqv? in #false) 20]) 
     "invalid"))))
    )
(provide result)