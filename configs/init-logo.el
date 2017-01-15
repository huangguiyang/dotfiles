
(defun set-splash-image-with-url (url file)
  (unless (file-exists-p file)
    (url-copy-file url file))
  (setq fancy-splash-image file))

;; http://llvm.org/img/DragonMedium.png
(unless (eq system-type 'windows-nt)
  (set-splash-image-with-url "http://llvm.org/img/DragonMedium.png"
                             "~/.emacs.d/dragon.png"))

(provide 'init-logo)
