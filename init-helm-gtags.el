
;; helm-gtags
(package-install 'helm-gtags)

(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t)
 '(helm-gtags-prefix-key "\C-g")
 '(helm-gtags-suggested-key-mapping t))

(with-eval-after-load 'helm-gtags
  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
  (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
  (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
  (define-key helm-gtags-mode-map (kbd "C-g a") 'helm-gtags-tags-in-this-function)
  )

(defun always-entire-update ()
  (setq current-prefix-arg '(4))
  (call-interactively 'helm-gtags-update-tags))
(add-hook 'helm-gtags-mode-hook
          (lambda () (add-hook 'after-save-hook 'always-entire-update)))

(provide 'init-helm-gtags)
