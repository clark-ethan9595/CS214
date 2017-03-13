;;; namer.el simulates and tests an e-LISP Name type.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Ethan Clark Lab8
;;; Date: April 12, 2016
;;;


(add-to-list 'load-path ".")
("." "/usr/share/emacs24/site-lisp/a2ps" "/etc/emacs24" "/etc/emacs" "/usr/local/share/emacs/24.3/site-lisp" "/usr/local/share/emacs/site-lisp" "/usr/share/emacs24/site-lisp/dictionaries-common" "/usr/share/emacs/site-lisp/autoconf" "/usr/share/emacs/24.3/site-lisp" "/usr/share/emacs/site-lisp" "/usr/share/emacs/24.3/lisp" "/usr/share/emacs/24.3/lisp/vc" ...)

(load "Name.el")
t



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver for our Name functions. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (require 'cl)                              ; Common Lisp's assert
  (setq aName (Name "John" "Paul" "Jones"))  ; build a Name

  (assert (equal (getFirst aName) "John" ))  ; test it
  (assert (equal (getMiddle aName) "Paul" ))
  (assert (equal (getLast aName) "Jones" ))
  (assert (equal (getFullName aName) "John Paul Jones" ))

  (setq buf (get-buffer "namer.el"))         ; buf = this buffer
  (assert (eq (printName aName buf) aName) )
  (terpri buf)                               ; newline
  (princ "All tests passed!")                ; feedback
  (terpri buf))                              ; newline
John Paul Jones
All tests passed!
t


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

