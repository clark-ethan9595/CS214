;;; arrayprocessing.el reads and fills an array with doubles
;;;    from the user input
;;; Receive: doubles from the user to fill the array as well as
;;;          the size of the array
;;;
;;; Created by: Ethan Clark Project6
;;; Date: 3/30/2016
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printArray() prints out the elements in the vector to the user                     ;;;
;;; Receive: theArray, an array filled with values; count, int to keep track of index  ;;;
;;; Output: each element in the array is printed for the user to see                   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun printArray(theArray count)
  (if (vectorp theArray)   ; check to make sure theArray is a vector
      (if (< count (length theArray))    ; if count is less than the length of the array
	  (progn
	   (print (elt theArray count))   ; output the element in the array to the user
	   (printArray theArray (+ count 1)))))) ; call printArray recursively
printArray

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; readArray() reads in elements from the user and fills them in theArray             ;;;
;;; Receive: theArray, an array filled with values; count, int to keep track of index; ;;;
;;;          and size, the int size of the array                                       ;;;
;;; Output: theArray filled with the value from the user                               ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun readArray(theArray count size)
  (if (vectorp theArray)  ; Make sure theArray is actually a vector
      (if (< count size)  ; check to make sure count is less than size of the array
	  (progn
	   (setq element (read))   ; read in the input from the user
	   (aset theArray count element)  ; append element to theArray
	   (readArray theArray (+ count 1) size))))) ; recursively call readArray
readArray

(defun main(size)
  (interactive "nEnter the size of the array: ") ; prompt the user for the size of the array
  (setq anArray (make-vector size '0))           ; make an array with the user given size
  (readArray anArray 0 size)                     ; call functions readArray() and printArray()
  (printArray anArray 0))
main

(main 5)

1

2

3

4

5
nil

(main 2)

45

60
nil

(main 10)

1

1

1

67

89

444

35

6

7

8
nil


