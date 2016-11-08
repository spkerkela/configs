(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(defvar packages-to-install '(evil
			      company))

(dolist (p packages-to-install)
  (when (not (package-installed-p p))
    (package-install p)))
(require 'evil)
(evil-mode 1)
