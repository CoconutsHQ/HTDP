(define (string-insert s i)
  (string-append
   (substring s 0 i)
   "_"
   (substring s i (string-length s))))

(string-insert "hello" 0)

