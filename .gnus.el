;;---------------------------------------------------------------
;; Project         : Imagine
;; File            : .gnus.el
;; Type		   : -*- emacs-lisp -*-
;; Version         : $Imagine$
;; Author          : Frederic Lepied
;; Created On      : Fri Aug 30 09:37:54 1996
;; Purpose         : 
;;---------------------------------------------------------------

(setq gnus-activate-foreign-newsgroups 10
      nnmail-split-methods '(("mail.todo" "^To:[^.]*lepied\\+todo")
			     ("mail.tosee" "^To:[^.]*lepied\\+tosee")
			     ("mail.cvs-log" "^X-Attribution: cvs-log")
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
			     ("mail.mandrake.cooker" "X-Loop: cooker@linux-mandrake.com")
			     ("mail.mandrake.fun" "X-Loop: fun@linux-mandrake.com")
			     ("mail.mandrake.mandrake" "X-Loop: mandrake@linux-mandrake.com")
			     ("mail.mandrake.all" "X-Loop: all@linux-mandrake.com")
			     ("mail.mandrake.security" "X-Loop: security@linux-mandrake.com")
			     ("mail.mandrake.ipaddr" "X-Loop: ipaddr@linux-mandrake.com")
			     ("mail.mandrake.future" "X-Loop: future@linux-mandrake.com")
			     ("mail.mandrake.diskdrake" "X-Loop: diskdrake@linux-mandrake.com")
			     ("mail.mandrake.oxchrpm" "X-Loop: oxchrpm@linux-mandrake.com")
			     ("mail.mandrake.paris" "X-Loop: paris@linux-mandrake.com")
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
			     ("mail.gene" "^\\(To\\|CC\\): .*gene[^@]*")
			     ("mail.guile" "gel@cygnus.com\\|guile")
			     ("mail.local" "^From: [^.]+$\\|^From: .*\\(dgac\\.fr\\|cena\\.fr\\)")
			     ("mail.mbox.mandrake" "^\\(To\\|CC\\): .*flepied@mandrakesoft.com")
			     ("mail.mandrake.cvs" "^X-CVS-module:")
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

;;; end of .gnus.el
