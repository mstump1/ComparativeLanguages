#lang scheme
#|each line represents a single sensor reading
that is then processed to obtain the temperature
values using the kelvin scale.

Those values, temperature samples are stored.|#

#|from new start point file|#
(define validate (lambda (x) (let ((n (string->number x))) (if (or (not n) (< n 0)) '() (list n)))))

(define pr2 (lambda () (test '(() () ()))))
(define test1 (lambda (x) (- 1 x)))
(define test(lambda (l) (let ((s (read-line))) (cond
                                                 #|hw4 requirements, call whatever is in the middle list on the value, if it is null, it does nothing
                                                 when empty|#
                                                 [(regexp-match (regexp "^[eE].*") s) (print_list (car l))]
                                                 [(regexp-match (regexp "^[kK] ?-* ?[0-9]*(\\.[0-9]+)*$") s) (test (cons (append (car l) (validate (number->string (k_to_n s)))) (cdr l)))]
                                                 [(regexp-match (regexp "^[cC] ?-* ?[0-9]*(\\.[0-9]+)*$") s) (test (cons (append (car l) (validate (number->string (c_to_k s)))) (cdr l)))]
                                                 [(regexp-match (regexp "^[fF] ?-* ?[0-9]*(\\.[0-9]+)*$") s) (test (cons (append (car l) (validate (number->string (f_to_k s)))) (cdr l)))]
                                                 [(regexp-match (regexp "^-* ?[0-9]*(\\.[0-9]+)*$") s) (test (cons (append (car l) (validate s)) (cdr l)))]

                                                 #|additional requirements, add create_exp as the middle of the list|#
                                                 [(regexp-match (regexp "^[pP] ?.*") s) (test (cons (car l) (append (car (cdr l))
                                                                                              (create_exp (car (string-split s [regexp "^[pP] ?"])))) (cdr l)))]
                                                 #|[(regexp-match (regexp "^[sS] ?*") s) ()]
                                                 [(regexp-match (regexp "^[rR] ?*") s) (if ()|#
                                                 [(regexp-match (regexp "^[dD]$") s) (test (cons (car l) (cons '() '())))]

                                                 [else (test l)]))))

#|function map applied to the list means it applies the function "line_by_line" to each element in the list|#
(define print_list (lambda (x) (if (= 0 (length x)) (display "No samples stored") (dis x))))
                                   
(define dis (lambda(x) (display "Number of samples: ")
                                       (display (length x))
                                       (newline)
                                       (map line_by_line x)
                                       (display "Average value: ")
                                       (display (calc_average x))))

#|calculates average value of a list|#
(define calc_average (lambda (l) (/ (sum l) (length l))))

#|adds all the values of the list together|#
(define (sum l) (if (null? l) 0 (+ (car l) (sum (cdr l)))))

#|goes line by line through the list and prints the values|#
(define line_by_line (lambda (x) (let ((s (display x ))) (newline))))

#|these take the list of valid input and calculates the temps in kelvin, these functions work
the k_to_n function gets rid of the k character and the space, if present and
returns the number in string form (separate by letter, then trim whitespace)|#
(define k_to_n (lambda (n) (help (string->number (string-trim (car (string-split n [regexp "^[kK]"])))))))
(define c_to_k (lambda (n) (help (+ (string->number (string-trim (car (string-split n [regexp "^[cC]"])))) 273.15))))
(define f_to_k (lambda (n) (help (/ (+ (string->number (string-trim (car (string-split n [regexp "^[fF]"])))) 459.67) 1.8))))

#|helper function - to make precide decimal places (2 places)|#
(define help (lambda (s) (/ (truncate (* 100 s)) 100)))

#|evaluate expression in s  (let ((n (string->number x)))
[(regexp-match (regexp "\\( [-+*/] ?[0-9]+* [x]? ?[0-9]+* [x]?\\)") s)|#
(define create_exp (lambda (s) (eval (with-input-from-string s (lambda(x) (read))) cs3304pr2)))

#|below functions are used in p - for storing preprocessor in second part of list|#
(define-namespace-anchor cs3304)
(define cs3304pr2(namespace-anchor->namespace cs3304))

(define proc (lambda (n) (cond [(null n) (lambda(n) n)]
                                        [else n])))

(pr2)
