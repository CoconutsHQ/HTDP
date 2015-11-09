#lang racket
(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-gui)

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
; moves the car by three pixels every time the clock ticks
; example: 
(define (tock ws)
  (+ ws 3))

(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(test)

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]))