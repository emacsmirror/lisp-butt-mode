;;; lisp-butt-mode-test.el --- tests  -*- lexical-binding: t -*-


;; THIS FILE HAS BEEN GENERATED.  see the literate source.

;; Copyright 2019 Marco Wahl
;; 
;; Author: Marco Wahl <marcowahlsoft@gmail.com>
;; Maintainer: Marco Wahl <marcowahlsoft@gmail.com>
;; Created: [2019-07-11]
;; Version: 1.0.3
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


;; [[file:lisp-butt-mode.org::*Tests][Tests:1]]
(require 'lisp-butt-mode)
;; Tests:1 ends here

;; existence of the program
;; :PROPERTIES:
;; :ID:       64deaaad-d23f-485b-97a7-3ed650afcd03
;; :END:


;; [[file:lisp-butt-mode.org::*existence of the program][existence of the program:1]]
(ert-deftest 0f10d2c6dfc87cf21674ab887bf748ba6d296d1d ()
  "test if the basic function is available at all."
  (with-temp-buffer
    (lisp-interaction-mode)
    (lisp-butt-mode)))
;; existence of the program:1 ends here

;; turn on the mode
;; :PROPERTIES:
;; :ID:       4c932e52-a9a7-49e4-9df1-9161289bef0e
;; :END:


;; [[file:lisp-butt-mode.org::*turn on the mode][turn on the mode:1]]
(ert-deftest 9d64a351fdea5be260e3018eb6f3d2cd605c1cfc ()
  "test buttification when turning on lisp-butt-mode."
  (with-temp-buffer
    (lisp-mode)
    (font-lock-mode)
    (insert "(((())))")
    (lisp-butt-mode)
    (font-lock-ensure)
    (should (find-composition 6))))
;; turn on the mode:1 ends here

;; turn off the mode
;; :PROPERTIES:
;; :ID:       086aa050-db0a-45ed-b03b-4e1d722e0125
;; :END:


;; [[file:lisp-butt-mode.org::*turn off the mode][turn off the mode:1]]
(ert-deftest 9a156d463d7bc4acefdfc1290cbad50da50b5e91 ()
  "test buttification when turning on lisp-butt-mode."
  (with-temp-buffer
    (lisp-mode)
    (font-lock-mode)
    (insert "(((())))")
    (lisp-butt-mode)
    (font-lock-ensure)
    (lisp-butt-mode -1)
    (should-not (find-composition 6))))
;; turn off the mode:1 ends here

;; decompose butt at point
;; :PROPERTIES:
;; :ID:       d758d5b9-c75f-43d5-8dc7-8ee12800dcc0
;; :END:


;; [[file:lisp-butt-mode.org::*decompose butt at point][decompose butt at point:1]]
(ert-deftest f5eed54b59f148d9fd2df4d178b97f6cea632eef ()
  "test buttification when turning on lisp-butt-mode."
  (with-temp-buffer
    (lisp-mode)
    (font-lock-mode)
    (insert "(((())))")
    (lisp-butt-mode)
    (font-lock-ensure)
    (goto-char 6)
    (lisp-butt-unfontify)
    (should-not (find-composition 6))))
;; decompose butt at point:1 ends here

;; test versus column
;; :PROPERTIES:
;; :ID:       5b6c5bd1-bf91-4cae-825b-af8318974db3
;; :END:


;; [[file:lisp-butt-mode.org::*test versus column][test versus column:1]]
(ert-deftest test-8954f46a82a828ff0537fe94e36891a9dc452e70 ()
  "test buttification when turning on lisp-butt-mode."
  (with-temp-buffer
    (lisp-mode)
    (font-lock-mode)
    (insert "((((
))))")
    (lisp-butt-mode)
    (font-lock-ensure)
    (end-of-line)
    (should (= 3 (current-column)))))
;; test versus column:1 ends here

;; [[file:lisp-butt-mode.org::*test versus column][test versus column:2]]
(ert-deftest test-d9c804d9d64948029b22b835241d7078cd653548 ()
  "test buttification when turning on lisp-butt-mode."
  (with-temp-buffer
    (lisp-mode)
    (font-lock-mode)
    (insert "(((((
)))))")
    (lisp-butt-mode)
    (font-lock-ensure)
    (end-of-line)
    (should (= 3 (current-column)))))
;; test versus column:2 ends here

;; [[file:lisp-butt-mode.org::*test versus column][test versus column:3]]
(ert-deftest test-9f858e50066aa285451ff6b53a21495b1f5277e0 ()
  "test buttification when turning on lisp-butt-mode."
  (with-temp-buffer
    (lisp-mode)
    (font-lock-mode)
    (insert "(([(((
)))]))")
    (lisp-butt-mode)
    (font-lock-ensure)
    (end-of-line)
    (should (= 3 (current-column)))))
;; test versus column:3 ends here


(provide 'lisp-butt-test)

;;; lisp-butt-test.el ends here
