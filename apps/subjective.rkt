#lang racket

(require "utils.rkt")
(require "info.rkt")

;; File exists
;; File created earlier
;; Rating exists
;; Rating beyond limits

;; file file -> boolean
;; Checks if the given file is expired.
(define (expired? rating-file exercise-file)
  (apply < (map file-or-directory-modify-seconds (list rating-file exercise-file))))

;; symbol -> any-value or 'na
;; Dynamically loads a given variable from a file.
;; Return 'na for not available when the variable
;; is not present.
(define (require-var file v)
  (dynamic-require file v (lambda () 'na)))

;; username username exercise -> (list clarity simplicity feel cleverness)
;; Returns the rating provided by the author to the rater on the given exercise.
(define (rating author rater exercise)
  (let ([rtg-file (rating-file author rater exercise)]
        [exr-file (exercise-file author exercise)])
  (cond
    [(file-exists? rtg-file) 
                      (let* ([result (require-var rtg-file 'result)])

                        (cond
                          [(list? result)
                         (if (= (length (filter (lambda (n) (not (equal? n 'na))) result))  4) result 'na)]
                          [else result]))]
                                                          
                         
    [else 'unevaluated])))

;; A rating-list is (list clarity simplicity feel cleverness)
;; where clarity simplicity feel and cleverness are each numbers.
;; username exercise -> rating-list
;; Ratings by all users on the given exercise of the author
(define (ratings-for-exercise author exercise)
  (map (lambda (i) (rating author i exercise)) MEMBERS))

;; username (list exercise) -> (list rating-list)
(define (ratings author exercises)
  (map (lambda (i) (ratings-for-exercise author i)) exercises))

(provide ratings)             
