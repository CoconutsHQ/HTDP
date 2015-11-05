#lang racket

(require "utils.rkt" "info.rkt")

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
  (map (lambda (t) (cond
                     ((boolean? t) (if t (/ 10.0 len) 0))
                     (else t))) tests)))
  
(define (mark-rows tests) (map test-marks tests))

(define (obj-test-results author tests)
(map (lambda (i) (test-marks (run-test author i))) tests))

(define (test-headers count)
  (map (lambda (i) (string-append "Test " (number->string i))) (range 1 (add1 count))))

(define (max-test-count results)
  (apply max (map length results)))

(provide uniformize max-test-count obj-test-results test-headers)

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
