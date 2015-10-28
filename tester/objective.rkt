#lang racket

(require "utils.rkt")
(require "subjective.rkt")

(define IGNORES (list 5 6 7 8 10 12 23 24 25 26 28 29))

(define MEMBERS
  (list "akasharun" "pranav" "prathyush" "saurabh"))

(define MIN-DONE (apply min (map cdr (done MEMBERS))))

(define (testable author)
  (filter (lambda (i) (not (member i IGNORES))) (range 1 15)))

(define (test-location exercise)
  (string-append "tests/" (pad3 (number->string exercise)) ".rkt"))

(define (import-test exercise)
  (dynamic-require (test-location exercise) 'test (lambda () 'no-test)))

(define (load-result author exercise)
  (dynamic-require (exercise-file author exercise) 'result))

(define (test author exercise)
  (let ([tests (import-test exercise)]
        [results (load-result author exercise)])
    (map (lambda (t r)
           (t r)) tests results)))

(define (tests author)
  (map (lambda (i) (test author i)) (testable author)))

(define (headers tests)
    (let ([most-tests (apply max (map length tests))])
    (append (list (hgroup "Q." 4 'left))
          (map (lambda (i) (hgroup (string-append "Test " (number->string i)) 6 'right)) (range 1 (add1 most-tests))))))

(define (mark-converter i len)
  (cond
    ((equal? i '-) "-")
    (i (/ 10 len))
    (else 0)))
  
(define (mark-rows tests)
(map (lambda (idx test) (let ([len (length test)])
                                (append (list idx) (map (lambda (i)
                                                          (mark-converter i len)) test)))) (range 1 (add1 (length tests)))
                                                                                                  tests))
(define (build-table author)
  (let ((all (tests author)))
(display
 author "\n"
(table (headers all) (mark-rows all)))))