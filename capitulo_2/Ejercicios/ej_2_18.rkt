#lang racket
(define (length s)
    (if (null? s)
        0
	(+ 1 (length (cdr s)))))

(define (reverse lista)
  (define (reverse-iter lista lista-rev)
    (if (= (length lista) 0)
        lista-rev
        (reverse-iter (cdr lista) (cons (car lista) lista-rev))))
  (reverse-iter lista null))


(reverse (list 1 4 9 16 25))