#lang racket
(require 2htdp/batch-io)

(require "tester/utils.rkt")
       
(define (read-rater)
    (begin (display "Who are you?")
           (read-line)))  
(define (read-author)  
  (begin (display "Who do you want to rate?")
  (read-line)))  
(define (read-exercise)
    (begin (display "Which exercise?")
           (read-line)))
(define (repeat-exercise)
    (begin (display (string-append "\n""Which other exercise should you want the marks repeated?"))
           (read-line)))

(define (ask-marks quality limit)
  (begin (display (string-append "Enter marks for "quality"(0-"(number->string limit)")"))
         (check (string->number (read-line)) limit)))

(define (check mark limit)
  (if (or (> mark limit)
          (< mark 0))
      (check (read-error limit) limit)
      mark))
(define (read-error limit)
  (begin (display (string-append "Enter a mark between 0 and " (number->string limit)))
             (string->number (read-line))))

(define rater (read-rater))
(define author (read-author))
(define exercise (read-exercise))

(define clarity-marks (ask-marks "clarity" 5))
(define simplicity-marks (ask-marks "simplicity" 2))
(define cleverness-marks (ask-marks "cleverness" 1))
(define feel-marks (ask-marks "feel" 2))

(write-file (string-append author "/" (pad3 exercise) "/" rater ".rkt")
             (string-append "#lang racket\n"
             "(define clarity " (number->string clarity-marks) ")\n"
             "(define simplicity " (number->string simplicity-marks) ")\n"
             "(define cleverness "(number->string cleverness-marks) ")\n"
             "(define feel "(number->string feel-marks) ")\n"
             "(define marks (+ clarity simplicity cleverness feel))\n"
             "(provide marks)"))

(define (file repeat)
      (begin (write-file (string-append author "/" (pad3 repeat) "/" rater ".rkt")
                  (string-append "#lang racket\n"
                                  "(define clarity " (number->string clarity-marks) ")\n"
                                  "(define simplicity " (number->string simplicity-marks) ")\n"
                                  "(define cleverness "(number->string cleverness-marks) ")\n"
                                  "(define feel "(number->string feel-marks) ")\n"
                                  "(define marks (+ clarity simplicity cleverness feel))\n"
                                  "(provide marks)"))
             (display (string-append author "/" (pad3 repeat) "/" rater ".rkt"))))                
     
(define (loop repeat)
  (loop (file (repeat-exercise))))
  
(loop (file (repeat-exercise)))

  
           
           
             
             
            
           
                  
             










