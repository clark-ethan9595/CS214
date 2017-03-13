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


