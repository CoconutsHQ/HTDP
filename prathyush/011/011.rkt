(require 2htdp/image)

(define in false)

(if (string? in)
    (string-length in)
    (if (image? in)
        (* (image-width in)
           (image-height in))
        (if (number? in)
         (if (<= in 0) in
             (- in 1))
         (if in 10 20))))
