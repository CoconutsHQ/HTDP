#lang racket

(require "utils.rkt")
(require "info.rkt")

;; File exists
;; File created earlier
;; Rating exists
;; Rating beyond limits

(define (expired? rating-file exercise-file)
  (apply < (map file-or-directory-modify-seconds (list rating-file exercise-file))))

(define (rating-status author rater exercise)
  (let ([rtg-file (rating-file author rater exercise)]
        [exr-file (exercise-file author exercise)])
  (cond
    [(file-exists? rtg-file) (if (expired? rtg-file exr-file)
                      'expired
                      (let ([marks (dynamic-require rtg-file 'marks (lambda () 'unmarked))])
                        (if (<= 0 marks 10) #true 'off-mark)))]
                          
    [else 'unevaluated])))

(define (rating author rater exercise)
  (let ([rtg-file (rating-file author rater exercise)]
        [exr-file (exercise-file author exercise)])
  (cond
    [(file-exists? rtg-file) 
                      (let ([marks (dynamic-require rtg-file 'marks (lambda () 'na))])
                        (if (<= 0 marks 10) marks 'na))]
                         
    [else 'na])))

(define (ratings-for-exercise author exercise)
  (map (lambda (i) (rating author i exercise)) MEMBERS))

(define (ratings author exercises)
  (map (lambda (i) (ratings-for-exercise author i)) exercises))

(provide ratings)             