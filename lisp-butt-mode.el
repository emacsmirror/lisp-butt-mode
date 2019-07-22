;;; lisp-butt-mode.el --- Slim Lisp butts -*- lexical-binding: t -*-


;; THIS FILE HAS BEEN GENERATED.  For sustainable program-development
;; edit the literate source file "lisp-butt-mode.org".  Find also
;; additional information there.


;; Copyright 2019 Marco Wahl
;; 
;; Author: Marco Wahl <marcowahlsoft@gmail.com>
;; Maintainer: Marco Wahl <marcowahlsoft@gmail.com>
;; Created: [2019-07-11]
;; Version: 0.0.2
;; Package-Requires: ((emacs "25"))
;; Keywords: lisp
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
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


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
;;     {M-x lisp-butt-unfontify}
;; 
;; unveils the full butt at the cursor temporarily.
;; 
;; The appearance can be configured to some extend.  See
;; 
;;     {M-x customize-group RET lisp-butt RET}
;; 
;; See also the literate source file.  E.g. see
;; https://gitlab.com/marcowahl/lisp-butt-mode.


;;; Code:


;; customizable

(defcustom lisp-butt-hole
  ?.
  "The character replacing the hole."
  :type 'character
  :group 'lisp-butt)

(defcustom lisp-butt-mode-lighter
  " (.)"
  "Text in the mode line to indicate that the mode is on."
  :type 'string
  :group 'lisp-butt)

(defcustom lisp-butt-modes
  '(lisp-mode emacs-lisp-mode clojure-mode)
  "Modes considered by `global-lisp-butt-mode'."
  :type '(repeat symbol)
  :group 'lisp-butt)

(defvar lisp-butt-regexp ")\\())+\\))")

(defvar lisp-butt-pattern
  `((,lisp-butt-regexp
     (1 (compose-region
         (match-beginning 1) (match-end 1)
         lisp-butt-hole)
        nil))))


;; core

(defun lisp-butt-set-slim-display ()
  "Function to produce nicer Lisp butts."
  (font-lock-add-keywords nil lisp-butt-pattern))

(defun lisp-butt-unset-slim-display ()
  "Function to undo the nicer Lisp butts."
  (font-lock-remove-keywords nil lisp-butt-pattern)
  (save-match-data
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward lisp-butt-regexp nil t)
        (decompose-region (match-beginning 0) (match-end 0))))))

;;;###autoload
(defun lisp-butt-unfontify ()
  "Unfontify Lisp butt at point."
  (interactive)
  (while (and (< (point-min) (point))
              (string= ")" (buffer-substring-no-properties (1- (point)) (point))))
    (backward-char))
  (save-match-data
    (re-search-forward ")*")
    (font-lock-unfontify-region
     (match-beginning 0) (match-end 0))))


;; mode definition

;;;###autoload
(define-minor-mode lisp-butt-mode
  "Display slim lisp butts."
  :lighter lisp-butt-mode-lighter
  (cond
   (lisp-butt-mode (lisp-butt-set-slim-display))
   (t (lisp-butt-unset-slim-display)))
  (font-lock-flush))

;;;###autoload
(define-global-minor-mode global-lisp-butt-mode
  lisp-butt-mode
  (lambda ()
    (when (apply #'derived-mode-p lisp-butt-modes)
        (lisp-butt-mode))))


(provide 'lisp-butt-mode)

;;; lisp-butt-mode.el ends here
