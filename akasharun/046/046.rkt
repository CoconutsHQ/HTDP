;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |046|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


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

; WorldState is a Number
; interpretation the number of pixels between the left border and right-most edge of the car

; WorldState -> Image
; places the car into a scene according to the given world state
(define (render ws)
 (overlay/align/offset "middle" "bottom"
  TREE-SET
  -100 0
  (place-image/align CAR ws Y-CAR "right" "middle" BACKGROUND)))

(check-expect (render 50) (overlay/align/offset "middle" "bottom"
  TREE-SET
  -100 0
  (place-image/align CAR 50 Y-CAR "right" "middle" BACKGROUND)))
(check-expect (render 100) (overlay/align/offset "middle" "bottom"
  TREE-SET
  -100 0
  (place-image/align CAR 100 Y-CAR "right" "middle" BACKGROUND)))

(check-expect (render 150) (overlay/align/offset "middle" "bottom"
  TREE-SET
  -100 0
  (place-image/align CAR 150 Y-CAR "right" "middle" BACKGROUND)))
(check-expect (render 200) (overlay/align/offset "middle" "bottom"
  TREE-SET
  -100 0
  (place-image/align CAR 200 Y-CAR "right" "middle" BACKGROUND)))

; WorldState -> WorldState 
; moves the car by three pixels every time the clock ticks
; example: 
; given: 20, expect 23
; given: 78, expect 81
(define (tock ws)
  (+ ws 3))

(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

; WorldState Number Number String -> WorldState
; places the car at the x-coordinate if me is "button-down"
; given: 21 10 20 "enter"
; wanted: 21
; given: 42 10 20 "button-down"
; wanted: 10
; given: 42 10 20 "move"
; wanted: 42
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

(check-expect (hyper 21 10 20 "enter")
              (cond
                [(string=? "button-down" "enter") 10]
                [else 21]))
(check-expect (hyper 42 10 20 "button-down")
              (cond
                [(string=? "button-down" "button-down") 10]
                [else 42]))
(check-expect (hyper 42 10 20 "move")
              (cond
                [(string=? "button-down" "move") 10]
                [else 42]))
; WorldState -> Boolean
; checks whether the given world state is within a range
(define (end? n)
  (>= n 450))

(check-expect (end? 50) (>= 50 400))
(check-expect (end? 100) (>= 100 400))
(check-expect (end? 150) (>= 150 400))
(check-expect (end? 200) (>= 200 400))

(define (main ws)
  (big-bang ws
          [to-draw render]
          [on-tick tock]
          [on-mouse hyper]
          [stop-when end?]))
(main 1)


       
           

