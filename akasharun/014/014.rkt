;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |014|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#lang racket

(define (cube-volume a)
  (* a a a))
(define (cube-surface a)
  (* 6 (sqr a)))

(define result1 cube-volume)
(define result2 cube-surface)

(provide result1)
(provide result2)