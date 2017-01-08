;; add subdirectories of `dir' to `load-path'
(defun add-subdirs-to-load-path (dir)
  "Add directories to `load-path' recusively."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(add-subdirs-to-load-path
 (concat
  (file-name-directory (or load-file-name buffer-file-name)) "configs"))

(require 'init)
