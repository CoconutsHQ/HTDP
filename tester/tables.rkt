#lang racket

(require "utils.rkt")
(require "info.rkt")
(require "objective.rkt")
(require "subjective.rkt")
(require "ratings.rkt")

;; A rating table is
;; idx | Quantity | Quantity | ... | Aggregate |
;; 1 | value    | value    | ... | value     |
;; 2 | value    | value    | ... | value     |
;; 3 | value    | value    | ... | value     |

;; There are three types of rating tables:

;; 1) Per user table

;; Objective
;; ---------
;; idx : all done questions of user
;; Quantity : Tests of each question
;; Aggregate : Sum of all tests

(define (per-user-table idx quantity aggregate)
  (insert-right (insert-left idx quantity) aggregate)