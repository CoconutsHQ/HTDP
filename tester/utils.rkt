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

(define ROW-START "| ")
(define ROW-END " |")
(define HDIV " | ")

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
         (let* ([title-len (string-length title)])
         (string-append title (space (- total-width title-len))))) headers widths)))

(define (display-vertical-divs headers widths)
  (build-row
   (map (lambda (item total-width)
            (build-string total-width (lambda (i) #\-))) headers widths)))

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
                     (display-vertical-divs titles widths)
                     (string-join (map (lambda (r) (display-row r widths)) rows) "\n"))
               "\n")))

(define (h1 text)
  (let ((len (string-length text)))
    (string-join (list text (build-string len (lambda (i) #\=))) "\n")))

(define (h2 text)
    (let ((len (string-length text)))
    (string-join (list text (build-string len (lambda (i) #\-))) "\n")))

(provide pad3)
(provide rating-file)
(provide exercise-file)
(provide hgroup)
(provide table)
(provide h1)
(provide h2)