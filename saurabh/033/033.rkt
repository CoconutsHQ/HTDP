#lang racket
(require 2htdp/batch-io)

(define (main fst lst sign out)
  (write-file out
              (letter (read-file fst)
                      (read-file lst)
                      (read-file sign))))


(define (letter fst lst sign) 
        (string-append 
        (opening fst)
        "\n" "\n"
        (body fst lst)
        "\n" "\n"
        (signature sign)
        "\n"))

(define (opening fst) (string-append 
                       "Dear " fst ","))
  
(define (body fst lst) (string-append
                        "We have discovered that all people with the last name " "\n"
                        lst " have won our lottery. So, " fst ", " "\n"
                        "hurry and pick up your prize."))
(define (signature sign)  (string-append "\n" "yours sincerely " "\n" sign))

  
(main "1.dat" "2.dat" "3.dat" "sau.dat")
(define result out)
(provide result)