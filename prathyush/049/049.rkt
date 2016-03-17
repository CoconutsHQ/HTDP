#lang racket
(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-gui)

(define CANVAS-WIDTH 200)
(define CANVAS-HEIGHT 10)
(define CANVAS (empty-scene CANVAS-WIDTH CANVAS-HEIGHT))

; Number -> Number
; Halves a given value.
(define (half val)
  (/ val 2))

;; Converts happiness to pixels.
(check-expect (happiness->px 100) CANVAS-WIDTH)
(check-expect (happiness->px 0) 0)
(check-expect (happiness->px 50) (/ CANVAS-WIDTH 2))

; Number -> Number
; Normalizes the CANVAS-WIDTH to a scale of 100
(define (happiness->px h)
  (* (/ h 100) CANVAS-WIDTH))

; Number -> Image
; Draws a gauge-bar of given number


(define (gauge-bar happiness)
  (rectangle (happiness->px happiness) CANVAS-HEIGHT "solid" "red"))
  
; Number -> Image
; Renders the bar with it's left end placed on
; the left side of the canvas
(define (render happiness)
  (place-image (gauge-bar happiness) (half (image-width (gauge-bar happiness))) (half CANVAS-HEIGHT) CANVAS))

; Number -> Number
; Happiness decreases by 0.1 every clock tick.
(define (tock happiness)
  (cond
    [(< (- happiness 0.1) 0) 0]
    [(> happiness 100) 100]
    [else (- happiness 0.1)]))

; Number String -> Number
(define (yipee s ke)
  (cond
    [(string=? "up" ke) (+ s (* s 1/3))]
    [(string=? "down" ke) (+ s (* s 1/5))]
    [else s]))

; Number -> World Program
; Draws a level gauge that
; decreases by 0.1 in each clock
; tick. Arrow Keys can be used
; to drive the level up or down.
(define (gauge-prog happiness)
  (big-bang happiness
          [on-tick tock]
          [on-key yipee]
          [to-draw render]))

(test)