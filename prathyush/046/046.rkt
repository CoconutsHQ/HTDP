#lang racket
(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-gui)

; WorldState is a Number
; interpretation the number of pixels between the left border and the car

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

(define BOTTOM-BODY (rectangle BODY-WIDTH (/ BODY-HEIGHT 2) "solid" "gold"))

(define TOP-BODY (rectangle (* 6 WHEEL-RADIUS) (/ BODY-HEIGHT 2) "solid" "gold"))

(define CHASSIS (overlay/xy TOP-BODY 0 (- (/ BODY-HEIGHT 2) 1) BOTTOM-BODY))

(define CAR (underlay/xy
             CHASSIS WHEEL-RADIUS
             (- BODY-HEIGHT (/ WHEEL-RADIUS 2))
             BOTH-WHEELS))

(define CAR-WIDTH (image-width CAR))

(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define CANVAS-HEIGHT 50)
(define CANVAS-WIDTH 200)

(define BACKGROUND (place-image TREE (/ CANVAS-WIDTH 2)
                                (image-height TREE)
                                (empty-scene 200 50)))

; WorldState -> Image
; places the image of the car x pixels from the left margin of
; the BACKGROUND image 
(define (render x)
  (place-image CAR x (- CANVAS-HEIGHT
                        (/ (image-height CAR) 2)) BACKGROUND))
 
; WorldState -> WorldState 
; moves the car by three pixels every time the clock ticks
; example: 
(define (tock ws)
  (+ ws 3))

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [on-mouse hyper]
     [to-draw render]))

; WorldState Number Number String -> WorldState
; places the car at the x-coordinate if me is "button-down" 
(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)

; WorldState Number Number String -> WorldState
; places the car at the x-coordinate if me is "button-down" 
(define (hyper x-position-of-car x-mouse y-mouse me)
  x-position-of-car)

(test)