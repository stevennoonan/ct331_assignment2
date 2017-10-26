#lang racket

(require (file "assignment_q2.rkt")
         (file "assignment_q3.rkt"))

;
;Don't worry about this file unless you are doing the extra credit tests. 
;

;This structure allows a single function call
;to run every test in sequence, rather than
;calling each function separately. 
(define (runTests)
  (begin
    (display "Running tests...\n")
    ;begin calling test functions
    (printf "1: ~a~n" (test_ins_beg1))
    (printf "1: ~a~n" (test_ins_beg2))
    (printf "2: ~a~n" (test_ins_end1))
    (printf "2: ~a~n" (test_ins_end2))
    (printf "3: ~a~n" (test_cout_top_level1))
    (printf "3: ~a~n" (test_cout_top_level2))
    (printf "4: ~a~n" (test_count_instances1))
    (printf "4: ~a~n" (test_count_instances2))
    (printf "5: ~a~n" (test_count_instances_tr1))
    (printf "5: ~a~n" (test_count_instances_tr2))
    ;end calling test functions
    (display "\nTests complete!\n")))

;Begin test functions
;true test
(define (test_ins_beg1)(equal? '(a b c d) (ins_beg 'a '(b c d))))
;false test
(define (test_ins_beg2)(equal? '(b c d) (ins_beg 'a '(b c d))))

;true test
(define (test_ins_end1) (equal? '(a b c d ) (ins_end 'd '(a b c))))
;false test
(define (test_ins_end2) (equal? '(d b c a ) (ins_end 'd '(a b c))))

;true test
(define (test_cout_top_level1) (equal? 4 (cout_top_level '(a b c d))))
;false test
(define (test_cout_top_level2) (equal? 3 (cout_top_level '(a b c d))))

;true test
(define (test_count_instances1) (equal? 5 (count_instances 'a '(a a a b b c c d a a))))
;false test
(define (test_count_instances2) (equal? 15 (count_instances 'a '(a a a b b c c d a a))))

;true test
(define (test_count_instances_tr1) (equal? 5 (count_instances_tr 'a '(a a a b b c c d a a))))
;false test
(define (test_count_instances_tr2) (equal? 15 (count_instances_tr 'a '(a a a b b c c d a a))))


;End test functions

;Run the tests
(runTests)