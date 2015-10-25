#lang racket

(define members
  (list
   (cons 'ash "akasharun")
   (cons 'prn "pranav")
   (cons 'prt "prathyush")
   (cons 'sau "saurabh")))

(define (get-directory-numbers name)
   (filter number? (map 
    (lambda (n)
      (string->number (path->string n)))
      (filter (lambda (n) (directory-exists? (build-path name n))) (directory-list name)))))

(define (last-done name)
  (cons name (apply max (get-directory-numbers name))))

(define (status members)
  (map last-done members))

(provide status)
(provide members)