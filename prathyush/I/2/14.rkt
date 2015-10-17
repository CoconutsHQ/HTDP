(define (cube-volume x)
  (* x x x))

(define (cube-surface x)
  (* 6 (* x x)))

(cube-surface 3)
(cube-volume 3)
