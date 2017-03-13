;;; mylist.el is a "module" of list operations.
;;;
;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;; Completed by: Ethan Clark Project9
;;; Date: April 19, 2016

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Max2 finds the maximum of two values.       ;;
;;; Receive: val1, val2, two values.            ;;
;;; PRE: val1 and val2 can be compared using <. ;;
;;; Return: the maximum of val1 and val2.       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Max2 (val1 val2)
  (if (> val1 val2)
      val1
    val2))
Max2


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Max finds the maximum value in a list.         ;;
;;; Receive: aList, a list of values.              ;;
;;; PRE: values in aList can be compared using <.  ;;
;;; Return: the maximum value in aList.            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun Max (aList)
  (if (listp aList)
      (progn
        (if (equal (length aList) 0) nil
	(if (equal (length aList) 1)
	  (car aList)
	(Max2 (car aList) (Max (cdr aList))))))
    nil))
Max



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Search determines if the length of the list is 0       ;;
;;; Receive: aList, a list of values; element, an integer  ;;
;;; PRE: values in aList have already been declared        ;;
;;; Return: the index of the element in aList              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun Search (aList element)
  (setq index 0)
  (if (listp aList)
      (progn
        (if (equal (length aList) 0) -1
	  (Search_List aList element 0)))
    nil))
Search

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Search_List determines where, if at all, element is in index  ;;
;;; Receive: aList, a list of values; element and index, integers ;;
;;; PRE: values in aList have already been declared               ;;
;;; Return: the index of the element in aList; otherwise -1       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun Search_List (aList element index)
  (if (equal (car aList) element) index
  (if (equal (length aList) 0) -1
    (Search_List (cdr aList) element (+ index 1)))))
Search_List



