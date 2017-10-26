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

;part b
;if item is present or absent
(define (ispresent item tree)
  (cond [(null? tree) #f] ;false if tree is empty
        [(equal? item (cadr tree)) #t] ;true if equal to current node
        [(< item (cadr tree)) (ispresent item (car tree))] ;recursivly checks if item is in left tree of current node
        [(> item (cadr tree)) (ispresent item (caddr tree))]));recursivly checks if item is in right tree of current node
;testing ispresent method
(display "Searching for item in tree, should return #t\n")
(ispresent 6 tree)
(display "Searching for item not in tree, should return #f\n")
(ispresent 22 tree)

;part c
;inserting item into tree
(define (insert item tree)
  (cond [(null? tree) (list '() item '())] ;if the tree is empty, add the item as the root node
        [(equal? item (cadr tree)) tree]   ;if item = current node, return as item is found
        [(< item (cadr tree)) (list (insert item(car tree))(cadr tree) (caddr tree))] ;if item < current node, recurse on left sub tree
        [(> item (cadr tree)) (list (car tree) (cadr tree) (insert item(caddr tree)))]));if item > current node, recurse on right sub tree

;testing inserting function
(display "Inserting into empty tree\n")
(insert 2 '())
(display "Inserting into existing tree\n")
(insert 2 tree)


;part d
;take a list of numbers and insert into binary tree
(define (list2tree list tree)
  (if (empty? list) tree
      (list2tree (cdr list) (insert (car list) tree))))

;testing list2tree
(display "Inserting a list into existing tree\n Inserting list (1 2)\n")
(list2tree '(1 2 ) tree)

;part e
;take a list of items and display them in sorted order
(define (sort_list list)
  (sort_tree(list2tree list '()))) ;using original tree sort algorithm and passing the list to an empty tree.

;testing part e
(display "Sorting a list\n")
(sort_list '(10 3 5 1 16 66 54 32 2))


;part f
;implementing a higher order version of sort_tree
;takes a list and a function and sorts list in ascending, descending and based on last digit
(define (higher_order_tree_sort list order_fn)(sort_tree(list2tree list '())))









