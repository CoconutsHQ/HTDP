#lang racket

(require 2htdp/batch-io)

(require "../../prathyush/033/033.rkt")

(define (test1 f)
(f "033-file.dat" "033-file2.dat" "033-file3.dat" "033-test.dat")
(equal? (read-file "033-test.dat")
   "Dear Sasi,\n\nWe have discovered that all people with the last name \nSasankan have won our lottery. So, Sasi, \nhurry and pick up your prize.\n\nSincerely,\n\nBarghavi Amma"))

(define test (list test1))
(provide test)
