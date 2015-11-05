#lang racket

(define (test1 result)
  (or (string=? result "elloworld")
      (string=? result "hlloworld")
      (string=? result "heloworld")
      (string=? result "hellworld")
      (string=? result "helloorld")
      (string=? result "hellowold")
      (string=? result "helloword")
      (string=? result "helloworl")))

(define test (list test1))

(provide test)