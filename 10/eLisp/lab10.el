;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lab10.el practices some interesting eLisp characteristics
;;; Ethan Clark Lab10 CS 214
;;; April 25, 2016

;;; Practice
(lambda (x) (+ x x) )
(lambda (x) (+ x x))

((lambda (x) (+ x x)) 17)
34

;;; Exercise 1a
(lambda (x y z a) (max (abs x) (abs y) (abs z) (abs a)))
(lambda (x y z a) (max (abs x) (abs y) (abs z) (abs a)))

((lambda (x y z a) (max (abs x) (abs y) (abs z) (abs a))) 30 10 20 -100)
100

;;; Exercise 1b
((lambda (x y z) (+ x y z)) 10 16 -4)
22
((lambda (x) (null x)) 100)
nil
((lambda () 17.2))
17.2

;;; Practice
(function abs)
abs
#'abs
abs

;;; Passing functions as parameters practice
(setq double (function (lambda (x) (+ x x)) ))
(lambda (x) (+ x x))
(double 11)
(funcall double 11)
22

;;; Lambda function that triples its parameter
(setq triple (function (lambda (x) (+ x x x)) ))
(lambda (x) (+ x x x))
(funcall triple 11)
33

;;; More Practice
(apply #'+ '(1 2 3))
6
(apply #'+ 1 2 '(3 4 5))
15
(funcall #'+ 1 2 3 4)
10
(funcall #'cons 'a 'b)
(a . b)
(mapcar #'evenp '(1 2 3 4))
(mapcar #'oddp '(1 2 3 4))
(defun subtract-n (n list)
  (mapcar #'(lambda (x) (- x n)) list))
subtract-n
(subtract-n 2 '(2 4 6))
(0 2 4)

;;; Exercise 2
(defun sum-squares (list)
  (apply #'+ (mapcar #'(lambda (x) (* x x)) list)))
sum-squares
(sum-squares '(1 2 3))
14
(sum-squares '(1 2 3 4 5))
55
(sum-squares '(-1 -2 -3 0 1))
15



