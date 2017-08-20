
(setq c-basic-offset 4)
(setq c-label-minimum-indentation 0)
(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
                                        comment-end "")))

(provide 'init-c-mode)
