#lang racket

(require "utils.rkt" "info.rkt")

(define DONE-EXERCISES (done MEMBERS))

(define MIN-DONE (apply min (map cdr DONE-EXERCISES)))

(define (test-location exercise)
  (string-append "tests/" (pad3 (number->string exercise)) ".rkt"))

(define (import-test exercise)
  (let ((test-file (test-location exercise)))
    (if (file-exists? test-file)
  (dynamic-require (test-location exercise) 'test)
  'no-test-file)))

(define (import-result author exercise)
  (let ((file-to-load (exercise-file author exercise)))
  (if (file-exists? file-to-load) (dynamic-require file-to-load 'result)
      'non-existent-file)))

(define (run-test author exercise)
  (let ([tests (import-test exercise)]
        [results (import-result author exercise)])
    (cond ((equal? results 'non-existent-file)
          (list 'undone))
          ((equal? tests 'no-test-file)
          (list 'unimplemented))
          (else (map (lambda (t r) (t r)) tests results)))))

(define (fill-tests t c)
  (cond
    ((< (length t) c) (fill-tests (append t (list 'na)) c))
    (else t)))
    
(define (uniformize tests count)
    (map (lambda (i) (fill-tests i count)) tests))

(define (test-marks tests)
  (let ((len (length tests)))
  (map (lambda (t) (if t (/ 10 len) 0)) tests)))
  
(define (mark-rows tests) (map test-marks tests))

(define (test-results author tests)
(map (lambda (i) (run-test author i)) tests))

(define (test-headers count)
  (map (lambda (i) (string-append "Test " (number->string i))) (range 1 (add1 count))))



(define (obj-results author)
(let* ((test-idx (all-done author))
       (tests (test-results author test-idx))
(mx (apply max (map length tests)))
(marks (mark-rows tests))
(rows (uniformize marks mx))
(left-margin (cons "Q.   " test-idx))
(right-margin (cons "Total " (map (lambda (i) (apply + i)) marks))))
  (align (insert-right (insert-left (cons (test-headers mx) rows)
               left-margin) right-margin)
         '(left right))))

(define (per-user author)
  (let* ((results (obj-results author))
         (achieved (apply + (map last (cddr results))))
         (achievable (* (length (all-done author)) 10)))
  (string-join
    (list 
    (h1 (string-append (first-name author) " (Objective)"))
    (h2 "Legend")
    ":interrobang: -> Exercise file doesn't exist.\n"
    (render results)
    (string-append
     "\nYou have achieved: " (number->string achieved) "/"
     (number->string achievable) " marks"
     )) "\n")))

(define (report-per-user author)
  (display (per-user author)))

(define (export-per-user author)
  (write! (string-append "../" author "/objective.md")
   (per-user author)))

(define (export-all-users)
  (map export-per-user MEMBERS))

(define (total-marks member exercise)
  (apply + (test-marks (filter boolean? (run-test member exercise)))))

(define (user-marks exercise)
  (map (lambda (i) (total-marks i exercise))
       MEMBERS))

(define (aggregate-row results)
  (let ((total (apply map + results)))
    (cons "**Total**" (map (lambda (i) (string-append "**"
                                     (number->string i)
                                     "**")) total))))

(define (all-user-marks till)
  (let* ([all (map user-marks (testable (add1 till)))]
        [headers (map first-name MEMBERS)]
        [left-margin (cons "Q.       " (testable MIN-DONE))]
        [bottom-result (aggregate-row all)])
    (insert-bottom (insert-left (cons headers all) left-margin)
                   bottom-result)))

(define (overall till)
(string-join
   (list (h1 "Objective Marks")
   (render (align (all-user-marks till) '(left right)))) "\n"))

(define (report till) (display (overall till)))

(define (export till)
  (write! "../objective.md" (overall till)))
