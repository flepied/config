;; path setup

(setq load-path (cons (expand-file-name "~/emacs/") load-path))
(setq load-path (cons (expand-file-name "~/emacs/site-lisp/") load-path))

;; load configs from ~/emacs/site-lisp/config

(require 'cfg)

;; don't forget the trailling backslash !!!
(setq cfg-dirs (list (expand-file-name "~/emacs/site-lisp/config/")))

(load-cfgs base prog
	   c-prog
 	   calendar
 	   color
 	   compil
 	   dired
 	   dpkg
 	   gnus
 	   lisp-prog
 	   local
 	   mail-news
 	   mouse
 	   net
 	   options
 	   perl-prog
 	   python
 	   scheme-prog
 	   template
 	   web
 	   rpm
	   )

;;============================================================================
;;============================================================================
(if (fboundp 'set-language-environment)
    (set-language-environment "Latin-1"))

;;============================================================================
;;============================================================================
(setq project-name "Mandrake")
(setq dc-auto-insert-directory "~/templates/")
(eval-after-load "defaultcontent"
  '(setq dc-auto-insert-mode-alist (cons (cons 'makefile-mode "temp.mak")
					 dc-auto-insert-mode-alist)
	 dc-auto-insert-mode-alist (cons (cons 'c++-mode "temp.cc")
					 dc-auto-insert-mode-alist)))

;;============================================================================
;; pour diff et patch
;;============================================================================
(setq ediff-patch-options "--verbose --backup")

(setq diff-switches "-u")
(setq cvs-diff-options '("-u"))

;;============================================================================ 
;; desktop settings                                                            
;;============================================================================
(setq desktop-missing-file-warning nil)
(setq desktop-buffer-age-limit 10)

(eval-after-load "desktop" '(setq desktop-locals-to-save
                                  (append desktop-locals-to-save
					  '(compile-command))))

;;; pour le mail

(defun add-from-menu ()
  ""
  (define-key message-mode-map [menu-bar headers cena]
    '("From CENA" . add-from-cena))
  (define-key message-mode-map [menu-bar headers xfree86]
    '("From XFree86" . add-from-xfree86))
  (define-key message-mode-map [menu-bar headers teaser]
    '("From Teaser" . add-from-teaser))
  (define-key message-mode-map [menu-bar headers sugix]
    '("From Sugix" . add-from-sugix))
  (define-key message-mode-map [menu-bar headers eu]
    '("From Eu.Org" . add-from-eu-org))
)

(add-hook 'message-setup-hook 'add-from-menu)

(defun add-from (from)
  ""
  (interactive "sFrom address: ")
  (save-excursion
    (goto-char (point-min))
    (if (mail-position-on-field "From" t)
	(progn
	  (search-backward ": ")
	  (forward-char 2)
	  (kill-line)
	  (insert from) )
      (insert "From: " from "\n")
    ) ) )

(defun add-from-cena()
  (interactive)
  (add-from "Frederic Lepied <Frederic.Lepied@ath.cena.fr>"))

(defun add-from-xfree86 ()
  (interactive)
  (add-from "Frederic Lepied <lepied@XFree86.Org>"))

(defun add-from-debian ()
  (interactive)
  (add-from "Frederic Lepied <Lepied@Debian.Org>"))

(defun add-from-teaser ()
  (interactive)
  (add-from "Frederic Lepied <flepied@teaser.fr>"))

(defun add-from-eu ()
  (interactive)
  (add-from "Frederic Lepied <Frederic.Lepied@sugix.fr.eu.org>"))

(defun add-from-sugix ()
  (interactive)
  (add-from "Frederic Lepied <Frederic.Lepied@sugix.frmug.org>"))

(defun add-from-mandrake ()
  (interactive)
  (add-from "Frederic Lepied <flepied@mandrakesoft.com>"))

(if (string-equal (getenv "HOST") "calimero")
    (setenv "http_proxy" t t))

;;; pour la couleur

(and window-system
     (make-face 'font-lock-string-face)
     (set-face-foreground 'font-lock-string-face "DarkGreen")
     (make-face 'font-lock-reference-face)
     (set-face-foreground 'font-lock-reference-face "DarkBlue")
     (make-face 'font-lock-setter-face)
     (set-face-foreground 'font-lock-setter-face "Red")
     (make-face 'font-lock-test-face)
     (set-face-foreground 'font-lock-test-face "SteelBlue")
     )

;;; pour rendre les scripts exécutables

;; (defun make-write-exec ()
;;   "see if the file is a script and make it executable if it is."
;;   (save-excursion
;;     (goto-char (point-min))
;;     (if (looking-at "#!")
;;         (set-file-modes buffer-file-name (logior (file-modes buffer-file-name)
;; (+ 64 8 1)))))
;;   nil)
;; 
;; (add-hook 'after-save-hook 'make-write-exec)

;; put this also if you feel like it
(setq completion-ignored-extensions (cons "CVS/" completion-ignored-extensions))

;; pour auctex
;;(require 'tex-site)

(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))

;; support CORBA IDL
(setq font-lock-keywords
      '(("\\b\\(any\\|attribute\\|boolean\\|case\\|char\\|const\\|context\\|default\\|double\\|enum\\|exception\\|FALSE\\|float\\|in\\|inout\\|interface\\|long \\|module\\|Object\\|octet\\|oneway\\|out\\|raises\\|readonly\\|sequence\\|short\\|string\\|struct\\|switch\\|TRUE\\|typedef\\|unsigned\\|union\\|void\\)[ 
	(]" 1)
	("^\\(\\(\\sw\\|\\s_\\|[:~*&]\\)+[ 	]+\\)?\\(\\(\\sw\\|\\s_\\|[:~*&]\\)+[ 	]+\\)?\\(\\(\\sw\\|\\s_\\|[:~*&]\\)+[ 	]+\\)?\\([*&]+[ 	]*\\)?\\(\\(\\sw\\|\\s_\\|[:~*&]\\)+\\)[ 	]*(" 8 font-lock-function-name-face)
	("^\\(typedef[ 	]+struct\\|struct\\|static[ 	]+struct\\)[ 	]+\\(\\(\\sw\\|\\s_\\|[:~*&]\\)+\\)[ 	]*\\({\\|$\\)" 2 font-lock-function-name-face)
	))

(add-hook 'idl-mode-hook
	  (function
	   (lambda()
	     (make-local-variable 'font-lock-keywords-case-fold-search)
	     (make-local-variable 'font-lock-keywords)
	     (setq font-lock-keywords-case-fold-search nil)
	     (setq font-lock-keywords idl-font-lock-keywords)
	     (font-lock-mode 1)
	     )))

;; Indentation style for XFree86
(defvar xfree86-style '("xfree86"
                        (c-echo-syntactic-information-p . t)
                        (c-recognize-knr-p . t)
                        (c-basic-offset . 4)
                        (c-block-comments-indent-p . 3)
                        (c-hanging-braces-alist . ((substatement-open after)
                                                   (defun-close after)
                                                   (else-clause before)))
                        (c-comment-only-line-offset . 0)
                        (c-cleanup-list '(brace-else-brace))
                        (c-offsets-alist (string . -1000)
                                         (c . c-lineup-C-comments)
					 (defun-open . 0)
                                         (defun-close . 0)
                                         (defun-block-intro . +)
                                         (class-open . 0)
                                         (class-close . 0)
                                         (inline-open . +)
                                         (inline-close . 0)
                                         (ansi-funcdecl-cont . -)
                                         (knr-argdecl-intro . 4)
                                         (knr-argdecl . 0)
                                         (topmost-intro . 0)
                                         (topmost-intro-cont . 0)
                                         (block-open . 0)
                                         (block-close . 0)
                                         (brace-list-open . 0)
                                         (brace-list-close . 0)
                                         (brace-list-intro . +)
                                         (brace-list-entry . 0)
                                         (statement . 0)
                                         (statement-cont . +)
                                         (statement-block-intro . +)
                                         (statement-case-intro . +)
					 (statement-case-open . +)
                                         (substatement . +)
                                         (substatement-open . +)
                                         (case-label . 0)
                                         (access-label . -)
                                         (label . 0)
                                         (do-while-closure . 0)
                                         (else-clause . 0)
                                         (comment-intro . c-lineup-comment)
                                         (arglist-intro . c-lineup-arglist-intro-after-paren)
                                         (arglist-cont . 0)
                                         (arglist-cont-nonempty . c-lineup-arglist)
                                         (arglist-close . c-lineup-arglist)
                                         (cpp-macro . -1000)
                                         )
                        )
  "XFree86 coding style")

(add-hook 'c-mode-hook (function (lambda()
                                   (setq c-style-alist (cons xfree86-style c-style-alist))
;                                   (c-set-style "XFree86")
                                   (setq comment-column 40)
                                   (c-toggle-auto-hungry-state 1)
                                   (define-key c-mode-map [RET] 'newline-and-indent)
                                   )))

;; ;;============================================================================
;; ;; pour ldap
;; ;;============================================================================
;; (eval-after-load "ldap"
;;   '(setq ldap-host-info (cons '(dgac
;; 				(comment . "DGAC private LDAP service")
;; 				(host . "ldap.cenatls.cena.dgac.fr")
;; 				(base-dn . "o=DGAC, c=FR")
;; 			       (maxhits . "100"))
;; 			      ldap-host-info)
;; 	 ldap-default-host 'dgac))
;; 
;; (autoload 'ldap-mail-search "ldap"
;;   "Do an LDAP search for NAME's email address and display in echo area.
;; With prefix arg, prompt for the LDAP host to search from." t)

(message ".emacs completed")
(sit-for 1)

;; .emacs ends here
(custom-set-variables)
(custom-set-faces
 '(gnus-group-news-low-empty-face ((((class color) (background light)) (:foreground "Blue"))))
 '(gnus-group-mail-3-face ((((class color) (background light)) (:bold t :foreground "Blue"))))
 '(gnus-group-mail-low-face ((((class color) (background light)) (:bold t :foreground "LightBlue"))))
 '(gnus-group-mail-low-empty-face ((((class color) (background light)) (:foreground "DarkBlue"))))
 '(gnus-group-news-3-face ((((class color) (background light)) (:bold t :foreground "darkred")))))

