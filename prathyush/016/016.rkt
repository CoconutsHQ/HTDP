(define (string-last s)
  (substring s (- (string-length s) 1)
             (string-length s)))

(string-last "hello there.")
