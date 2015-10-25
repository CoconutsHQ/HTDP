#lang racket

;; TODOS

;; Map based representation
;; 2 results for a single question
;; Latest exercise

(define (name prefix)
  (cond
    [(equal? prefix 'prt) "prathyush"]
    [(equal? prefix 'ash) "akasharun"]
    [(equal? prefix 'sau) "saurabh"]
    [(equal? prefix 'prn) "Pranav"]
  (else "unknown")))

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
   (apply string-append (let ([user (name prefix)])
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
                        
                 
(define finish-count (min 19 5 22 17))

(define (all-requires)
 (apply string-append (map (lambda (n) (require-generator n finish-count))
     (list 'ash 'prn 'prt 'sau))))

(define (all-provides)
  (apply string-append (map (lambda (n) (provide-generator n finish-count))
                            (list 'ash 'prn 'prt 'sau))))
  
  
 
(define (export)
  (let ([out (open-output-file "requires.rkt" #:mode 'text #:exists 'replace)])
    (display "#lang racket\n\n" out)
(display (all-requires) out)
(display (all-provides) out)
(close-output-port out)))
