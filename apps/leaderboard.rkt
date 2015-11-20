#lang racket

;; TODOS
;; Sorting of names

(require "tables.rkt")

(define (report f author)
  (display (f author)))

(define (obj-report author)
  (report obj-table author))

(define (sub-report author)
  (report sub-table author))

(define (rtg-report author)
  (report rtg-table author))