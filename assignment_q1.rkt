#lang racket
;A cons pair of two numbers
(cons 2 6)

;A list of 3 numbers, using only the cons function
cons '(1 5 10)

;A list containing a string, a number and a nested list of three numbers,
;using only the cons function.
cons '("String" 7 (2 8 12))

;A list containing a string, a number and a nested list of three numbers,
;using only the list function.
(list "String" '15 '(3 4 5))

;A list containing a string, a number and a nested list of three numbers,
;using only the append function.
(append '("String") '(18) '((3 1 6)))