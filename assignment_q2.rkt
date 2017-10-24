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

;tail recursion version of previous function
;requires a helper function to prevent multiple activations of the function
(provide count_instances_tr)
(define (count_instances_tr item lst) (helper_citr item lst 0))

(define (helper_citr item lst count)(cond[(null? lst) count]
                                         [(equal? item (car lst)) (helper_citr item (cdr lst) (+ 1 count))]
                                         [else (helper_citr item (cdr lst) count)]))

;Count number of times an item occurs in a list of items where the list also has sublists
(provide count_instances_deep)
(define (count_instances_deep item lst)
  (cond [(null? lst) 0]
        [(list? (car lst))
         (+ (count_instances_deep item (car lst)) (count_instances_deep item (cdr lst)))]
        [(equal? item (car lst)) (+ 1 (count_instances_deep item (cdr lst)))]
        [else (count_instances_deep item (cdr lst))]))


                                         