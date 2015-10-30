#lang racket

(require "utils.rkt")
(require "info.rkt")

(define (testable till)
  (filter (lambda (i) (not (member i IGNORES))) (range 1 till)))

;; File exists
;; File created earlier
;; Rating exits
;; Rating beyond limits
(define (rated? author rater exercise)
 (file-exists? (rating-file author rater exercise)))

(define (expired? rating-file exercise-file)
  (apply < (map file-or-directory-modify-seconds (list rating-file exercise-file))))

(define (rating-status author rater exercise)
  (let ([rtg-file (rating-file author rater exercise)]
        [exr-file (exercise-file author exercise)])
  (cond
    [(file-exists? rtg-file) (if (expired? rtg-file exr-file)
                      'expired
                      (let ([marks (dynamic-require rtg-file 'marks (lambda () 'unmarked))])
                        (cond
                          [(number? marks) (if (<= 0 marks 10) 'done 'off-mark)]
                          [else marks])))]
                          
    [else 'unevaluated])))

(define (rating author rater exercise)
  (let ([rtg-file (rating-file author rater exercise)]
        [exr-file (exercise-file author exercise)])
  (cond
    [(file-exists? rtg-file) 
                      (let ([marks (dynamic-require rtg-file 'marks (lambda () 'unmarked))])
                        (cond
                          [(number? marks) (if (<= 0 marks 10) marks 'off-mark)]
                          [else marks]))]
                          
    [else 'unevaluated])))

(define (q+rating author rater q)
  (cons q (list (rating author rater q))))

 
(define (user-headers)
  (cons (hgroup "Q." 4 'left) (map (lambda (i)
       (let* ((mem (dict-ref MEMBER-NAMES i))
             (len (string-length mem)))
         (hgroup mem len 'left))) MEMBERS)))


             