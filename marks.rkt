#lang racket
(require 2htdp/batch-io)

(require "tester/utils.rkt")


;; Questions

(define (read-rater)
(display "Who are you?")
           (read-line))

(define (read-author)  
(display "Who do you want to rate?")
  (read-line))

(define (read-exercise)
(display "Which exercise?")
           (read-line))

(define (is-no? val)
  (or (string=? val "no")
                          (string=? val "nope")
                          (string=? val "nah")
                          (string=? val "never")
                          (string=? val "no way")
                          (string=? val "absoulutely not")))

(define (is-yes? val)
  (or (string=? val "yes")
                              (string=? val "yeah")
                              (string=? val "yep")
                              (string=? val "ya")
                              (string=? val "sure")
                              (string=? val "ok")    
                              (string=? val "allright")    
                              (string=? val "absoulutely")    
                              (string=? val "absoulutely")))
  

(define (check-within-limits-within-limits-validation val)
  (cond
    ((is-no? val) "no")
    ((is-yes? val) "yes")
    (else "no")))

(define (ash? in)
  (or (string=? in "akasharun")
                      (string=? in "akash")
                      (string=? in "ash")))
(define (pranav? in)
  (or (string=? in "pranav")
                          (string=? in "prnv")))

(define (saurabh? in)
  (or (string=? in "saurabh")
                          (string=? in "sau")))

(define (alias in)
  (cond
    ((pranav? in) "pranav")
    ((ash? in) "akasharun")
    ((saurabh? in) "saurabh")
    (else "unknown")))

(define (mark-question quality limit) (string-append "Enter marks for "quality"(0-"(number->string limit)")"))

(define (check-within-limits mark limit)
  (if (or (> mark limit)
          (< mark 0))
      (check-within-limits (read-error limit) limit)
      mark))

(define (ask-marks quality limit)
  (display (mark-question quality limit))
(number->string (check-within-limits (string->number (read-line)) limit)))

(define (read-error limit)
  (display (string-append "Enter a mark between 0 and " (number->string limit)))
             (string->number (read-line)))

(define (end)
  "End")

(define (ex-file author exercise rater)
  (string-append author "/" (pad3 exercise) "/" rater ".rkt"))

(define (write-answer author exercise rater clarity simplicity cleverness feel) 
(write-file (ex-file author exercise rater)
            (string-append "#lang racket\n"
                           "(define clarity " clarity ")\n"
                           "(define simplicity " simplicity ")\n"
                           "(define cleverness " cleverness ")\n"
                           "(define feel " feel ")\n"             
                           "(provide (clarity simplicity cleverness feel)")))

(define (print-repeat)
  (display (string-append "\n""Do you need these marks to be repeated on any other exercise?"))
                           (read-line))


(define (file rater author exercise clarity simplicity cleverness feel)
  (write-answer author exercise rater clarity simplicity cleverness feel)
             (display (ex-file author exercise rater))
             (if (string=? (print-repeat) "yes")
                 (q)
                 "Thank you for using this software!"))


 (define (q)
(file (alias (read-rater))
      (alias (read-author))
      (read-exercise)
      (ask-marks "clarity" 5)
      (ask-marks "simplicity" 3)
      (ask-marks "cleverness" 1)
      (ask-marks "feel" 2)))
(define (q rater author)
(file rater
      author
 (read-exercise)
      (ask-marks "clarity" 5)
      (ask-marks "simplicity" 3)
      (ask-marks "cleverness" 1)
      (ask-marks "feel" 2)))

(define loop 


  
(q)

           
             
             
            
           
                  
             










