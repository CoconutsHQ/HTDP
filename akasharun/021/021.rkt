;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |021|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#lang racket

(define (string-insert string i)
  (string-append (substring string 0 i) "_" (substring string i)))
(string-insert "hello" 2)

(define result string-insert)
(provide result)