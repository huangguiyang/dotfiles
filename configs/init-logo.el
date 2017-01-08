
(defun set-splash-image-with-url (url file)
  (unless (file-exists-p file)
    (url-copy-file url file))
  (setq fancy-splash-image file))

(set-splash-image-with-url "http://llvm.org/img/DragonMedium.png"
                           "~/.emacs.d/splash.png")

(provide 'init-logo)
