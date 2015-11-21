#lang racket

(require 2htdp/image)
(require 2htdp/universe)

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
(define TREE
  (underlay/xy (circle 10 "solid" "darkgreen")
               7 15
               (rectangle 4 20 "solid" "brown")))
(define TREE-SET(overlay/xy TREE
           20 0
           TREE))
(define BACKGROUND (empty-scene 400 80))
(define Y-CAR (- 50 (/ (image-height CAR) 2)))

; AnimationState is a Number
; interpretation the number of clock ticks since the animation started 

; AnimationState -> Image
; places the car into a scene according to the given animation state
(define (render as)
 (overlay/align/offset "middle" "bottom"
  TREE-SET
  -100 0
  (place-image/align CAR as (+ (* 5 (sin (/ as 30))) Y-CAR) "right" "middle" BACKGROUND)))

(check-expect (render 50) (overlay/align/offset "middle" "bottom"
  TREE-SET
  -100 0
  (place-image/align CAR 50 (+ (* 5 (sin (/ 50 30))) Y-CAR) "right" "middle" BACKGROUND)))
(check-expect (render 100) (overlay/align/offset "middle" "bottom"
  TREE-SET
  -100 0
  (place-image/align CAR 100 (+ (* 5 (sin (/ 100 30))) Y-CAR) "right" "middle" BACKGROUND)))

(check-expect (render 150) (overlay/align/offset "middle" "bottom"
  TREE-SET
  -100 0
  (place-image/align CAR 150 (+ (* 5 (sin (/ 150 30))) Y-CAR) "right" "middle" BACKGROUND)))
(check-expect (render 200) (overlay/align/offset "middle" "bottom"
  TREE-SET
  -100 0
  (place-image/align CAR 200 (+ (* 5 (sin (/ 200 30))) Y-CAR) "right" "middle" BACKGROUND)))

; AnimationState -> AnimationState 
; add 3 to the current clock tick
; example: 
; given: 20, expect 23
; given: 78, expect 81
(define (tock as)
  (+ as 3))

(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

; AnimationState -> Boolean
; checks whether the given animation state is within a specific range
(define (end? n)
  (>= n 450))

(check-expect (end? 50) (>= 50 400))
(check-expect (end? 100) (>= 100 400))
(check-expect (end? 150) (>= 150 400))
(check-expect (end? 200) (>= 200 400))

(big-bang 0
          [to-draw render]
          [on-tick tock]
          [stop-when end?])

       
           

