;#lang racket

;; TODOS
;; Sorting of names

(require "utils.rkt")
(require "subjective.rkt")


(define (objective-marks results)
(count (lambda (x) (equal? x #true)) results))


;; A person's mark for each exercise is:
;; Objective + Subjective + Rating for Others
;; Objective will be 10 marks per test.
;; Subjective will be 10 marks overall:
;; Clarity (Variables, Comments) : 4
;; Simplicity : 2
;; Cleverness : 2
;; Feel : 2
;; Ratings will be granted 5/headcount marks
(display
(string-join
(list (h1 "HTDP Study Group")
      (h2 "Leaderboard"))
"\n"))
