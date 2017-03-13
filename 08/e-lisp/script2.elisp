;;; Name.el simulates an e-LISP Name type and operations on that type.
;;;
;;; Begun by: Dr. Adams, for CS 214 at Calvin College.
;;; Completed by: Ethan Clark Lab8
;;; Date: April 12, 2016
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Name constructs a name from three strings.      ;;
;;; Receive: first, middle and last, three strings. ;;
;;; Return: the triplet (first middle last).        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun Name(first middle last)
  (list first middle last) )
Name


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFirst extracts the first name of a name object.;
;;; Receive: theName, a Name.                       
;;; Return: the first string in theName.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getFirst(theName)
  (car theName) )
getFirst


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getMiddle extracts the middle name of a name object.
;;; Receive: theName, a Name.                      
;;; Return: the second string in theName.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getMiddle(theName)
  (car (cdr theName) ) )
getMiddle




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getLast extracts the last name of a name object.
;;; Receive: theName, a Name.                    
;;; Return: the third string in theName.       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getLast(theName)
  (car (cdr (cdr theName) ) ) )
getLast



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFullName returns a full name in F-M-L order. 
;;; Return: myFirst, myMiddle, myLast.           
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getFullName (theName)
   (concat (getFirst theName) " " (getMiddle theName) " " (getLast theName) ))
getFullName



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printName displays a name object.         
;;; Receive: theName, a Name,                 
;;;          buffer, the name of a buffer.   
;;; Output: the strings in theName to buffer. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun printName (theName buf)
   (princ (getFullName theName) buf)
   theName )
printName

