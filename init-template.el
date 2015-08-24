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
                      json-mode
                      flycheck
                      web-mode
                      exec-path-from-shell
                      js2-refactor
                      alchemist
                      ac-slime
                      company
                      emacs-has
                      haskell-emacs
                      haskell-mode
                      neotree
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
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "9a9e75c15d4017c81a2fe7f83af304ff52acfadd7dde3cb57595919ef2e8d736" "fb4bf07618eab33c89d72ddc238d3c30918a501cf7f086f2edf8f4edba9bd59f" default)))
 '(fci-rule-color "#49483E")
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-missing-semi-one-line-override nil)
 '(js2-mode-show-strict-warnings nil)
 '(js2-strict-missing-semi nil t)
 '(js2-strict-missing-semicolon nil t)
 '(magit-diff-use-overlays nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'monokai t)

(global-linum-mode 0)
(global-relative-line-numbers-mode)

(electric-pair-mode 1)

(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

(add-hook 'js-mode-hook 'esk-paredit-nonlisp)


;; (eval-after-load 'js2-mode
;;   (progn
;;     '(define-key js-mode-map "{" 'paredit-open-curly)
;;     '(define-key js-mode-map "}" 'paredit-close-curly-and-newline)))

(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)



(require 'neotree)
(require 'flycheck)
(require 'powerline)
(powerline-center-evil-theme)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

(flycheck-add-mode 'javascript-eslint 'web-mode)

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; indent settings for web mode
(defun my-web-mode-hook ()
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'my-web-mode-hook)

(provide 'init)
;;; init.el ends here
