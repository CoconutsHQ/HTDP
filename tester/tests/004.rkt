#lang racket

(define (test4 result)
  (or (string=? result "elloworld")
      (string=? result "hlloworld")
      (string=? result "heloworld")
      (string=? result "hellworld")
      (string=? result "helloorld")
      (string=? result "hellowold")
      (string=? result "helloword")
      (string=? result "helloworl")))

(provide test4)