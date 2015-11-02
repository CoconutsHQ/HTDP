;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Calender) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define (draw-rectangle width height mode colour)
  (rectangle width height mode colour))

(define (date number)
  (string-append (number->string number) ""))
(define (month number2)
  (cond
    [(= number2 1) "January"]
    [(= number2 2) "February"]
    [(= number2 3) "March"]
    [(= number2 4) "April"]
    [(= number2 5) "May"]
    [(= number2 6) "June"]
    [(= number2 7) "July"]
    [(= number2 8) "August"]
    [(= number2 9) "September"]
    [(= number2 10) "October"]
    [(= number2 11) "November"]
    [(= number2 12) "December"]
    [else "Incorrect Input"]))

#|(define (calender width height padding number number2)
  (overlay/align/offset "right" "middle"
                 (overlay/align  "middle" "middle" (draw-rectangle width height) (text/font (date number) 18 "blue"
                                                                                            "Helvetica Neue" 'swiss 'normal 'bold #f))
                 (- 0 50) 0)) |#
(define (date-box width height mode colour number)
  (overlay/align  "middle" "middle" (draw-rectangle width height mode colour) (text/font (date number) 18 "blue"
                                                                                            "Helvetica Neue" 'swiss 'normal 'bold #f)))
(define (row width height mode colour number)
  (overlay/xy (date-box width height mode colour number)
              width 0
              (overlay/xy (date-box width height mode colour (+ number 1))
                          width 0
                          (overlay/xy (date-box width height mode colour (+ number 2))
                                      width 0
                                      (overlay/xy (date-box width height mode colour (+ number 3))
                                                  width 0
                                                  (overlay/xy (date-box width height mode colour (+ number 4))
                                                               width 0
                                                               (overlay/xy (date-box width height mode colour (+ number 5))
                                                                           width 0
                                                                           (date-box width height mode colour (+ number 6)))))))))
(define (column width height mode colour number) 
(overlay/xy (row width height mode colour number)
              0 height
              (overlay/xy (row width height mode colour (+ number 7))
                          0 height
                          (overlay/xy (row width height mode colour (+ number 13))
                                      0 height
                                      (overlay/xy (row width height mode colour (+ number 20))
                                                   0 height
                                                   (overlay/xy (date-box width height mode colour (+ number 27))
                                                               width 0
                                                               (overlay/xy (date-box width height mode colour (+ number 28))
                                                                           width 0
                                                                           (overlay/xy (date-box width height mode colour (+ number 29))
                                                                                       width 0
                                                                                       (date-box width height mode colour (+ number 30))))))))))
(define (calender width height mode colour number number2)
  (overlay/align/offset "middle" "top"
                 (column width height mode colour number)
                 0 -50
                 (text/font (month number2) 30 "blue"
                 "Helvetica Neue" 'swiss 'normal 'bold #f)))
  
                                                                                          
; (calender 40 40 40 1 2)
(calender 40 40 "outline" "blue" 1 12)

