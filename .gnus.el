;;---------------------------------------------------------------
;; Project         : Imagine
;; File            : .gnus.el
;; Type		   : -*- emacs-lisp -*-
;; Version         : $Id: .gnus.el,v 1.3 2000-09-11 07:59:31 flepied Exp $
;; Author          : Frederic Lepied
;; Created On      : Fri Aug 30 09:37:54 1996
;; Purpose         : 
;;---------------------------------------------------------------

(add-load-path "~/emacs/mailcrypt/")

(load-library "mailcrypt")
(mc-setversion "gpg")

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
      nnmail-split-methods '(("mail.todo" "^To:[^.]*lepied\\+todo")
			     ("mail.tosee" "^To:[^.]*lepied\\+tosee")
			     ("mail.cvs-log" "^X-Attribution: cvs-log")
			     ("mail.xfree86.config" "X-Mailing-List: config@xfree86.org")
			     ("mail.xfree86.xinput" "X-Mailing-List: xinput@xfree86.org")
			     ("mail.xfree86" "\\(devel\\|members\\|beta\\|alpha\\)@XFree86.Org")
			     ("mail.pd3ics" "^\\(To\\|CC\\):[^.]*pd3ics")
;;			     ("mail.perso" "^From: [^.]*lepied")
			     ("mail.perso.xfree86" "^\\(To\\|CC\\):[^.]*lepied@xfree86.org")
			     ("mail.imagine" "^\\(To\\|CC\\):[^.]*imagine")
			     ("mail.junk" "^Subject: \\(test\\|subscribe\\|unsubscribe\\|printer job\\)")
			     ("mail.gtk" "X-Loop: gtk-list@redhat.com")
			     ("mail.mandrake.cassini" "X-Loop: cassini@linux-mandrake.com")
			     ("mail.mandrake.changelog" "X-Loop: changelog@linux-mandrake.com")
			     ("mail.mandrake.cooker-i18n" "X-Loop: cooker-i18n@linux-mandrake.com")
;			     ("mail.mandrake.cooker" "^Subject:.*\\[cooker\\]")
			     ("mail.mandrake.fun" "X-Loop: fun@linux-mandrake.com")
			     ("mail.mandrake.mandrake" "X-Loop: mandrake@linux-mandrake.com")
			     ("mail.mandrake.all" "X-Loop: all@linux-mandrake.com")
			     ("mail.mandrake.security" "X-Loop: security@linux-mandrake.com")
			     ("mail.mandrake.ipaddr" "X-Loop: ipaddr@linux-mandrake.com")
			     ("mail.mandrake.future" "X-Loop: future@linux-mandrake.com")
			     ("mail.mandrake.sparc" "X-Loop: sparc@linux-mandrake.com")
			     ("mail.mandrake.ports" "X-Loop: ports@linux-mandrake.com")
			     ("mail.mandrake.diskdrake" "X-Loop: diskdrake@linux-mandrake.com")
			     ("mail.mandrake.oxchrpm" "X-Loop: oxchrpm@linux-mandrake.com")
			     ("mail.mandrake.paris" "X-Loop: paris@linux-mandrake.com")
			     ("mail.mandrake.policy" "X-Loop: policy@linux-mandrake.com")
			     ("mail.mandrake.packages" "X-Loop: packages@linux-mandrake.com")
			     ("mail.mandrake.tools" "X-Loop: tools@linux-mandrake.com")
			     ("mail.mandrake.install" "X-Loop: install@linux-mandrake.com")
			     ("mail.mandrake.ergonomics" "X-Loop: ergonomics@linux-mandrake.com")
			     ("mail.mandrake.corpo" "X-Loop: corpo@linux-mandrake.com")
			     ("mail.mandrake.kernel" "X-Loop: kernel@linux-mandrake.com")
			     ("mail.mandrake.troll" "X-Loop: troll@linux-mandrake.com")
			     ("mail.mandrake.gmp" "X-Loop: gmp@linux-mandrake.com")
			     ("mail.mandrake.maintainers" "X-Loop: maintainers@linux-mandrake.com")
			     ("mail.usb" "X-Mailinglist: linux-usb")
			     ("mail.mico" "\\(mico\\|mico-devel\\)@vsb.informatik.uni-frankfurt.de")
			     ("mail.gimp-developer" "gimp-developer@")
			     ("mail.fnorb" "^X-URL: <http://www.dstc.edu.au/Fnorb/>")
			     ("mail.ilu" "ilu.PARC@xerox.com\\|ilu@parc.xerox.com")
			     ("mail.ppp" "^X-Mn-Key: PPP")
			     ("mail.linux.debian" "^X.*debian")
			     ("mail.linux.pnp" "pnp-list@redhat.com")
			     ("mail.linux.security" "linux-security")
			     ("mail.linux.alert" "linux-alert")
			     ("mail.cvs" "X-Loop: info-cvs@")
			     ("mail.meroon" "meroon")
			     ("mail.python-french" "^X-BeenThere: python@aful.org")
			     ("mail.python-gui" "^X-BeenThere: gui-sig@python.org")
			     ("mail.newsfeeds" "^X-BeenThere: newsfeeds@opensource.captech.com")
			     ("mail.redhat.devel" "X-Loop: redhat-devel-list@redhat.com")
			     ("mail.mosix" "X-list: mosix-list")
			     ("mail.handhelds" "X-BeenThere: handhelds@handhelds.org")
			     ("mail.nfs" "X-BeenThere: nfs@lists.sourceforge.net")
			     ("mail.lsb" "X-Loop: lsb")
			     ("mail.gene" "^\\(To\\|CC\\): .*gene[^@]*")
			     ("mail.guile" "gel@cygnus.com\\|guile")
			     ("mail.local" "^From: [^.]+$\\|^From: .*\\(dgac\\.fr\\|cena\\.fr\\)")
			     ("mail.mbox.mandrake" "^\\(To\\|CC\\): .*flepied@mandrakesoft.com")
			     ("mail.mandrake.cvs" "^X-CVS-module:")
			     ("mail.wacom" "\\[wacom\\]")
			     ("mail.rpmhelp" "rpmhelp@freezer-burn.org")
			     ("mail.autofs" "Sender: owner-autofs@linux.kernel.org")
			     ("mail.mandrake.cooker" "cooker@linux-mandrake.com")
			     ("mail.mbox" "")
			     )
      gnus-auto-expirable-newsgroups "mail"
      nnmail-expiry-wait 21
      nnmail-crosspost nil
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
      gnus-thread-hide-subtree t

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

(add-hook 'gnus-select-group-hook (function
				   (lambda nil
				     (setq bbdb/news-auto-create-p
					   (or
					    (string= "nnml:mail.mbox.mandrake" gnus-newsgroup-name)
					    (string= "nnml:mail.mbox.xfree86" gnus-newsgroup-name))))))

(setq mail-sources
           '((file :path "/var/mail/flepied")))

(setq message-dont-reply-to-names ".?lepied@")

;;; end of .gnus.el
