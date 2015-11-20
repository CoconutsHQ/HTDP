#lang racket

(require 2htdp/image)
(require 2htdp/universe)
; TrafficLight shows one of three colors:
; - "red"
; - "green'
; - "yellow"
; interpretation each element of TrafficLight represents which coloured bulb is currrently turned on

; TrafficLight -> TrafficLight
; determines the next state of the traffic light from the given s

(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "yellow"]
    [(string=? "yellow" s) "green"]
    [(string=? "green" s) "red"]))

(check-expect (traffic-light-next "red") "yellow")
(check-expect (traffic-light-next "yellow") "green")
(check-expect (traffic-light-next "green") "red")

; String -> Image
; creates a circle of a colour based on the current TrafficLight
(define (render-traffic-light s) (overlay/xy (circle 20 "solid" (if
                                              (string=? (traffic-light-next s) "red")
                                              (traffic-light-next s)
                                              "black"))
                        0 50
                        (overlay/xy (circle 20 "solid" (if
                                              (string=? (traffic-light-next s) "yellow")
                                              (traffic-light-next s)
                                              "black"))
                                    0 50
                                    (circle 20 "solid" (if
                                              (string=? (traffic-light-next s) "green")
                                              (traffic-light-next s)
                                              "black")))))
      
(big-bang "red"
          [to-draw render-traffic-light]
          [on-tick traffic-light-next])
          