
(package-install 'ggtags)
(add-hook 'c-mode-hook '(lambda ()
                          (require 'ggtags)
                          (ggtags-mode 1)))

(provide 'init-ggtags)
