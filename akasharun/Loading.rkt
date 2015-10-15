;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Loading) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define BALL (circle 6 "solid" "White"))
(define SCENE (empty-scene 400 400 "DodgerBlue"))
(define A 4)
(define A2 .4)

(define (pie t)
  (/ (* (/ t 28) 3.14) 2))

(define (circle-sin t)
  (cond
    
    [(> (* 4 (sin (pie (+ t 1)))) 0) 
     (* 28 (sin (* 1/2 A (sqrt (+ t 1)))))] 
    [(<= (* 4 (sin (pie (+ t 1)))) 0)
     (* 28 (sin (* 1/2 A2 (sqr (/ (+ t 1) 28)))))])) 
(define (circle-cos t)
  (cond
    
    [(> (* 4 (sin (pie (+ t 1)))) 0)
     (* 28 (cos (* 1/2 A (sqrt (+ t 1)))))]
    [(<= (* 4 (sin (pie (+ t 1)))) 0)
     (* 28 (cos (* 1/2 A2  (sqr (/ (+ t 1) 28)))))]))
    

  
(define (loading t)
  (place-image BALL (+ 200 (circle-sin (/ t 1.4))) (+ 200 (circle-cos (/ t 1.4))) (circle-ball8 t)))
(define (circle-ball8 t)
  (place-image BALL (+ 200 (circle-sin (/ t 1.35))) (+ 200 (circle-cos (/ t 1.35))) (circle-ball7 t)))
(define (circle-ball7 t)
  (place-image BALL (+ 200 (circle-sin (/ t 1.3))) (+ 200 (circle-cos (/ t 1.3))) (circle-ball6 t)))
(define (circle-ball6 t)
  (place-image BALL (+ 200 (circle-sin (/ t 1.25))) (+ 200 (circle-cos (/ t 1.25))) (circle-ball5 t)))
(define (circle-ball5 t)
  (place-image BALL (+ 200 (circle-sin (/ t 1.2))) (+ 200 (circle-cos (/ t 1.2))) (circle-ball4 t)))
(define (circle-ball4 t)
  (place-image BALL (+ 200 (circle-sin (/ t 1.15))) (+ 200 (circle-cos (/ t 1.15))) (circle-ball3 t)))
(define (circle-ball3 t)
  (place-image BALL (+ 200 (circle-sin (/ t 1.1))) (+ 200 (circle-cos (/ t 1.1))) (circle-ball2 t)))
(define (circle-ball2 t)
  (place-image BALL (+ 200 (circle-sin (/ t 1.05))) (+ 200 (circle-cos (/ t 1.05))) (circle-ball t)))
(define (circle-ball t)
  (place-image BALL (+ 200 (circle-sin t)) (+ 200 (circle-cos t)) SCENE))

 

(animate loading)