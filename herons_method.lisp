;;;; This is an implementation in Lisp of Heron's method for finding the square root of any number.
;;;; I made this little program to get better at writing lisp.

;;; DEFINE THE INITIAL GUESS TO BE 1
(DEFVAR GUESS 1)

;;; Define the function SQRT
(DEFUN H-SQRT (X)(TRY GUESS X))

;;; Define function try, this return the guess if it's good enough, otherwise improves it.
(DEFUN TRY (GUESS X)
       (IF (GOOD-ENOUGH? GUESS X)
       GUESS
       (TRY (IMPROVE GUESS X) X)))

;;; Try to improve the guess by averaging the guess with x/guess.
(DEFUN IMPROVE (GUESS X)
       (AVERAGE GUESS (/ X GUESS)))

;;; If the absolute error is less than 0.00001, then return true.
(DEFUN GOOD-ENOUGH? (GUESS X)
        (< (ABS (- (SQUARE GUESS) X))
        .00001))

(DEFUN SQUARE (X)
       (* X X))

(DEFUN AVERAGE (X Y)
       (/ (+ X Y) 2))

(PRINC "Type a number greater than zero ")
(FORMAT T "Square root of that is: ~F" (H-SQRT (READ)))
