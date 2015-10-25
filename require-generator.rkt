#lang racket

(require "status.rkt")

(define PERSONS members)

(define EXERCISES-DONE (status (map cdr members)))




(define (pad n count)
  (if (< (string-length n) count) (pad (string-append "0" n)
                                       count)
      n))

(define (wrap-require st)
  (string-append "(require " st ")\n"))

(define (ignore n)
  (if (member n (list 5 6 7 9 10)) #true
      #false))

(define (require-generator prefix amount)
  (wrap-require
   (apply string-append (let ([user (dict-ref PERSONS prefix)])
  (map (lambda [n]
         (let* ([num (number->string n)]
                [num-str (pad num 3)])
         (string-append (if (ignore n) ";" "")
          "(prefix-in " (symbol->string prefix) num ": "
                        "\"" user "/" num-str "/" num-str ".rkt\")\n")))
       (range 1 (+ amount 1)))))))

(define (provide-generator prefix amount)
  (apply string-append (map (lambda (n)
         (let ([name (string-append (symbol->string prefix)
                                   (number->string n))])
           (if (ignore n) ""
         (string-append "(define " name " " name ":result)\n"
                        "(provide " name ")\n")))) (range 1 (+ amount 1)))))

(define MIN-DONE (apply min (map cdr EXERCISES-DONE)))

(define (all-requires)
 (apply string-append (map (lambda (n) (require-generator n MIN-DONE))
     (list 'ash 'prn 'prt 'sau))))

(define (all-provides)
  (apply string-append (map (lambda (n) (provide-generator n MIN-DONE))
                            (list 'ash 'prn 'prt 'sau))))

(define (export)
  (let ([out (open-output-file "requires.rkt" #:mode 'text #:exists 'replace)])
    (display "#lang racket\n\n" out)
(display (all-requires) out)
(display (all-provides) out)
(close-output-port out)))