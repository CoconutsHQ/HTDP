#lang racket

(require "info.rkt")
;; DIRECTORY UTILITIES
;; *******************

;; Exercises follow a naming pattern of 00x
;; pad and pad3 functions are used to achieve
;; this style.

;; Example
;; (pad3 3) => 003

;; string number -> string
(define (pad n count)
  (if (< (string-length n) count)
      (pad (string-append "0" n) count)
      n))

;; string -> string
(define (pad3 n) (pad n 3))

;; Given an author and an exercise, gives
;; the corresponding exercise file.

;; Exercise pattern is
;; author/exercise-num/exercise-num.rkt

;; Sample:
;; sasi/001/001.rkt

;; string number -> string
(define (exercise-file author exercise)
  (let ([num (number->string exercise)])
  (string-append "../" author "/" (pad num 3) "/" (pad num 3) ".rkt")))

;; Rating file

;; string number -> string
(define (rating-file author rater exercise)
  (let* ([full-number (pad (number->string exercise) 3)])
         (string-append "../" author "/" full-number "/" rater ".rkt")))


;; This file does all the file/directory reading.
(define (get-directory-numbers name)
   (filter number? (map 
    (lambda (n)
      (string->number (path->string n)))
      (filter (lambda (n) (directory-exists? (build-path "../" name n))) (directory-list (string-append "../" name))))))

;; Gets the last done exercise of a given member.
(define (last-done name)
  (cons name (apply max (get-directory-numbers name))))

;; Gets the last done exercise of all members.
(define (done members)
  (map last-done members))

;; TABLE
;; ******

;; Horizontal divider for table
(define (hdiv c)
  (build-string c (lambda (i) #\-)))

;; Indicators
;; -----------
(define ROW-START "|")
(define ROW-END "|")
(define HDIV "|")

(define (space n)
  (build-string n (lambda (i) #\space)))

;; Delimits a given row.
;; "apple | orange | lemon" => "| apple | orange | lemon |"
(define (delimit r)
  (string-append ROW-START r ROW-END))

;; concatenates row elements
;; ("hey" "there") -> "| hey | there |"
(define (concat-row r)
  (delimit (string-join r HDIV)))
  
(define (set-align st a)
  (cond
    ((symbol=? a 'left) (string-append ":" (substring st 1)))
    ((symbol=? a 'right) (string-append (substring st 1) ":"))
    ((symbol=? a 'center) (string-append ":" (substring st 2) ":"))
    (else st)))

(define (head-divs widths)
  (map hdiv widths))

(define (content-space content width)
  (let* ([len (string-length content)]
                         [space-count (- width len)])
    (if (< space-count 0) 0 space-count)))

(define (str item)
  (cond [(number? item) (number->string item)]
        [(symbol? item) (lookup item)]
                      [else item]))

(define (space-row-element content width)
  (let ((content (str content)))
   (string-append content (space (content-space content width)))))
                
(define (build-row row-elements widths)
  (map space-row-element row-elements widths))

(define (delineate l)
  (string-join l "\n"))

(define (non-empty-rows table)
(filter (lambda (i) (not (empty? i))) table))

(define (align tbl aligns)
  (let* ((widths (map string-length (first tbl)))
         (rows (rest tbl))
          (divs (align-divs (head-divs widths) aligns)))
    (list* (first tbl) divs rows)))

 (define (render tbl)
   (let* ((widths (map string-length (first tbl)))
         (spacer (lambda (r) (build-row r widths))))
  (delineate (map concat-row (non-empty-rows (map spacer tbl))))))

(define (repeat-last alignments)
  (cond
    ((empty? (rest alignments)) alignments)
    (else (rest alignments))))
   
(define (align-divs divs alignments)
  (cond
    ((empty? divs) empty)
    (else (cons (set-align (first divs) (first alignments))
          (align-divs (rest divs) (repeat-last alignments))))))

(define (print-table table)
  (display (render table)))

(define (insert-left table row)
  (map cons row table))

(define (insert-right table row)
  (map (lambda (item row) (append row (list item))) row table))

(define (insert-bottom table row)
  (append table (list row)))


;; HEADERS
;; *******

(define (h1 text)
  (let ((len (string-length text)))
    (string-join (list text (build-string len (lambda (i) #\=))) "\n")))

(define (h2 text)
    (let ((len (string-length text)))
    (string-join (list text (build-string len (lambda (i) #\-))) "\n")))

;; EXPORT
;; *******

(define (write! file input)
  (let ((out (open-output-file file #:mode 'text #:exists 'replace)))
    (display input out)
    (close-output-port out)))

(provide pad3 rating-file exercise-file h1 h2 align render insert-left insert-right insert-bottom print-table done write!)