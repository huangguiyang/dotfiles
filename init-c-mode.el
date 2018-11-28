
(setq c-basic-offset 4)
(setq c-label-minimum-indentation 0)
(add-hook 'c-mode-hook (lambda () (setq comment-start "/* "
                                        comment-end " */")))

(package-install 'company-c-headers)
(add-hook 'c-mode-hook
          (lambda ()
            (require 'company-c-headers)
            (add-to-list 'company-backends 'company-c-headers)))

(provide 'init-c-mode)
