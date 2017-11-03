
(when (< emacs-major-version 25)
  (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no"))

(global-linum-mode t)
(setq column-number-mode t)
(setq-default line-spacing 8)
(setq-default indent-tabs-mode nil)
(show-paren-mode t)
(global-auto-revert-mode t)
(electric-pair-mode 1)

;; vi style key binding :-)
(global-set-key (kbd "C-o") (lambda ()
			      (interactive)
			      (end-of-line)
			      (newline)
			      (indent-according-to-mode)))
(tool-bar-mode -1)
(set-face-attribute 'default nil :height 140)
(set-face-attribute 'linum nil :height 120)
(when (eq system-type 'darwin)
  (set-frame-size (selected-frame) 90 50))
(when (eq system-type 'windows-nt)
  (set-face-attribute 'default nil :height 140)
  (set-face-attribute 'linum nil :height 120)
  (set-default-font "Consolas"))

;; another comment
(defun my:comment ()
  (interactive)
  (let ((start (line-beginning-position))
	(end (line-end-position)))
    (when (region-active-p)
      (setq start (save-excursion
		    (goto-char (region-beginning))
		    (beginning-of-line)
		    (point))
	    end (save-excursion
		  (goto-char (region-end))
		  (end-of-line)
		  (point))))
    (comment-or-uncomment-region start end)))
;; comment-or-uncomment
(global-set-key (kbd "C-/") 'my:comment)

;; backward kill line
(defun my:backward-delete-line ()
  (interactive)
  (kill-line 0)
  (indent-according-to-mode))
(global-set-key (kbd "<C-backspace>") 'my:backward-delete-line)

(defun my:insert-line-before (times)
  "Inserts a newline above the line containing the cursor"
  (interactive "p")
  (save-excursion
    (move-beginning-of-line 1)
    (newline times)))

(global-set-key (kbd "C-S-o") 'my:insert-line-before)

;; RET
(global-set-key (kbd "RET") 'newline-and-indent)

;; F12 to locate this file
(defun my:find-dotfile ()
  (interactive)
  (let ((files '("~/.emacs.d/init.el")))
    (find-file (car (cl-remove-if-not 'file-exists-p files)))))
(global-set-key (kbd "<f12>") 'my:find-dotfile)

;; F5 to make
(defun my:make ()
  (interactive)
  (compile "make"))
(global-set-key (kbd "<f5>") 'my:make)

(provide 'init-basic)
