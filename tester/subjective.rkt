#lang racket

(require "utils.rkt")

;; This file does all the file/directory reading.

(define (get-directory-numbers name)
   (filter number? (map 
    (lambda (n)
      (string->number (path->string n)))
      (filter (lambda (n) (directory-exists? (build-path "../" name n))) (directory-list (string-append "../" name))))))

(define (last-done name)
  (cons name (apply max (get-directory-numbers name))))

(define (done members)
  (map last-done members))

;; File exists
;; File created earlier
;; Rating exits
;; Rating beyond limits
(define (rated? author rater exercise)
 (file-exists? (rating-file author rater exercise)))

(define (expired? rating-file exercise-file)
  (apply < (map file-or-directory-modify-seconds (list rating-file exercise-file))))

(define (get-rating author rater exercise)
  (let ([rtg-file (rating-file author rater exercise)]
        [exr-file (exercise-file author exercise)])
  (cond
    [(file-exists? rtg-file) (if (expired? rtg-file exr-file)
                      'expired
                      (let ([marks (dynamic-require rtg-file 'marks (lambda () 'unmarked))])
                        (cond
                          [(number? marks) (if (<= 0 marks 5) marks 'off-mark)]
                          [else marks])))]
                          
    [else 'unevaluated])))

;(namespace-variable-value 'x #t (lambda () "this"
 
(provide done)
(provide get-rating)