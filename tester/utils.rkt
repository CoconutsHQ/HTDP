#lang racket

(define (pad n count)
  (if (< (string-length n) count) (pad (string-append "0" n)
                                       count)
      n))

(define (pad3 n) (pad n 3))

(define (exercise-file author exercise)
  (let ([num (number->string exercise)])
  (string-append "../" author "/" (pad num 3) "/" (pad num 3) ".rkt")))

(define (rating-file author rater exercise)
  (let* ([full-number (pad (number->string exercise) 3)])
         (string-append "../" author "/" full-number "/" rater ".rkt")))

(define (vdiv c)
  (build-string c (lambda (i) #\-)))

(define ROW-START "|")
(define ROW-END "|")
(define HDIV "|")

(define (space n)
  (build-string n (lambda (i) #\space)))

(define (wrap-row r)
  (string-append ROW-START r ROW-END))

(define (build-row r)
  (wrap-row (string-join r HDIV)))

(define (hgroup title width align)
  (list (cons 'title title)
        (cons 'width width)
        (cons 'align align)))

(define (display-headers headers widths)
  (build-row (map (lambda (title total-width)
         (let* ([title-len (string-length title)]
                [space-count (- total-width title-len)])
         (string-append title (space (if (< space-count 0) 0 space-count))))) headers widths)))

(define (align st a)
  (if (symbol=? a 'left) (string-append ":" st)
      (string-append st ":")))

(define (header-div headers widths aligns)
  (build-row
   (map (lambda (item total-width al)
            (align (build-string (sub1 total-width) (lambda (i) #\-)) al)) headers widths aligns)))

(define (str item)
  (cond [(number? item) (number->string item)]
                      [else item]))

(define (display-row r widths)
  (build-row (map (lambda (item item-width)
                    (let ([s (str item)])
                          (string-append s (space (- item-width (string-length s)))))) r widths)))

(define (collect-row k row)
  (map (lambda (h) (dict-ref h k)) row))

(define (table headers rows)
  (let* ((titles (collect-row 'title headers))
         (widths (collect-row 'width headers))
         (aligns (collect-row 'align headers)))
  (string-join (list (display-headers titles widths)
                     (header-div titles widths aligns)
                     (string-join (map (lambda (r) (display-row r widths)) rows) "\n"))
               "\n")))

(define (h1 text)
  (let ((len (string-length text)))
    (string-join (list text (build-string len (lambda (i) #\=))) "\n")))

(define (h2 text)
    (let ((len (string-length text)))
    (string-join (list text (build-string len (lambda (i) #\-))) "\n")))

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

(provide pad3 rating-file exercise-file hgroup table h1 h2 done)