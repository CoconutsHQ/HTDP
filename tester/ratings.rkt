#lang racket

(require "utils.rkt")
(require "info.rkt")

(define (expired? rating-file exercise-file)
  (apply < (map file-or-directory-modify-seconds (list rating-file exercise-file))))

(define (rating-status author rater exercise)
  (let ([rtg-file (rating-file author rater exercise)]
        [exr-file (exercise-file author exercise)])
  (cond
    [(file-exists? rtg-file) (if (expired? rtg-file exr-file)
                      'expired
                      (let ([marks (dynamic-require rtg-file 'marks (lambda () 'unmarked))])
                        (if (<= 0 marks 10) 'done 'off-mark)))]
                          
    [else 'unevaluated])))

(define (ratings-status rater exercises)
  (map (lambda (exercise)
         (map (lambda (i) (rating-status i rater exercise)) MEMBERS))
         exercises))

(provide ratings-status)

(define (per-user-result author)
  (let* ((indices (all-done author))
        (ratings (ratings-status author indices))
        (marks (assign-marks ratings)))
        (cons (append (list "Q.   ") (map first-name MEMBERS) (list "Marks: "))
         (insert-right (insert-left ratings indices) marks))))

(define (assign-marks results)
 (map (lambda (i) (* (/ (length (filter (lambda (i) (equal? i 'done)) i)) (length MEMBERS)) 10.0)) results))

(define (per-user author)
  (let* ((results (per-user-result author))
         (marks (filter number? (map last results))))
  (delineate
   (list
    (h1 (string-append (first-name author) " (Ratings)"))
    (render (align results '(left right)))
    (string-append "\nYou have achieved: " (number->string (apply + marks))
                   "/" (number->string (* (length (all-done author)) 10)) " marks")))))

(define (report-per-user author)
  (display (per-user author)))

(define (export-per-user author)
  (write! (string-append "../" author "/ratings.md")
          (per-user author)))
  
             