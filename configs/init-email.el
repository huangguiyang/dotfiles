
(setq send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.163.com"
      smtpmail-stream-type 'ssl
      smtpmail-smtp-service 465
      user-full-name "mario"
      user-mail-address "mohu3g@163.com")
;; ~/.authinfo
;; machine <smtp server> login <emial address> password <password>

(provide 'init-email)
