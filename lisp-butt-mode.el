;;; lisp-butt-mode.el --- Slim lisp butts -*- lexical-binding: t -*-

;; THIS FILE HAS BEEN GENERATED.  For sustainable program-development
;; edit the literate source file "lisp-butt-mode.org".  Find also
;; additional information there.

;; Copyright 2019 Marco Wahl
;; 
;; Author: Marco Wahl <marcowahlsoft@gmail.com>
;; Maintainer: Marco Wahl <marcowahlsoft@gmail.com>
;; Created: [2019-07-11]
;; Version: 0.0.1
;; Package-Requires: ((emacs "25"))
;; Keywords: reading, programming
;; URL: https://gitlab.com/marcowahl/lisp-butt-mode
;; 
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; There is a global `global-lisp-butt-mode' and a local `lisp-butt-mode'
;; variant.
;; 
;; Global:
;; 
;; - Toggle the mode with {M-x global-lisp-butt-mode RET}.
;; - Activate the mode with {C-u M-x global-lisp-butt-mode RET}.
;; - Deactivate the mode with {C-u -1 M-x global-lisp-butt-mode RET}.
;; 
;; Local:
;; 
;; - Toggle the mode with {M-x lisp-butt-mode RET}.
;; - Activate the mode with {C-u M-x lisp-butt-mode RET}.
;; - Deactivate the mode with {C-u -1 M-x lisp-butt-mode RET}.
;; 
;; Further {M-x lisp-butt-unfontify} unveils the full butt at the cursor
;; temporarily.
;; 
;; See also the literate source file.  E.g. see
;; https://gitlab.com/marcowahl/lisp-butt-mode.


;;; Code:


(require 'cl-lib) ; for `cl-assert'

(defun lisp-butt-set-slim-display ()
  "Function to produce nicer lisp butts."
  (cl-assert (derived-mode-p 'lisp-mode 'emacs-lisp-mode))
  (font-lock-add-keywords
   nil
   '((")\\())+\\))"
      (1 (compose-region
          (match-beginning 1) (match-end 1)
          ".")
         nil)))))

(defun lisp-butt-unset-slim-display ()
  "Function to undo the nicer lisp butts."
  (cl-assert (derived-mode-p 'lisp-mode 'emacs-lisp-mode))
  (font-lock-remove-keywords
   nil
   '((")\\())+\\))"
      (1 (compose-region
          (match-beginning 1) (match-end 1)
          ".")
         nil)))))

;;;###autoload
(defun lisp-butt-unfontify ()
  "Unfontify lisp butt at point."
  (interactive)
  (while (string= ")" (buffer-substring-no-properties (1- (point)) (point)))
    (goto-char (1- (point))))
  (re-search-forward ")*")
  (unless (= (match-beginning 0) (match-end 0))
    (font-lock-unfontify-region (1+ (match-beginning 0)) (1- (match-end 0)))))

;;;###autoload
(defcustom lisp-butt-mode-lighter
  " (.)"
  "Text in the mode line to indicate that the mode is on."
  :type 'string
  :group 'lisp-butt)


;; mode definition

;;;###autoload
(define-minor-mode lisp-butt-mode
  "Display slim lisp butts."
  :lighter lisp-butt-mode-lighter
  (cond
   (lisp-butt-mode (lisp-butt-set-slim-display))
   (t (lisp-butt-unset-slim-display)))
  (font-lock-mode 1))

;;;###autoload
(define-global-minor-mode global-lisp-butt-mode
  lisp-butt-mode
  (lambda ()
    (if (derived-mode-p 'lisp-mode 'emacs-lisp-mode)
        (lisp-butt-mode))))


(provide 'lisp-butt-mode)

;;; lisp-butt-mode.el ends here
