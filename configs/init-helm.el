
(package-install 'helm)
(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(define-key helm-find-files-map (kbd "<tab>") #'helm-execute-persistent-action)

;; helm-gtags
(package-install 'helm-gtags)
(add-hook 'c-mode-hook '(lambda ()
                          (helm-gtags-mode 1)))

(provide 'init-helm)
