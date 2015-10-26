#lang racket

(require "utils.rkt")
(require "subjective.rkt")

(define IGNORES (list 5 6 7 8 10 12))

(define MEMBERS
  (list "akasharun" "pranav" "prathyush" "saurabh"))

(define MIN-DONE (apply min (map cdr (done MEMBERS))))

(define (testable)
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

;; Multiple tests on single file integration
(map (lambda (tests)
       (list (length (filter (lambda (i) (eq? i true)) tests)) (length tests))) (map (lambda (i) (test "prathyush" i)) (testable)))

(display
(table (list (hgroup "Exercise#" 10 'left)
             (hgroup "Test1" 5 'left)
             (hgroup "Test2" 5 'left)
             (hgroup "Total" 5 'left)) '((1 1 - 10) (2 1 - 10))))