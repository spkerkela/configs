(load-theme 'deeper-blue t)
(require 'package)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(defun maybe-install (p)
  (when (not (package-installed-p p))
    (package-install p)))

(defun install-package-list (pl)
  (dolist (p pl)
    (maybe-install p)))

(maybe-install 'evil)

(defvar essential-packages '(better-defaults
                             evil
                             relative-line-numbers
                             company
                             starter-kit
                             starter-kit-bindings
                             starter-kit-lisp
                             starter-kit-eshell))

(defvar programming-packages '(auto-complete
                               powerline-evil))

(defun install-packages ()
  (interactive)
  (progn
    (package-refresh-contents)
    (install-package-list essential-packages)
    (install-package-list programming-packages)))

(setq ns-command-modifier 'meta)

(add-hook 'after-init-hook 'global-company-mode)
(global-linum-mode 0)

(when (package-installed-p 'relative-line-numbers)
  (global-relative-line-numbers-mode))

(when (package-installed-p 'evil)
  (evil-mode 1))

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

(electric-pair-mode 1)

;; This removes the annoying glitchy feeling flash when something dings
(setq ring-bell-function 'ignore)
