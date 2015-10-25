#lang racket

(require "requires.rkt")

(define (test1 result)
  (= result 5))

(define (test2 result)
  (string=? result "hello_world"))

(define (test3 result)
  (or (string=? result "_helloworld")
      (string=? result "h_elloworld")
      (string=? result "he_lloworld")
      (string=? result "hel_loworld")
      (string=? result "hell_oworld")
      (string=? result "hello_world")
      (string=? result "hellow_orld")
      (string=? result "hellowo_rld")
      (string=? result "hellowor_ld")
      (string=? result "helloworl_d")
      (string=? result "helloworld_")))

(define (test4 result)
  (or (string=? result "elloworld")
      (string=? result "hlloworld")
      (string=? result "heloworld")
      (string=? result "hellworld")
      (string=? result "helloorld")
      (string=? result "hellowold")
      (string=? result "helloword")
      (string=? result "helloworl")))

(define (test9 result)
  (equal? result #false))

(define (test11 result)
  (= result 20))

(define (test13 f)
  (and (= (f 3 4) 5)
       (= (f 5 12) 13)))
 
(define (marks results)
(count (lambda (x) (equal? x #true)) results))

(define prathyush
  (list (list #true)
  (list)))

(define akash
  (list (list (test1 ash1) (test2 ash2) (test3 ash3) (test4 ash4) (test9 ash9))
  (list)))

 (define pranav
  (list (list (test prn1) (test prn2) (test prn3) (test prn4))  
  (list)))

 (define saurabh
  (list (list
         (test sau1)
         (test sau2)
         (test sau3)
         (test sau4))
  (list)))

(define (space n)
  (build-string n (lambda (i) #\space)))


(define (headers names)
  (for/list ([n names]
             [result (list akash pranav prathyush saurabh)])
    (let* ([obj-marks (marks (first result))]
          [sub-marks (marks (second result))]
          [tot-marks (+ obj-marks sub-marks)]
          [obj (number->string obj-marks)]
          [sub (number->string sub-marks)]
          [tot (number->string tot-marks)]
          [name-len (string-length n)]
          [obj-len (string-length obj)]
          [sub-len (string-length sub)]
          [tot-len (string-length tot)])
         
  (string-append "| " n (space (- 12 name-len)) "|" 
                 (space (- 10 obj-len))
                 obj " |" (space (- 11 sub-len))
                 sub " |"(space (- 6 tot-len))
                 tot " |"
                 "\n"))))




(define (report)
(display " HTDP Study Group\n")
(display "=================\n\n")
(display " Leaderboard\n")
(display "------------------------------------------------\n")
(display "| Name        | Objective | Subjective | Total |\n")
(display "| ----------- | --------- | ---------- | ----- |\n")
(display (apply string-append (headers '("Akash" "Pranav" "Prathyush" "Saurabh"))))
(display "------------------------------------------------\n"))

(define (export)
  (let ([out (open-output-file "readme.md" #:mode 'text #:exists 'replace)])
(display " HTDP Study Group\n" out)
(display "=================\n\n" out)
(display " Leaderboard\n" out)
(display "------------------------------------------------\n" out)
(display "| Name        | Objective | Subjective | Total |\n" out)
(display "| ----------- | --------- | ---------- | ----- |\n" out)
(display (apply string-append (headers '("Akash" "Pranav" "Prathyush" "Saurabh"))) out)
(display "------------------------------------------------\n" out)
(close-output-port out)))

(report)