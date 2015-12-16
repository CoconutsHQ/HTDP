;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |019|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)
(define (image-classify  x)
  (cond [( < (image-height x) (image-width x)) "wide" ]
         [( > (image-height x) (image-width x)) "tall" ]
         [ (image? x)"square"]))
(define result (list image-classify))
(provide result)