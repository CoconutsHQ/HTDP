#lang racket

(require "utils.rkt")
(require "info.rkt")


;; File exists
;; File created earlier
;; Rating exists
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

(define (get-average results)
  (map (lambda (i)
         (let* ((results (filter number? i))
               (len (length results)))
           (if (> len 0)
               (/ (apply + results) len)
               'na)))
           results))

(define (per-user-result author)
  (let* ((indices (all-done author))
        (ratings (map (lambda (i) (ratings-for-exercise author i)) indices))
        (averages (get-average ratings)))
        (cons (append (list "Q.   ") (map first-name MEMBERS) (list "Average"))
         (insert-right (insert-left ratings indices) averages))))


(define (per-user author)
  (let* ((results (per-user author))
         (averages (filter number? (map last results)))
         (sum (apply + averages)))
  (delineate
   (list
    (h1 (string-append (first-name author) " (Subjective)"))
    (render (align (per-user-result author) '(left right)))
    (string-append "\nYou have achieved: " (number->string sum)
                   "/" (number->string (* (length (all-done author)) 10)) " marks")))))
  
             