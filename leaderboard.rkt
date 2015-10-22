#lang racket

(require (prefix-in p1: "prathyush/001/001.rkt"))
(require (prefix-in p2: "prathyush/002/002.rkt"))
(require (prefix-in p3: "prathyush/003/003.rkt"))
(require (prefix-in p4: "prathyush/004/004.rkt"))

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

(define (marks results)
(count (lambda (x) (equal? x #true)) results))

(define prathyush
  (list (test1 p1:result)
        (test2 p2:result)
        (test3 p3:result)
        (test4 p4:result)))

(marks prathyush)