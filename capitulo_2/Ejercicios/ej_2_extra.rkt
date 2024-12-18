#lang racket
(define (incremento x)
  (+ x 1))

(define (mult n m)
  (lambda (f) (lambda (x) ((m (n f)) x))))

(define (power n m)
  (lambda (f) (lambda (x) (((m n) f) x))))

(define (add n m)
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define three (lambda (f) (lambda (x) (f (f (f x))))))

(((add two three) incremento) 0)