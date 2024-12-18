#lang racket
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)
;Resultado: 15, porque 1 + 2 + 3 + 4 + 5 = 15

(product (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)
;Resultado: 120, porque 1 * 2 * 3 * 4 * 5 = 120


(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum-iter term a next b)
  (accumulate + 0 term a next b))

(define (product-iter term a next b)
  (accumulate * 1 term a next b))

(sum-iter (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)
;Resultado: 15, porque 1 + 2 + 3 + 4 + 5 = 15

(product-iter (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)
;Resultado: 120, porque 1 * 2 * 3 * 4 * 5 = 120