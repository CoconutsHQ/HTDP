#lang racket

(require "utils.rkt")
(require "info.rkt")

(define MIN-DONE (apply min (map cdr (done MEMBERS))))
(define MAX-DONE (apply max (map cdr (done MEMBERS))))

(define (testable till)
  (filter (lambda (i) (not (member i IGNORES))) (range 1 till)))

(define (all-done author)
  (testable 31))

(define (min-done author)
  (testable MIN-DONE))

(define (test-location exercise)
  (string-append "tests/" (pad3 (number->string exercise)) ".rkt"))

(define (import-test exercise)
  (dynamic-require (test-location exercise) 'test (lambda () 'no-test)))

(define (load-result author exercise)
  (let ((file-to-load (exercise-file author exercise)))
  (if (file-exists? file-to-load) (dynamic-require file-to-load 'result)
      'non-existent-file)))

(define (test author exercise)
  (let ([tests (import-test exercise)]
        [results (load-result author exercise)])
    (if (equal? results 'non-existent-file)
        (list 'undone)
    (map (lambda (t r)
           (t r)) tests results))))

(define (idx+test author exercise)
  (cons exercise (test author exercise)))

(define (tests-with-index author)
  (map (lambda (i) (idx+test author i)) (all-done author)))

(define (fill-tests t c)
  (cond
    ((< (length t) c) (fill-tests (append t (list "-")) c))
    (else t)))
    
(define (uniformize tests count)
    (map (lambda (i) (fill-tests i count)) tests))
    
(define (test-header test-count widths)
    (append (list (hgroup "Q." 4 'left))
          (map (lambda (i width)
                 (hgroup (string-append "Test " (number->string i)) width 'right)) (range 1 (add1 test-count)) widths)))

(define (users-header tests)
  (append (list (hgroup "Q." 10 'left))
          (map (lambda (i) (hgroup i (string-length i) 'right)) (map (lambda (i) (dict-ref FIRST-NAMES i)) MEMBERS))))

(define (test-marks tests)
  (let ((len (length tests)))
  (map (lambda (t)
  (cond
    ((equal? #true t) (/ 10 len))
    ((equal? 'undone t) ":interrobang:")
    (else 0))) tests)))
  
(define (mark-rows tests)
(map test-marks tests))

(define (zip k v)
  (map (lambda (k v) (cons k v)) k v))

(define (determine-row-width i)
    (cond
      ((number? i) 6)
      ((string? i) (string-length i))
      (else 0)))

(define (build-table author)
  (let* ((all (tests-with-index author))
         (indices (map first all))
         (results (mark-rows (map rest all)))
         (mx (apply max (map length results)))
         (uniform (uniformize results mx))
         (widths (map (lambda (marks) (map determine-row-width marks)) uniform))
         (max-widths (apply map max widths)))
(table (test-header mx max-widths) (zip indices uniform))))


(define (per-user author)
  (string-join
    (list (h1 (string-append (dict-ref MEMBER-NAMES author) " (Objective)"))
    (h2 "Legend")
    ":interrobang: -> Exercise file doesn't exist.\n"
    (build-table author)) "\n"))

(define (export-user author)
  (write! (string-append "../" author "/objective.md")
   (per-user author)))

(define (total-marks member exercise)
  (apply + (test-marks (filter boolean? (test member exercise)))))

(define (user-marks exercise)
  (map (lambda (i) (total-marks i exercise))
       MEMBERS))

(define (exercise+user-marks exercise)
  (cons exercise (user-marks exercise)))

(define (all-user-marks+total till)
  (let ([all (map exercise+user-marks (testable (add1 till)))])
    (append all (list (append (list "Total") (apply map + (map user-marks (testable (add1 till)))))))))

(define (overall till)
(string-join
   (list (h1 "Objective Marks")
   (table (users-header 3)
          (all-user-marks+total till))) "\n"))

(define (report till)
  (display (overall till)))

(define (export till)
  (write! "../objective.md"
   (overall till)))

(define (write! file input)
  (let ((out (open-output-file file #:mode 'text #:exists 'replace)))
    (display input out)
    (close-output-port out)))