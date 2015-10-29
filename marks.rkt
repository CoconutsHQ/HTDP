#lang racket
(require 2htdp/batch-io)

(require "tester/utils.rkt")

(define (read-error limit)
  (begin (display (string-append "Enter a mark between 0 and " (number->string limit)))
             (string->number (read-line))))
(define (check mark limit)
  (if (or (> mark limit)
          (< mark 0))
      (check (read-error limit) limit)
      mark))       

(define read-rater
    (begin (display "Who are you?")
           (read-line)))  
(define read-author 
  (begin (display "Who do you want to rate?")
  (read-line)))
(define read-exercise
    (begin (display "Which exercise?")
           (read-line)))  
(define (display-question val)
  (display (string-append "Enter marks for " val)))


(display "Enter marks for clarity:(0-5) ")
(define clarity-marks (check (string->number (read-line)) 5)) 
(display  "Enter marks for simplicity:(0-2) ")
(define simplicity-marks (check (string->number (read-line)) 2))
(display  "Enter marks for cleverness:(0-1) ")
(define cleverness-marks (check (string->number (read-line)) 1))
(display  "Enter marks for feel:(0-2) ")
(define feel-marks (check (string->number (read-line)) 2))

(define marks (+ clarity-marks simplicity-marks cleverness-marks feel-marks))


(write-file (string-append author "/" (pad3 exercise) "/" rater ".rkt")
             (string-append "#lang racket\n"
             "(define clarity " (number->string clarity-marks) ")\n"))










