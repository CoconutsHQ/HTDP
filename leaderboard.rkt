#lang racket

(require (prefix-in prt1: "prathyush/001/001.rkt"))
(require (prefix-in prt2: "prathyush/002/002.rkt"))
(require (prefix-in prt3: "prathyush/003/003.rkt"))
(require (prefix-in prt4: "prathyush/004/004.rkt"))
;(require (prefix-in p5: "prathyush/005/005.rkt"))
;(require (prefix-in p6: "prathyush/006/006.rkt"))
;(require (prefix-in p7: "prathyush/007/007.rkt"))
;(require (prefix-in p8: "prathyush/008/008.rkt"))
(require (prefix-in prt9: "prathyush/009/009.rkt"))
;(require (prefix-in p10: "prathyush/010/010.rkt"))
(require (prefix-in prt11: "prathyush/011/011.rkt"))
;(require (prefix-in p12: "prathyush/012/012.rkt"))
(require (prefix-in prt13: "prathyush/013/013.rkt"))
;(require (prefix-in p14: "prathyush/014/014.rkt"))
;(require (prefix-in p15: "prathyush/015/015.rkt"))
;(require (prefix-in p16: "prathyush/016/016.rkt"))
;(require (prefix-in p17: "prathyush/017/017.rkt"))
;(require (prefix-in p18: "prathyush/018/018.rkt"))
;(require (prefix-in p19: "prathyush/019/019.rkt"))
;(require (prefix-in p20: "prathyush/020/020.rkt"))
;(require (prefix-in p21: "prathyush/020/021.rkt"))
;(require (prefix-in p22: "prathyush/022/022.rkt"))

(require (prefix-in ash1: "akasharun/001/001.rkt"))
(require (prefix-in ash2: "akasharun/002/002.rkt"))
(require (prefix-in ash3: "akasharun/003/003.rkt"))
(require (prefix-in ash4: "akasharun/004/004.rkt"))

(require (prefix-in prn1: "Pranav/001/001.rkt"))

(require (prefix-in sau1: "saurabh/001/001.rkt"))


(define (test1 result)
  (= result 5))

(define (test2 result)
  (string=? result "hello_world"))

(define (test3 result)
  (or (string=? result "_helloworld")
      (string=? result "h_elloworld")
      (string=? result "he_lloworld")
      (string=? result "hel_loworld")
      (string=? result "hell_oworld")
      (string=? result "hello_world")
      (string=? result "hellow_orld")
      (string=? result "hellowo_rld")
      (string=? result "hellowor_ld")
      (string=? result "helloworl_d")
      (string=? result "helloworld_")))

(define (test4 result)
  (or (string=? result "elloworld")
      (string=? result "hlloworld")
      (string=? result "heloworld")
      (string=? result "hellworld")
      (string=? result "helloorld")
      (string=? result "hellowold")
      (string=? result "helloword")
      (string=? result "helloworl")))

(define (test9 result)
  (equal? result #false))

(define (test11 result)
  (= result 20))

(define (test13 f)
  (and (= (f 3 4) 5)
       (= (f 5 12) 13)))
 
(define (marks results)
(count (lambda (x) (equal? x #true)) results))

(define prathyush
  (list (list #true)
  (list)))

(define akash
  (list (list (test1 ash1:result)
        (test2 ash2:result)
        (test3 ash3:result)
        (test4 ash4:result)
        )
  (list)))

 (define pranav
  (list (list  (test1 prn1:result)
      ; (test2 ash2:result)
       ; (test3 ash3:result)
       ; (test4 ash4:result))
        )
  (list)))

 (define saurabh
  (list (list  (test1 sau1:result)
      ; (test2 ash2:result)
       ; (test3 ash3:result)
       ; (test4 ash4:result))
        )
  (list)))


(define (headers names)
  (for/list ([n names]
             [result (list akash pranav prathyush saurabh)])
  (string-append n "|" (number->string (marks (first result))) "|"
                 (number->string (marks (second result)))
                 "\n")))

(display "--------------------------------\n")
(display "Leaderboard\n")
(display "--------------------------------\n")
(display "| Name | Objective | Subjective |\n")
(display (apply string-append (headers '("Akash Arun" "Pranav" "Prathyush" "Saurabh"))))