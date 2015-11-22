;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |058|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


(require 2htdp/image)
(require 2htdp/universe)

; physical constants 
(define HEIGHT 300)
(define WIDTH  100)
(define YDELTA 3)
(define X-ROCKET 10)

 
; graphical constants 
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))

(define ROCKET-CENTER (/ (image-height ROCKET) 2))

; A LRCD (short for: launching rocket count down) is one of:
; – "resting"
; – a number in [-3,-1]
; – a non-negative number 
; interpretation a rocket resting on the ground, in count-down mode, 
; or the number of pixels from the top i.e. its height

; LRCD -> Image
; renders the state as a resting or flying rocket
(check-expect (show "resting") (rocket "resting"))
(check-expect (show -2) (place-image (text (number->string -2) 20 "red")
                  10 (* 3/4 WIDTH)
                  (rocket -2)))
(check-expect (show 150) (rocket 150))
(define (show x)
  (cond
    [(string? x) (rocket x)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (rocket x))]
    [(>= x 0) (rocket x)]))
    
; LRCD -> Image
; place the image of a rocket into the scene according to the given world state
(check-expect (rocket "resting") (place-image ROCKET X-ROCKET (- HEIGHT ROCKET-CENTER) BACKG))
(check-expect (rocket -2) (place-image ROCKET X-ROCKET (- HEIGHT ROCKET-CENTER) BACKG))
(check-expect (rocket 150) (place-image ROCKET X-ROCKET (- 150 ROCKET-CENTER) BACKG))
(define (rocket x)
  (cond
    [(string? x) (if (string=? x "resting")
          (place-image ROCKET X-ROCKET (- HEIGHT ROCKET-CENTER) BACKG)
          x)]
    [(<= -3 x -1) (place-image ROCKET X-ROCKET (- HEIGHT ROCKET-CENTER) BACKG)]
    [else (place-image ROCKET X-ROCKET (- x ROCKET-CENTER) BACKG)]))

; LRCD KeyEvent -> LRCD
; starts the count-down when space bar is pressed, 
; if the rocket is still resting
(check-expect (launch "resting" " ") -3)
(check-expect (launch "resting" "a") "resting")
(check-expect (launch -3 " ") -3)
(define (launch x ke)
  (cond
    [(string? x) (if (string=? " " ke) -3 x)]
    [(<= -3 x -1) x]
    [(>= x 0) x]))

; LRCD -> LRCD
; raises the rocket by YDELTA,
;  if it is moving already
(check-expect (fly "resting") "resting")
(check-expect (fly -3) -2)
(check-expect (fly -2) -1)
(define (fly x)
  (cond
    [(string? x) x]
    [(<= -3 x -1) (if (= x -1) HEIGHT (+ x 1))]
    [(>= x 0) (- x YDELTA)]))

; LRCD -> LRCD
; determine whether the program stops
(define (end? x)
  (cond
    [(string? x) x]
    [(<= -3 x -1) x]
    [
  (= HEIGHT x))

; LRCD -> LRCD
(define (main2 s)
  (big-bang s
    [to-draw show]
    [on-tick fly]
    [on-key launch]
    [stop-when end?]))

(main2 "resting") 


    




