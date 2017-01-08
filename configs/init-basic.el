
(global-linum-mode t)
(setq-default line-spacing 5)
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
(set-frame-size (selected-frame) 90 50)

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

;; package
(require 'package)
(add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
(package-initialize)

(provide 'init-basic)
