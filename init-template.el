;(load (expand-file-name "~/quicklisp/slime-helper.el"))
;;; Replace "sbcl" with the path to your implementation
;(setq inferior-lisp-program "/usr/local/bin/sbcl")
;
;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;(eval-after-load "auto-complete"
;  '(add-to-list 'ac-modes 'slime-repl-mode))
(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

; Make sure linum mode is false

(defvar my-packages '(better-defaults
		      clojure-mode
                      cider
                      evil
                      auto-complete
                      js2-mode
                      js2-refactor
                      alchemist
                      ac-slime
                      company
                      monokai-theme
                      relative-line-numbers
                      starter-kit
                      starter-kit-bindings
                      starter-kit-lisp
                      starter-kit-eshell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq ns-command-modifier 'meta)

(evil-mode 1)
(add-hook 'after-init-hook 'global-company-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9a9e75c15d4017c81a2fe7f83af304ff52acfadd7dde3cb57595919ef2e8d736" "fb4bf07618eab33c89d72ddc238d3c30918a501cf7f086f2edf8f4edba9bd59f" default)))
 '(haskell-mode-hook (quote (turn-on-haskell-indentation))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'monokai t)

(global-linum-mode 0)
(global-relative-line-numbers-mode)

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

(add-hook 'js-mode-hook 'esk-paredit-nonlisp)
(define-key js-mode-map "{" 'paredit-open-curly)
(define-key js-mode-map "}" 'paredit-close-curly-and-newline)

(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(custom-set-variables
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 )
