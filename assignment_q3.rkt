#lang racket

;Defining a tree
(define tree'(((() 3 ()) 6 (() 9 ())) 10 ((() 12 ()) 14 (() 15 ()))))


;Part a
;Displaying a sorted tree
(define (sort_tree tree)
  (begin (cond [(not (null? (car tree))) (sort_tree (car tree))])
         (printf "~a~n" (cadr tree))
         (cond [(not (empty? (caddr tree))) (sort_tree (caddr tree))])))

;printing out the sorted tree
(display "Sorted Tree\n") 
(sort_tree tree)

;part 2
;if item is present or absent
(define (ispresent item tree)
  (cond [(null? tree) #f] ;false if tree is empty
        [(equal? item (cadr tree)) #t] ;true if equal to current node
        [(< item (cadr tree)) (ispresent item (car tree))] ;recursivly checks if item is in left tree of current node
        [(> item (cadr tree)) (ispresent item (caddr tree))]));recursivly checks if item is in right tree of current node
;testing ispresent method
(display "Searching for item in tree, should return #t\n")
(ispresent 6 tree)
(display "Searchig for item not in tree, should return #f\n")
(ispresent 22 tree)
