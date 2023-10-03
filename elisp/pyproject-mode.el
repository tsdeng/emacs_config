;;; pyproject-mode.el --- Major mode for editing pyproject.toml  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Tianshuo Deng

;; Author: Tianshuo Deng <tianshuo@MBP16.local>
;; Keywords: languages

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:
(require 'toml-mode)

(defgroup pyproject nil
  "Major mode for pyproject.toml"
  :group 'languages
  :prefix "pyproject-"
  )
(defcustom pyproject-mode-hook nil
  "Hook run by pyproject-mode."
  :type 'hook
  :group 'pyproject
  )

(defcustom pyproject-mode-lighter "PP🐍"
  "pyproject-mode lighter."
  :type 'string
  :group 'k8s
  )

;;;###autoload
(add-to-list 'auto-mode-alist '("pyproject\\.toml\\'" . pyproject-mode))

;;;###autoload
(define-derived-mode pyproject-mode toml-mode pyproject-mode-lighter
  "Major mode for editing pyproject"
  )
(provide 'pyproject-mode)
;;; pyproject-mode.el ends here
