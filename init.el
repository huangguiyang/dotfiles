(require 'init-package)
(require 'init-basic)
(require 'init-c-mode)
(when (eq system-type 'darwin)
  (require 'init-exec-path-from-shell))
(require 'init-yasnippet)
(require 'init-company)
(require 'init-theme)
(require 'init-whitespace)
(require 'init-helm)
(require 'init-helm-gtags)

(provide 'init)
