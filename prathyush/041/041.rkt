#lang racket
(require 2htdp/image)
(require 2htdp/universe)

(define WIDTH-OF-WORLD 200)
 
;; WHEEL-RADIUS is the single point of control.
;; Changing the wheel radius changes the size
;; of the car.
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle (* WHEEL-RADIUS 2) 10 WHEEL-RADIUS "white"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))

(define BODY-WIDTH (* 8 WHEEL-RADIUS))
(define BODY-HEIGHT (* WHEEL-RADIUS 3))

(define BOTTOM-BODY (rectangle BODY-WIDTH (/ BODY-HEIGHT 2) "solid" "gold"))

(define TOP-BODY (rectangle (* 6 WHEEL-RADIUS) (/ BODY-HEIGHT 2) "solid" "gold"))

(define CHASSIS (overlay/xy TOP-BODY 0 (/ BODY-HEIGHT 2) BOTTOM-BODY))

(define CAR (overlay/xy CHASSIS WHEEL-RADIUS (- BODY-HEIGHT (/ WHEEL-RADIUS 2))  BOTH-WHEELS))

(define BACKGROUND (empty-scene 200 50))

; WorldState -> Image
; places the image of the car x pixels from the left margin of
; the BACKGROUND image 
(define (render x)
  (place-image WHEEL x 30 BACKGROUND))
 
; WorldState -> WorldState
; adds 3 to x to move the car right 
(define (tock x)
  x)

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]))