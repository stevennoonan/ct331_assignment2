#lang racket

;inserting element at beginning of list
(provide ins_beg)
(define (ins_beg el lst) (append (list el) lst))

;inserting element at end of list
(provide ins_end)
(define (ins_end el lst) (append lst (list el)))

;counting num of top level items in a list
(provide cout_top_level)
(define (cout_top_level lst) (if( null? lst) 0 (+ 1 (cout_top_level (cdr lst)))))

;counting number of timesan item occurs in a list of items (non-tail)
(provide count_instances)
(define (count_instances item lst)
  (cond [(null? lst) 0]
        [(equal? item (car lst)) (+ 1 (count_instances item (cdr lst)))]
        [else (count_instances item (cdr lst))]))