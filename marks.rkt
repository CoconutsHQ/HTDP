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
    (if (string=? (if (or (string=? printrepeat "no")
                          (string=? printrepeat "nope")
                          (string=? printrepeat "nah")
                          (string=? printrepeat "never")
                          (string=? printrepeat "no way")
                          (string=? printrepeat "absoulutely not"))
                      "no"
                      (if (or (string=? printrepeat "yes")
                              (string=? printrepeat "yeah")
                              (string=? printrepeat "yep")
                              (string=? printrepeat "ya")
                              (string=? printrepeat "sure")
                              (string=? printrepeat "ok")    
                              (string=? printrepeat "allright")    
                              (string=? printrepeat "absoulutely")    
                              (string=? printrepeat "absoulutely"))
                          "yes"
                          0)) "no")
        "okay"
        (begin (display "\nWhich exercise?")
               (read-line))))

(define (alias in)
  (if (or (string=? in "akasharun")
          (string=? in "akash")
          (string=? in "ash"))
          "akasharun"
          (if (or (string=? in "pranav")
                  (string=? in "prnv"))
                   "pranav"
          (if (or (string=? in "saurabh")
                  (string=? in "sau"))
                  "saurabh"
                   in))))             
                               

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
(define (end)
  "End")

(define rater (alias (read-rater)))                                           
(define author (alias (read-author)))
(define exercise (alias (read-exercise)))

(define clarity-marks (ask-marks "clarity" 5))
(define simplicity-marks (ask-marks "simplicity" 3))
(define cleverness-marks (ask-marks "cleverness" 1))
(define feel-marks (ask-marks "feel" 2))

(write-file (string-append author "/" (pad3 exercise) "/" rater ".rkt")
            (string-append "#lang racket\n"
                           "(define clarity " (number->string clarity-marks) ")\n"
                           "(define simplicity " (number->string simplicity-marks) ")\n"
                           "(define cleverness "(number->string cleverness-marks) ")\n"
                           "(define feel "(number->string feel-marks) ")\n"             
                           "(provide (clarity simplicity cleverness feel)")) 

(define printrepeat (begin (display (string-append "\n""Do you need these marks to be repeated on any other exercise?"))
                           (read-line)))
(define (file repeat)
      (begin (write-file (string-append author "/" (pad3 repeat) "/" rater ".rkt")
                         (string-append "#lang racket\n"
                                        "(define clarity " (number->string clarity-marks) ")\n"
                                        "(define simplicity " (number->string simplicity-marks) ")\n"
                                        "(define cleverness "(number->string cleverness-marks) ")\n"
                                        "(define feel "(number->string feel-marks) ")\n"                                  
                                        "(provide (clarity simplicity cleverness feel)"))
             (display (string-append author "/" (pad3 repeat) "/" rater ".rkt"))))               
     
(define (loop repeat)
  (loop (file (if (string=? (repeat-exercise) "exit")
                  (end)
                  )))
(if (string=? (repeat-exercise) "okay")
    (end)
    (loop (file (repeat-exercise)))) 
    
    
            
           


  

           
             
             
            
           
                  
             










