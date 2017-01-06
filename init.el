;; my emacs configurations

;; (setq inhibit-startup-screen t)
(defun my:set-splash-image (url file)
  (unless (file-exists-p file)
    (url-copy-file url file))
  (setq fancy-splash-image file))
(my:set-splash-image
 "http://llvm.org/img/DragonMedium.png"
 "~/.emacs.d/splash.png")

(if (functionp 'global-linum-mode)
    (global-linum-mode t))
(setq column-number-mode t)
(setq c-basic-offset 4)
(setq c-label-minimum-indentation 0)
(setq-default line-spacing 5)
(setq-default indent-tabs-mode nil)
(show-paren-mode t)
(global-auto-revert-mode t)
;; auto pair
(if (functionp 'electric-pair-mode)
    (electric-pair-mode 1))
(setq frame-title-format '("Emacs " emacs-version " - %b"))

;; backward kill line
(defun my:backward-delete-line ()
  (interactive)
  (kill-line 0)
  (indent-according-to-mode))
(global-set-key (kbd "<C-backspace>") 'my:backward-delete-line)

;; vi style key binding :-)
(global-set-key (kbd "C-o") (lambda ()
			      (interactive)
			      (end-of-line)
			      (newline)
			      (indent-according-to-mode)))

(defun my:insert-line-before (times)
  "Inserts a newline above the line containing the cursor"
  (interactive "p")
  (save-excursion
    (move-beginning-of-line 1)
    (newline times)))

(global-set-key (kbd "C-S-o") 'my:insert-line-before)

;; RET
(global-set-key (kbd "RET") 'newline-and-indent)

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

;; c mode hook
;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (setq comment-start "// ")
;;             (setq comment-end "")))

;; key bindings for Mac
(when (eq system-type 'darwin)
  (global-set-key [kp-delete] 'delete-char))

;; key bindings for Windows
(when (eq system-type 'windows-nt)
  (setq w32-pipe-read-delay 0)
  (set-face-attribute 'default nil :height 140))

;; window system
(defun if-no-window-system ()
  (setq xterm-mouse-mode 't))

(defun if-window-system ()
  (tool-bar-mode -1)
  (set-frame-size (selected-frame) 90 50))

(if window-system
    (if-window-system)
  (if-no-window-system))

;; F5 to locate this file
(defun my:find-dotfile ()
  (interactive)
  (let ((files '("~/Downloads/dotfiles/init.el"
                 "~/Documents/dotfiles/init.el")))
    (find-file (car (remove-if-not 'file-exists-p files)))))
(global-set-key (kbd "<f5>") 'my:find-dotfile)


;; packages setup

(defun my:setup-solarized ()
  (load-theme 'solarized-dark t))

(defun my:setup-ggtags ()
  (add-hook 'c-mode-hook
            '(lambda ()
               (require 'ggtags)
               (ggtags-mode 1))))

(defun my:setup-yasnippet ()
  (require 'yasnippet)
  (yas-global-mode 1))

(defun my:setup-exec-path-from-shell ()
  (exec-path-from-shell-initialize))

(defun my:company-face ()
  (custom-set-faces
   ;; company-scrollbar-bg
   ;; company-scrollbar-fg
   ;; company-tooltip-common
   ;; company-tooltip-common-selection
   ;; company-tooltip-annotation
   '(company-tooltip-annotation-selection ((t (:inherit company-tooltip-selection))))
   ;; company-tooltip
   ;; company-tooltip-selection
   ))

(defun my:setup-company ()
  (setq company-minimum-prefix-length 1)
  (global-company-mode t)
  (global-set-key (kbd "C-c y") 'company-yasnippet)
  ;; custom face
  (my:company-face))

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my:irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(defun my:setup-irony ()
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'my:irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  ;; company-mode
  (add-hook 'irony-mode-hook
            '(lambda ()
               (require 'company-irony-c-headers)))
  (eval-after-load 'company
    '(add-to-list 'company-backends '(company-irony-c-headers company-irony)))
  ;; ignore case
  (setq company-irony-ignore-case t))

(defun my:setup-face ()
  (set-face-attribute 'default nil :height 140)
  (set-face-attribute 'linum nil :height 120))

(defun my:setup-column-marker ()
  (require 'whitespace)
  (setq whitespace-style '(face lines-tail))
  (global-whitespace-mode t))

(defun my:setup-email ()
  (setq send-mail-function 'smtpmail-send-it
        smtpmail-smtp-server "smtp.163.com"
        smtpmail-stream-type 'ssl
        smtpmail-smtp-service 465
        user-full-name "mario"
        user-mail-address "mohu3g@163.com"))
;; ~/.authinfo
;; machine <smtp server> login <emial address> password <password>

(defun my:setup-lua ()
  (add-hook 'lua-mode-hook (lambda ()
                             (eval-after-load 'company
                               '(add-to-list 'company-backends 'company-lua)))))

(defun my:setup-company-ycmd ()
  (require 'company-ycmd)
  (company-ycmd-setup))

;; packages install

(defun my:install (package &optional setup)
  (unless (package-installed-p package)
    (package-install package))
  (if setup (funcall setup)))

(defun my:install-packages ()
  (interactive)
  (my:install 'company 'my:setup-company)
  (my:install 'solarized-theme 'my:setup-solarized)
  (my:install 'exec-path-from-shell 'my:setup-exec-path-from-shell)
  (my:install 'yasnippet 'my:setup-yasnippet)
  (my:install 'irony 'my:setup-irony)
  (my:install 'company-irony-c-headers)
  (my:install 'ggtags 'my:setup-ggtags)
  (my:install 'lua-mode 'my:setup-lua)
  (my:install 'company-ycmd 'my:setup-company-ycmd))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize)
  (my:install-packages)
  (my:setup-face))

(my:setup-email)
(my:setup-column-marker)
