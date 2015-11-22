#lang racket

(require 2htdp/image)

; physical constants 
(define HEIGHT 300)
(define WIDTH  100)
(define YDELTA 3)
(define X-ROCKET 10)

 
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

; LRCD -> Image
; renders the state as a resting or flying rocket

(check-expect (show "resting") (rocket "resting"))
(check-expect (show -2) (place-image (text (number->string -2) 20 "red")
                  10 (* 3/4 WIDTH)
                  (rocket -2)))
(check-expect (show 150) (rocket 150))
(define (show x)
  (cond
    [(or (string? x) (>= x 0)) (rocket x)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (rocket x))]))
    
; LRCD -> Image
; place the image of a rocket into the scene according to the given world state
(define (rocket x)
  (cond
    [(string? x) (if (string=? x "resting")
          (place-image ROCKET X-ROCKET (- HEIGHT ROCKET-CENTER) BACKG)
          x)]
    [(<= -3 x -1) (place-image ROCKET X-ROCKET (- HEIGHT ROCKET-CENTER) BACKG)]
    [else (place-image ROCKET X-ROCKET (- x ROCKET-CENTER) BACKG)]))


    




