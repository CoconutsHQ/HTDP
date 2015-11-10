#lang racket
(require 2htdp/image)

(define MTSCN (empty-scene 200 200))
(define ROCKET 
  
(define (create-rocket-scene.v5 h)
     (place-image ROCKET 50 (cond
                              [(<= h ROCKET-CENTER-TO-BOTTOM) h]
                              [else ROCKET-CENTER-TO-BOTTOM])
                  MTSCN))
