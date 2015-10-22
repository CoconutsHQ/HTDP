;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Atom) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define BALL (circle 5 "solid" "red"))
(define PATH (circle 40 "outline" "red"))
(define PATH2 (circle 60 "outline" "red"))
(define PATH3 (circle 80 "outline" "red"))
(define (circle-sin t)
  (* 40 (sin (/ t 5))))
 (define (circle-cos t)
    (* 40 (cos (/ t 5))))

 (define (circle-sin2 t)
  (* 60 (sin (/ t 10 ))))
 (define (circle-cos2 t)
    (* 60 (cos (/ t 10))))

  (define (circle-sin3 t)
  (* 80 (sin (/ t 15 ))))
 (define (circle-cos3 t)
    (* 80 (cos (/ t 15))))
 
(define (circle-ball t)
  (overlay BALL (overlay PATH (place-image BALL (+ 200 (circle-sin3 t)) (+ 200 (circle-cos3 t))
                             (overlay PATH2 (place-image BALL (+ 200 (circle-sin t)) (+ 200 (circle-cos t))
                                          (overlay PATH3 (place-image BALL (+ 200 (circle-sin2 t)) (+ 200 (circle-cos2 t)) (empty-scene 400 400)))))))))

(animate circle-ball)