;#1
(define (binomial N k)
  (if (= k 0)
  1
  (if (= k N)
  1
  (+ (binomial (- N 1) k) (binomial (- N 1) (- k 1)))))
)
;#2
(define (mod N M)
  (- N (*(floor (/ N M)) M))
)
;#3
(define (binaryToDecimal b)
  (if (= b 0)
  0
  (+ (mod b 10) (* 2 (binaryToDecimal (floor (/ b 10))))))
)
;#4
(define (addBinary BList) 
  (if (null? BList)
  0 
  (+ (binaryToDecimal (car BList)) (addBinary (cdr BList))))
)
;#5
(define (helperFunc lst currMin) 
  (if (null? lst) 
  currMin 
  (if (< (car lst) currMin) 
  (helperFunc (cdr lst) (car lst)) 
(helperFunc (cdr lst) currMin)))
)

(define (min lst) 
  (helperFunc (cdr lst) (car lst))
)
;#6
(define (myRemove atm lst) 
  (if (null? lst) 
  '() 
  (if (equal? atm (car lst)) 
  (myRemove atm (cdr lst)) (cons (car lst) (myRemove atm (cdr lst)))))
)
;#7
(define (selectionSort MList) 
  (if (null? MList) 
  '() 
  (cons (min MList) (selectionSort (myRemove (min MList) MList))))
)