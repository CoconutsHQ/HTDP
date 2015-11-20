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
 (let ([marks (rating author rater exercise)])
   (cond
     [(list? marks) (cond
                      [(andmap number? marks)
   (<= 0 (apply + marks) 11)]
                      [else 'na])]
     [else marks])))

(define (require-var file v)
  (dynamic-require file v (lambda () 'na)))

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

(define (ratings-for-exercise author exercise)
  (map (lambda (i) (rating author i exercise)) MEMBERS))

(define (ratings author exercises)
  (map (lambda (i) (ratings-for-exercise author i)) exercises))

(provide ratings)             