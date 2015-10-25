#lang racket

;; TODOS
;; Sorting of names

(require "requires.rkt")

(define (marks results)
(count (lambda (x) (equal? x #true)) results))

(define prathyush
  (list (list #true)
  (list)))

(define akash
  (list (list (test1 ash1)
              (test2 ash2)
              (test3 ash3)
              (test4 ash4)
              (test9 ash9))
  (list)))

 (define pranav
  (list (list (test1 prn1) (test2 prn2) (test3 prn3) (test4 prn4) (test9 prn9))  
  (list)))

 (define saurabh
  (list (list
         (test1 sau1)
         (test2 sau2)
         (test3 sau3)
         (test4 sau4)
         (test9 sau9))
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