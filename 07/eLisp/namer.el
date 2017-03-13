;;; namer.el simulates and tests an e-LISP Name type.
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Ethan Clark Project7
;;; Date: April 7, 2016


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Name constructs a name from three strings.      ;;;
;;; Receive: first, middle and last, three strings. ;;;
;;; Return: the triplet (first middle last).        ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun Name (first middle last)
  (list first middle last))
Name


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFirst extracts the first name of a name object.  ;;;
;;; Receive: theName, a Name.                           ;;;
;;; Return: the first string in theName.                ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getFirst (theName)
  (car theName))
getFirst


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getMiddle extracts the middle name of a name object.  ;;;
;;; Receive: theName, a Name.                             ;;;
;;; Return: the second string in theName.                 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getMiddle (theName)
  (car (cdr theName)))
getMiddle


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getLast extracts the last name of a name object.  ;;;
;;; Receive: theName, a Name.                         ;;;
;;; Return: the third string in theName.              ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getLast (theName)
  (car (cdr (cdr theName))))
getLast


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFullName returns a full name in F-M-L order.  ;;;
;;; Return: myFirst, myMiddle, myLast.               ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun getFullName(theName)
  (concat (getFirst theName) " " (getMiddle theName) " " (getLast theName)))
getFullName


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printName displays a name object.         ;;;
;;; Receive: theName, a Name,                 ;;;
;;;          buffer, the name of a buffer.    ;;;
;;; Output: the strings in theName to buffer. ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun printName(theName buf)
  (princ (getFullName theName) buf)
  (setq name theName))
printName


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setFirst returns a Name with updated first name              ;;;
;;; Receive: theName, a Name; newFirst, a String                 ;;;
;;; Return: a new Name with updated first name                   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun setFirst(theName newFirst)
  (Name newFirst (getMiddle theName) (getLast theName)))
setFirst


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setMiddle returns a Name with updated middle name            ;;;
;;; Receive: theName, a Name; newMiddle, a String                ;;;
;;; Return: a new Name with updated middle name                  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun setMiddle(theName newMiddle)
  (Name (getFirst theName) newMiddle (getLast theName)))
setMiddle


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; setLast returns a Name with updated last name                ;;;
;;; Receive: theName, a Name; newMiddle, a String                ;;;
;;; Return: a new Name with updated last name                    ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun setLast(theName newLast)
  (Name (getFirst theName) (getMiddle theName) newLast))
setLast


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lfmi puts theName into the format LastFirstMiddleInitial     ;;;
;;; Receive: theName, an already assigned Name                   ;;;
;;; Return: a String in the format of LastFirstMiddleInitial     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun lfmi(theName)
  (concat (getLast theName) " " (getFirst theName) " " (substring (getMiddle theName) 0 1) "."))
lfmi


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; readName reads in the names for the Name instance from the user         ;;;
;;; Receive: theName, an already assigned Name                              ;;;
;;; Return: a new Name with the user input names for First Middle and Last  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun readName(theName)
  (setq newFirst (read-from-minibuffer "Enter first name: "))
  (setq newMiddle (read-from-minibuffer "Enter middle name: "))
  (setq newLast (read-from-minibuffer "Enter last name: "))
  (Name newFirst newMiddle newLast))
readName


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver for our Name functions. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
  (require 'cl)                              ; assert
  (setq aName (Name "John" "Paul" "Jones"))  ; build a Name

  (assert (equal (getFirst aName) "John" ))  ; test it
  (assert (equal (getMiddle aName) "Paul" ))
  (assert (equal (getLast aName) "Jones" ))

  (assert (equal (getFullName aName) "John Paul Jones" ))

  (setq buf (get-buffer "namer.el"))         ; buf = this buffer

  (assert (eq (printName aName buf) aName) ) ; output
  (terpri buf)                               ; newline

  (setq aName (setFirst aName "Ethan"))     ; test the setFirst function
  (assert (equal (getFirst aName) "Ethan"))

  (setq aName (setMiddle aName "Levi"))    ; test the setMiddle function
  (assert (equal (getMiddle aName) "Levi"))

  (setq aName (setLast aName "Clark"))     ; test the setLast function
  (assert (equal (getLast aName) "Clark"))

  (printName aName buf)

  (terpri buf)

  (assert (equal (lfmi aName) "Clark Ethan L."))   ; test the lfmi function

  (setq aName (readName aName))  ; test the readName function by calling it
  (printName aName buf)          ;    and then seeing the output

  (terpri buf)

  (princ "All tests passed!")                ; feedback
  (terpri buf))                              ; newline
John Paul Jones
Ethan Levi Clark
Mark John Davis
All tests passed!
t







