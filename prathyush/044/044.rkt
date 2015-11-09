#lang racket
(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-gui)

; WorldState is a Number
; interpretation the x-coordinate of right-most edge of car

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

;; There seems to be a 1px error when trying to exactly
;; position the car. Better way might be to draw the
;; chassis as one piece.
(define CHASSIS (overlay/xy TOP-BODY 0 (- (half BODY-HEIGHT) 1) BOTTOM-BODY))

(define CAR (underlay/xy
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
; places the front of the car x pixels from the left margin of
; the BACKGROUND image 
(define (render x)
  (place-image CAR
               (- x (half (image-width CAR)))
               (- CANVAS-HEIGHT (half (image-height CAR))) BACKGROUND))
 
; WorldState -> WorldState 
; moves the car by three pixels every time the clock ticks
; example: 
(define (tock ws)
  (+ ws 3))

; Number -> Boolean
; Checks if the CAR crosses the BACKGROUND.
; Offset by CAR-WIDTH is needed because
; loc is car's front edge.
(define (exceeds-canvas? loc)
         (> loc (+ CAR-WIDTH CANVAS-WIDTH)))

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [stop-when exceeds-canvas?]
     [to-draw render]))

