#lang racket
(define (make-monitored f)
  (let ((count 0))
    (lambda (x)
      (cond ((equal? x 'how-many-calls?) count)
            ((equal? x 'reset-count) (set! count 0))
            (else (set! count (+ count 1))
                  (f x))))))



(define s (make-monitored sqrt))

(s 100)               
(s 'how-many-calls?) 
(s 25)               
(s 'how-many-calls?) 
(s 'reset-count)     
(s 'how-many-calls?) 