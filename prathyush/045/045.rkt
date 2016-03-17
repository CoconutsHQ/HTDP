#lang racket
(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-gui)

; AnimationState is a Number
; interpretation the number of clock ticks since the animation started

(define (half x) (/ x 2))
(define WIDTH-OF-WORLD 200)
 
;; WHEEL-RADIUS is the single point of control.
;; Changing the wheel radius changes the size
;; of the car.
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL (circle WHEEL-RADIUS "solid" "black"))

(define SPACE (rectangle (* WHEEL-RADIUS 2)
                         (* WHEEL-RADIUS 2)
                         WHEEL-RADIUS "white"))

(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))

(define BODY-WIDTH (* 8 WHEEL-RADIUS))
(define BODY-HEIGHT (* WHEEL-RADIUS 3))

(define BOTTOM-BODY (rectangle BODY-WIDTH (half BODY-HEIGHT) "solid" "gold"))

(define TOP-BODY (rectangle (* 6 WHEEL-RADIUS) (half BODY-HEIGHT) "solid" "gold"))


(define CHASSIS (overlay/xy TOP-BODY 0 (- (half BODY-HEIGHT) 1) BOTTOM-BODY))

(define CAR (overlay/xy
             CHASSIS WHEEL-RADIUS
             (- BODY-HEIGHT (half WHEEL-RADIUS))
             BOTH-WHEELS))

(define CAR-WIDTH (image-width CAR))

(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define CANVAS-HEIGHT 50)
(define CANVAS-WIDTH 200)

(define BACKGROUND (place-image TREE (half CANVAS-WIDTH)
                                (image-height TREE)
                                (empty-scene 200 50)))

; WorldState -> Image
; places the image of the car x pixels from the left margin of
; the BACKGROUND image 
(define (render t)
  (place-image CAR
               (- (* t 3) (half (image-width CAR)))
               (- CANVAS-HEIGHT (half (image-height CAR))) BACKGROUND))
 
; WorldState -> WorldState 
; Counts the number of clock ticks.
(define (tock as)
  (+ as 1))

; WorldState -> WorldState
; launches the program from some initial state 
(define (main as)
   (big-bang as
     [on-tick tock]
     [to-draw render]))

