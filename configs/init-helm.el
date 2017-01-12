
(package-install 'helm)
(require 'helm-config)
(helm-mode 1)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-c s") 'helm-occur)

(dolist (f '("GPATH" "GTAGS" "GRTAGS" ".*"))
  (add-to-list 'helm-grep-ignored-files f))

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)

(global-set-key (kbd "<f1>") 'helm-recentf)
(global-set-key (kbd "C-.") 'helm-recentf)

(provide 'init-helm)
