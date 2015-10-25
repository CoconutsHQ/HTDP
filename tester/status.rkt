#lang racket

(require racket/contract)

;; This file does all the file/directory reading.

(define members
  (list "akasharun" "pranav" "prathyush" "saurabh"))

(define (pad n count)
  (if (< (string-length n) count) (pad (string-append "0" n)
                                       count)
      n))

(define (get-directory-numbers name)
   (filter number? (map 
    (lambda (n)
      (string->number (path->string n)))
      (filter (lambda (n) (directory-exists? (build-path "../" name n))) (directory-list (string-append "../" name))))))

(define (last-done name)
  (cons name (apply max (get-directory-numbers name))))

(define (done members)
  (map last-done members))

(define (exercise-file author exercise)
  (let ([num (number->string exercise)])
  (string-append "../" author "/" (pad num 3) "/" (pad num 3) ".rkt")))

(define (rating-file author rater exercise)
  (let* ([full-number (pad (number->string exercise) 3)])
         (string-append "../" author "/" full-number "/" rater ".rkt")))

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
(provide pad)
(provide members)