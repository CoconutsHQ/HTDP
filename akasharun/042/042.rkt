#lang racket

(require 2htdp/image)

(define WHEEL-RADIUS 6)
(define WHEEL (overlay (circle (/ WHEEL-RADIUS 2) "solid" "white")
                       (circle WHEEL-RADIUS "solid" "black")))
(define WHEEL-PAIR (overlay/xy WHEEL
                               (* WHEEL-RADIUS 4) 0
                               WHEEL))
(define BODY (overlay/align/offset
              "middle" "top"
              (rectangle (* WHEEL-RADIUS 8) (* WHEEL-RADIUS 2) "solid" "red")
              (- (/ WHEEL-RADIUS 10)) (- (/ (* WHEEL-RADIUS 2) 2))
               (ellipse (* WHEEL-RADIUS 6) (* WHEEL-RADIUS 2.5) "solid" "red")))
(define CAR (overlay/align/offset
             "middle" "bottom"
             WHEEL-PAIR
             0 (- (/ (* WHEEL-RADIUS 2) 2))
             BODY))
(define BACKGROUND (empty-scene 400 30))
(define Y-CAR (- 30 (/ (image-height CAR) 2)))

; WorldState is a Number
; interpretation the number of pixels between the left border and the car

; WorldState -> Image
; places the car into a scene according to the given world state
(define (render ws)
  (place-image CAR ws Y-CAR BACKGROUND))

(check-expect (render 50) (place-image CAR 50 Y-CAR BACKGROUND))
(check-expect (render 100) (place-image CAR 100 Y-CAR BACKGROUND))
(check-expect (render 150) (place-image CAR 150 Y-CAR BACKGROUND))
(check-expect (render 200) (place-image CAR 200 Y-CAR BACKGROUND))
