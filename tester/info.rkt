#lang racket

(define IGNORES (list 5 6 7 8 10 12 18 19 23 24 25 26 28 29))

(define MEMBERS
  (list "akasharun" "pranav" "prathyush" "saurabh"))

(define MEMBER-NAMES
  (list (cons "akasharun" "Akash Arun")
        (cons "pranav" "Pranav Pramod")
        (cons "prathyush" "Prathyush Pramod")
        (cons "saurabh" "Saurabh Subhash")))

(define FIRST-NAMES
  (list (cons "akasharun" "Akash")
        (cons "pranav" "Pranav")
        (cons "prathyush" "Prathyush")
        (cons "saurabh" "Saurabh")))

(provide IGNORES MEMBERS MEMBER-NAMES FIRST-NAMES)