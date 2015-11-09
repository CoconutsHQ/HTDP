#lang racket

(provide testable MEMBERS MEMBER-NAMES first-name lookup)

(define IGNORES (list 5 6 7 8 10 12 18 19 23 24 25 26 28 29 32 34 35 38 41 43 44 45 46 47 48 49))

(define (testable till)
  (filter (lambda (i) (not (member i IGNORES))) (range 1 till)))

(define MEMBERS
  (list "akasharun" "pranav" "prathyush" "saurabh"))

(define MEMBER-NAMES
  (list (cons "akasharun" "Akash Arun")
        (cons "pranav" "Pranav Pramod")
        (cons "prathyush" "Prathyush Pramod")
        (cons "saurabh" "Saurabh Subhash")))

(define (first-name i)
  (dict-ref FIRST-NAMES i))

(define FIRST-NAMES
  (list (cons "akasharun" "Akash")
        (cons "pranav" "Pranav")
        (cons "prathyush" "Prathyush")
        (cons "saurabh" "Saurabh")))

(define SYMBOL-LEGEND
  (list (cons 'undone  ":interrobang:")
        (cons 'done ":+1:")
        (cons 'expired ":hourglass:")
        (cons 'unimplemented ":white_circle:")
        (cons 'na "-")
        (cons 'unevaluated ":x:")))

(define (lookup symbol)
  (dict-ref SYMBOL-LEGEND symbol))
