;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ball) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WIDTH 400)
(define HEIGHT 400)
(define SCENE (empty-scene WIDTH HEIGHT))
(define BALL (circle 10 "solid" "red"))
(define BALL-PLACEMENT (- HEIGHT (* (image-height BALL) 2)))
(define A 50)

(define (energy t)
  (* 1/2 A (sqrt  t )))
(define (bounce t)
  (* (* 15  (sqrt (+ t 1))) (sqr (sin (/ (energy t) 5)))))

(define (ball-bounce t)
  (place-image BALL (+ 0 (* t 3)) (- BALL-PLACEMENT (bounce t)) SCENE)) 
(animate ball-bounce)

