;;; lisp-butt-mode-test.el --- tests  -*- lexical-binding: t -*-


;; THIS FILE HAS BEEN GENERATED.  see the literate source.

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



;; Tests
;; :PROPERTIES:
;; :header-args:emacs-lisp+: :comments both
;; :ID:       dac141b6-e0a8-4312-8022-90b08fce4c84
;; :END:


;; [[id:dac141b6-e0a8-4312-8022-90b08fce4c84][Tests:1]]
(require 'lisp-butt-mode)
;; Tests:1 ends here

;; existence of the program
;; :PROPERTIES:
;; :ID:       64deaaad-d23f-485b-97a7-3ed650afcd03
;; :END:


;; [[id:64deaaad-d23f-485b-97a7-3ed650afcd03][existence of the program:1]]
(ert-deftest test-lisp-butt-1 ()
  "test if the basic function is available at all."
  (with-temp-buffer
    (lisp-interaction-mode)
    (lisp-butt-mode)))
;; existence of the program:1 ends here


(provide 'lisp-butt-test)

;;; lisp-butt-test.el ends here
