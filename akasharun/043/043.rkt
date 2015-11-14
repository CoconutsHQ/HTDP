;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |043|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


; WorldState -> Image
; places the car into a scene according to the given world state

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
(define Y-CAR (- 80 (/ (image-height CAR) 2)))
(define (render ws)
 (overlay/align/offset "middle" "bottom"
  TREE-SET
  -100 0
  (place-image CAR ws Y-CAR BACKGROUND)))
(define (end? n)
  (>= n 400))

(big-bang 0
          [to-draw render]
          [on-tick add1]
          [stop-when end?])
       
           

