#lang racket

(require "utils.rkt")
(require "subjective.rkt")

(define IGNORES (list 5 6 7 8 10 12 18 19 23 24 25 26 28 29))

(define MEMBERS
  (list "akasharun" "pranav" "prathyush" "saurabh"))

(define MEMBER-NAMES
  (list (cons "akasharun" "Akash Arun")
        (cons "pranav" "Pranav Pramod")
        (cons "prathyush" "Prathyush Pramod")
        (cons "saurabh" "Saurabh Subhash")))

(define MIN-DONE (apply min (map cdr (done MEMBERS))))

(define (testable author till)
  (filter (lambda (i) (not (member i IGNORES))) (range 1 till)))

(define (all-done author)
  (testable author 31))

(define (min-done author)
  (testable author MIN-DONE))

(define (test-location exercise)
  (string-append "tests/" (pad3 (number->string exercise)) ".rkt"))

(define (import-test exercise)
  (dynamic-require (test-location exercise) 'test (lambda () 'no-test)))

(define (load-result author exercise)
  (let ((file-to-load (exercise-file author exercise)))
  (if (file-exists? file-to-load) (dynamic-require file-to-load 'result)
      'non-existent-file)))

(define (idx+test author exercise)
  (let ([tests (import-test exercise)]
        [results (load-result author exercise)])
    (if (equal? results 'non-existent-file)
        (cons exercise (list 'undone))
    (cons exercise (map (lambda (t r)
           (t r)) tests results)))))

(define (tests-with-index author)
  (map (lambda (i) (idx+test author i)) (all-done author)))

(define (fill-tests t c)
  (cond
    ((< (length t) c) (fill-tests (append t (list "-")) c))
    (else t)))
    
(define (uniformize tests count)
    (map (lambda (i) (fill-tests i count)) tests))
    

(define (headers test-count)
    (append (list (hgroup "Q." 4 'left))
          (map (lambda (i) (hgroup (string-append "Test " (number->string i)) 6 'right)) (range 1 (add1 test-count)))))

(define (mark-converter results len)
  (map (lambda (t)
  (cond
    ((equal? #true t) (/ 10 len))
    ((equal? 'undone t) ":interrobang:")
    (else 0))) results))
  
(define (mark-rows tests)
(map (lambda (result) (let* (
                           [len (length result)])
                      (mark-converter result len))) tests))

(define (zip k v)
  (map (lambda (k v) (cons k v)) k v))

(define (build-table author)
  (let* ((all (tests-with-index author))
         (indices (map first all))
         (results (mark-rows (map rest all)))
         (mx (apply max (map length results)))
         (uniform (uniformize results mx)))
(table (headers mx) (zip indices uniform))))

(define (report author)
  (display
   (string-append
    (dict-ref MEMBER-NAMES author) "\n"
    (build-table author))))


(define (export author)
  (let ((out (open-output-file (string-append "../" author "/objective.md") #:mode 'text #:exists 'replace)))
  (display
   (string-append
    (h1 (string-append (dict-ref MEMBER-NAMES author) " (Objective)")) "\n"
    (build-table author)) out)
    (close-output-port out)))
        