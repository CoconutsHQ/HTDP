#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define (gauge-prog value)
  (overlay/align "left" "top"
                 (rectangle 200 20 "outline" "black")
                 (rectangle value 20 "solid" "red")))
(define (sub value)
  (- value 0.1))
(define (sub2 value)
  (+ value 1/3))
(define (sub3 value)
   (+ value 1/5))

(define (key value string)
  (cond
    [(key=? string "up") (sub2 value)]
    [(key=? string "down") (sub3 value)]
    [else value]))

(define (main value)
  (big-bang value
            [to-draw gauge-prog]
            [on-tick sub]
            [on-key key]))
(main 200)


               