;;---------------------------------------------------------------
;; Project         : Imagine
;; File            : .gnus.el
;; Type		   : -*- emacs-lisp -*-
;; Version         : $Id: .gnus.el,v 1.5 2003-08-19 05:03:29 flepied Exp $
;; Author          : Frederic Lepied
;; Created On      : Fri Aug 30 09:37:54 1996
;; Purpose         : 
;;---------------------------------------------------------------

(add-load-path "~/emacs/mailcrypt/")

(load-library "mailcrypt")
(mc-setversion "gpg")

(defun To (u) (concat "^\\([Cc][Cc]\\|[Tt][Oo]\\|Mailing-List\\|X-[lL]oop\\|X-BeenThere\\|X-List\\):.*[ ,\"<]" u))
(defun ToMml (u) (To (concat u "@\\(mandrakesoft\\|linux-mandrake\\).com")))

(setq gnus-message-archive-method '(nnfolder "archive"
					     (nnfolder-directory   "~/Mail/archive")
					     (nnfolder-active-file "~/Mail/archive/active")
					     (nnfolder-get-new-mail nil)
					     (nnfolder-inhibit-expiry t))
      gnus-message-archive-group '((if (message-news-p)
				       "misc-news"
				     (concat "mail." (format-time-string
						      "%Y-%m" (current-time)))))
      )

(setq gnus-activate-foreign-newsgroups 10
      nnmail-split-methods `(("mail.todo" "^To:[^.]*lepied\\+todo")
			     ("mail.todo" "From: Frederic Lepied <Frederic.Lepied@sugix.frmug.org>")
			     ("mail.tosee" "^To:[^.]*lepied\\+tosee")
			     ("mail.spam" "\\[--SPAM--\\]")
			     ("mail.mandrake.cvs" "^X-CVS-module:\\|^X-CVSROOT:")
			     ("mail.cvs-log" "^X-Attribution: cvs-log")
			     ("mail.xfree86.config" ,(To "config@xfree86.org"))
			     ("mail.xfree86.xinput" ,(To "xinput@xfree86.org"))
			     ("mail.xfree86" "\\(devel\\|members\\|beta\\|alpha\\)@XFree86.Org")
			     ("mail.xpert" ,(To "xpert@XFree86.Org"))
			     ("mail.perso.xfree86" ,(To "lepied@xfree86.org"))
			     ("mail.perso.debian" ,(To "lepied@debian.org"))
			     ("mail.junk" "^Subject: \\(test\\|subscribe\\|unsubscribe\\|printer job\\)")
			     ("guru-advice" ,(ToMml "guru-advice"))
			     ("mail.mandrake.changelog" ,(ToMml "changelog"))
			     ("mail.mandrake.clic-dev-public" ,(ToMml "clic-dev-public"))
			     ("mail.mandrake.cooker" ,(ToMml "cooker"))
			     ("mail.mandrake.cooker-i18n" ,(ToMml "cooker-i18n"))
			     ("mail.mandrake.corpo" ,(ToMml "corpo"))
			     ("mail.mandrake.diskdrake" ,(ToMml "diskdrake"))
			     ("mail.mandrake.ergonomics" ,(ToMml "ergonomics"))
			     ("mail.mandrake.etools" ,(ToMml "etools"))
			     ("mail.mandrake.fun" ,(ToMml "fun"))
			     ("mail.mandrake.future" ,(ToMml "future"))
			     ("mail.mandrake.gmp" ,(ToMml "gmp"))
			     ("mail.mandrake.install" ,(ToMml "install"))
			     ("mail.mandrake.ipaddr" ,(ToMml "ipaddr"))
			     ("mail.mandrake.kernel" ,(ToMml "kernel"))
			     ("mail.mandrake.maintainers" ,(ToMml "maintainers"))
			     ("mail.mandrake.oxchrpm" ,(ToMml "oxchrpm"))
			     ("mail.mandrake.packages" ,(ToMml "packages"))
			     ("mail.mandrake.paris" ,(ToMml "paris"))
			     ("mail.mandrake.policy" ,(ToMml "policy"))
			     ("mail.mandrake.ports" ,(ToMml "ports"))
			     ("mail.mandrake.security" ,(ToMml "\\(security-discuss\\|security-announce\\)"))
			     ("mail.mandrake.security" ,(ToMml "security"))
			     ("mail.mandrake.security" ,(To "discuss@mandrakesecure.net"))
			     ("mail.mandrake.secteam" ,(To "secteam@mandrakesecure.net"))
			     ("mail.mandrake.sparc" ,(ToMml "sparc"))
			     ("mail.mandrake.tools" ,(ToMml "tools"))
			     ("mail.mandrake.hig" ,(ToMml "hig"))
			     ("mail.mandrake.troll" ,(ToMml "troll"))
			     ("mail.mandrake.direction"  ,(ToMml "direction"))
			     ("mail.mandrake.all" ,(ToMml "all"))
			     ("mail.mandrake.all-announce" ,(ToMml "all-announce"))
			     ("mail.mandrake.new-apps" ,(ToMml "new-apps"))
			     ("mail.mandrake.compil" ,(To "compil@mandrake.org"))
			     ("mail.glibc" ,(To "libc-alpha@"))
			     ("mail.vendor-sec" ,(To "vendor-sec@lst.de"))
			     ("mail.xvendor" ,(To "xvendor@lists.openwall.com"))
			     ("mail.usb" ,(To "linux-usb"))
			     ("mail.rpm" ,(To "rpm-list@redhat.com"))
			     ("mail.curl" ,(To "curl-library@lists.sourceforge.net"))
			     ("mail.hotplug" ,(To "linux-hotplug-devel"))
			     ("mail.narval-en" ,(To "narval-en"))
			     ("mail.irda" ,(To "linux-irda@pasta.cs.UiT.No"))
			     ("mail.mico" "\\(mico\\|mico-devel\\)@vsb.informatik.uni-frankfurt.de")
			     ("mail.openssh-dev" ,(To "openssh-unix-dev@mindrot.org"))
			     ("mail.fhs" ,(To "fhs-discuss@ucsd.edu"))
			     ("mail.linux.pnp" "pnp-list@redhat.com")
			     ("mail.linux.security" "linux-security")
			     ("mail.linux.alert" "linux-alert")
			     ("mail.newsfeeds" "^X-BeenThere: newsfeeds@opensource.captech.com")
			     ("mail.pam" ,(To "pam-list@redhat.com"))
			     ("mail.redhat.devel" ,(To "redhat-devel-list@redhat.com"))
			     ("mail.mosix" ,(To "mosix-list"))
			     ("mail.handhelds" ,(To "handhelds@handhelds.org"))
			     ("mail.nfs" ,(To "nfs@lists.sourceforge.net"))
			     ("mail.lds" ,(To "lds.*@"))
			     ("mail.lsb" ,(To "lsb.*@"))
			     ("mail.zcip" ,(To "zcip@linux.kernel.org\\|zeroconf-workers@lists.sourceforge.net"))
			     ("mail.zeroconf" ,(To "zeroconf@merit.edu"))
			     ("mail.pleac" ,(To "pleac-discuss@lists.sourceforge.net"))
			     ("mail.local" "^From: [^.]+$\\|^From: .*\\(dgac\\.fr\\|cena\\.fr\\)")
			     ("mail.mbox.mandrake" "^\\([Cc][Cc]\\|[Tt][Oo]\\):.*[ ,\"<]flepied@mandrakesoft.com")
			     ("mail.lads" ,(To "lads@lepied.com"))
			     ("mail.canada" ,(To "canada@mandrakesoft.com"))
			     ("mail.mbox.cvs" ,(To "cvs@mandrakesoft.com"))
			     ("mail.mbox.sf" ,(To "flepied@users.sourceforge.net"))
			     ("mail.apt-rpm" ,(To "apt-rpm@distro.conectiva.com.br"))
			     ("mail.wacom" "\\[wacom\\]")
			     ("mail.perso.lepied" ,(To "\\(famille\\|fred\\|frederic\\)@lepied.com"))
			     ("mail.rpmhelp" ,(To "rpmhelp@"))
			     ("mail.autofs" ,(To "autofs@linux.kernel.org"))
			     ("mail.linux.debian" "^X-Mailing-List:.*debian")
			     ("mail.cvs" ,(To "bug-cvs@gnu.org"))
			     ("mail.mandrake.mandrake" ,(ToMml "mandrake"))
			     ("mail.mbox" "")
			     )
      gnus-auto-expirable-newsgroups "mail"
      nnmail-expiry-wait 21
;      nnmail-crosspost t
      gnus-secondary-select-methods '((nnml ""))

      ;; Threading 
      gnus-summary-make-false-root 'adopt
      gnus-thread-score-function 'max
;      gnus-summary-make-false-root 'dummy
;      gnus-score-find-score-files-function 'gnus-score-find-hierarchical
      gnus-thread-show-structure t
      gnus-thread-ignore-subject t ; so that subject changes within a thread aren't split apart.
      gnus-thread-sort-functions '(gnus-thread-sort-by-number gnus-thread-sort-by-total-score)

      ;; Pour afficher le nombre d'articles dans la thread et pour cacher les threads
      ;; par défaut.
      gnus-summary-line-format "%U%R%z%I%((%3t)%[%4L: %-20,20a%]%) %s\n"
;      gnus-thread-hide-subtree t

      gnus-button-url 'w3-fetch
      gnus-asynchronous t
;      gnus-use-adaptive-scoring t

      ;; Groupes de mail toujours visibles
      gnus-permanently-visible-groups "^nnml:"
 
      ;; No question from gnus...
      gnus-break-pages nil
      gnus-novice-user nil
      gnus-subscribe-newsgroup-method 'gnus-subscribe-hierarchically
      gnus-interactive-catchup nil
      gnus-auto-select-first nil
      gnus-large-newsgroup ""

      ;; Uuencoded and shar rules
      gnus-uu-user-view-rules '(("wav$\\|au$\\|WAV$\\|AU$" "auplay")
				("jpg$\\|gif$" "xv -perfect -best24 -8"))
      gnus-uu-view-and-save t
      gnus-uu-do-not-unpack-archives t

      ;; Saving defaults
      gnus-default-article-saver 'gnus-summary-save-in-file
      gnus-article-save-directory "~/MAIL/"

     )

(if (fboundp 'gnus-article-display-x-face)
    (add-hook 'gnus-article-display-hook 'gnus-article-display-x-face t))

(setq gnus-article-x-face-too-ugly ".*epied.*")

;;(require 'mime-setup)

(setq gnus-signature-file "~/.signature")

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-message)

;; UCE
(autoload 'uce-reply-to-uce "uce" "Reply to UCEs" t nil)

;; If you want to use it with Gnus also use

(setq uce-mail-reader 'gnus)

;; (add-hook 'gnus-article-display-hook `(lambda ()
;;          (gnus-article-de-quoted-unreadable)
;;          (gnus-article-emphasize)
;;          (gnus-article-hide-boring-headers)
;;          (gnus-article-hide-headers-if-wanted )
;;          (gnus-article-hide-pgp)
;;          (gnus-article-highlight-citation)
;; 	 (gnus-article-date-local)
;; ))

(add-hook 'gnus-article-prepare-hook `(lambda ()
         (gnus-article-de-quoted-unreadable)
         (gnus-article-emphasize)
         (gnus-article-hide-boring-headers)
         (gnus-article-hide-headers-if-wanted )
         (gnus-article-hide-pgp)
         (gnus-article-highlight-citation)
	 (gnus-article-date-local)
))
(setq message-cite-function 'message-cite-original-without-signature)

;; (add-hook 'gnus-select-group-hook (function
;; 				   (lambda nil
;; 				     (setq bbdb/news-auto-create-p
;; 					   (or
;; 					    (string= "nnml:mail.mbox.mandrake" gnus-newsgroup-name)
;; 					    (string= "nnml:mail.mbox.xfree86" gnus-newsgroup-name))))))

(setq mail-sources
           '((file :path "/var/mail/flepied")))

(setq message-dont-reply-to-names ".?lepied@")

;; from Pixel
(defmacro ilam (&rest body) `(lambda () (interactive) ,@body))

(defun add-from-to()
  (interactive)
  (beginning-of-buffer)
  (search-forward "--text follows") (next-line 1) (beginning-of-line)
  (let ((beg (point)))
    (search-forward " writes:")
    (backward-word 1) (backward-char 1)
    (let ((address (buffer-substring beg (point))))
      (message-goto-to) (beginning-of-line) (forward-char 4) (insert address)
      (insert ", ") (backward-char 2))))

(add-hook 'message-mode-hook '(lambda () 
				(local-set-key [(meta return)] (ilam (forward-char) (beginning-of-line) (insert "\n\n\n") (previous-line 2)))
				(local-set-key [(control ?c) (control ?t)] 'add-from-to)
				))

;;; end of .gnus.el
