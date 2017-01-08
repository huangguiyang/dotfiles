
(package-install 'company)
(global-company-mode t)
(setq company-minimum-prefix-length 1)
(setq completion-ignore-case t)

(package-install 'company-c-headers)
(add-hook 'c-mode-hook
          '(lambda ()
             (require 'company-c-headers)
             (add-to-list 'company-backends 'company-c-headers)
             ))

(provide 'init-company)
