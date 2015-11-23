#lang racket

(require 2htdp/image)

; physical constants 
(define HEIGHT 300)
(define WIDTH  100)
(define YDELTA 3)

 
; graphical constants 
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))

(define ROCKET-CENTER (/ (image-height ROCKET) 2))

; A LRCD (short for: launching rocket count down) is one of:
; – "resting"
; – a number in [-3,-1]
; – a non-negative number 
; interpretation a rocket resting on the ground, in count-down mode, 
; or the number of pixels from the top i.e. its height

(define (show x)
  (cond
    [(string? x)
     (if (string=? x "resting")
         (place-image ROCKET 10 (- HEIGHT ROCKET-CENTER) BACKG)
         x)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (place-image ROCKET
                               10 (- HEIGHT ROCKET-CENTER)
                               BACKG))]
    [(>= x 0)
     (place-image ROCKET 10 (- x ROCKET-CENTER) BACKG)]))



