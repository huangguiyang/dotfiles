;; package
(require 'package)
(add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   ;; '("melpa" . "http://elpa.emacs-china.org/melpa/")
   t)
(package-initialize)

(provide 'init-package)
