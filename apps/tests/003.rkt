#lang racket

(define (test1 result)
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

(define test (list test1))

(provide test)