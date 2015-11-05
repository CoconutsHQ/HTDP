#lang racket

(require "utils.rkt")
(require "info.rkt")
(require "objective.rkt")
(require "subjective.rkt")
(require "ratings.rkt")

(define (user-dir author file)
  (string-append "../" author "/" file))

(define (sum-list l)
  (apply + (filter number? l)))

(define (avg-list l)
  (let ([len (length (filter number? l))])
    (if (> len 0)
        (* (/ (sum-list l) len) 1.0)
        'na)))

(define (sum-rows rows)
  (map sum-list rows))

(define (avg-rows rows)
  (map avg-list rows))

(define (report header table footer)
  (string-join
   (list header
   (render table)
   footer) "\n"))

(define (net-score achieved achievable)
  (string-append "You have achieved: "
                 (number->string achieved)
                 "/"
     (number->string achievable) " marks"))

(define (every-number? row)
  (andmap number? row))

;; A rating table is
;; idx | Quantity | Quantity | ... | Aggregate |
;; 1 | value    | value    | ... | value     |
;; 2 | value    | value    | ... | value     |
;; 3 | value    | value    | ... | value     |

;; There are three types of rating tables:

;; 1) Per user table

(define (per-user-table headers idx quantity aggregate)
  (align (cons headers (insert-right (insert-left quantity idx) aggregate)) '(left right)))

;; Objective
;; ---------
;; headers : Q. Test1 Test2 ... Total
;; idx : all done questions of user
;; Quantity : Tests of each question
;; Aggregate : Sum of all tests

(define (per-user-header headers agg)
  (append (cons "Q. " headers) (list agg)))

(define (obj-table author)
  (let* (
        [ids (all-done author)]
        [results (obj-test-results author ids)]
        [mx (max-test-count results)]
        [uniform-results (uniformize results mx)]
        [headers (per-user-header (test-headers mx) "Total")]
        [agg (sum-rows results)]
        [net (sum-list agg)])
    (report
     (h1 (string-append (first-name author) " (Objective)"))
         (per-user-table headers ids uniform-results agg)
         (net-score net (* (length (filter every-number? results)) 10)))))

; No need to uniformize.
(define (sub-table author)
  (let* ([ids (all-done author)]
         [results (ratings author ids)]
         [headers (per-user-header (map first-name MEMBERS) "Average")]
         [agg (avg-rows results)]
         [net (sum-list agg)])
    (report
     (h1 (string-append (first-name author) " (Subjective)"))
     (per-user-table headers ids results agg)
     (net-score net (* (length results) 10)))))

(define (rtg-table author)
  (let* ([ids (all-done author)]
         [results (ratings-status author ids)]
         [headers (per-user-header (map first-name MEMBERS) "Total: ")]
         [agg (assign-marks results)]
         [net (sum-list agg)])
    (report
     (h1 (string-append (first-name author) " (Ratings)"))
     (per-user-table headers ids results agg)
     (net-score net (* (length results) 10)))))

(define (sum-all results)
  (map sum-list results))

(define (all-results author qs)
  (map list (sum-rows (obj-test-results author qs))
       (avg-rows (ratings author qs))
       (assign-marks (ratings-status author qs))))

(define (all-table author)
   (let* ([ids (all-done author)]
         [results (all-results author ids)]
         [headers (per-user-header (list "Objective" "Subjective" "Rating") "Total: ")]
         [agg (sum-all results)]
         [net (sum-list agg)])
    (report
     (h1 (first-name author))
     (per-user-table headers ids results agg)
     (net-score net (* (length results) 30)))))
  
(define (export-obj author)
  (write! (user-dir author "objective.md") (obj-table author)))

(define (export-sub author)
  (write! (user-dir author "subjective.md") (sub-table author)))
  
(define (export-rtg author)
  (write! (user-dir author "ratings.md") (rtg-table author)))

(define (export-all author)
  (write! (user-dir author "readme.md") (all-table author)))

(define (export-users)
  (andmap (lambda (usr)
         (export-obj usr)
         (export-sub usr)
         (export-rtg usr)
         (export-all usr)) MEMBERS))