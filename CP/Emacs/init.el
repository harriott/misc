;; vim: se ft=lisp:

;; $misc/CP/Emacs/init.el
;; ------------------------
;; linux:
;;  handled in  $bSc/repeatable/Emacs.sh
;; MSwin10:
;;  cpi $MSwin10\user\Emacs\init.el $Env:AppData\.emacs.d\init.el
;;  or symlink to  ~\AppData\Roaming\.emacsd\init.el  ($MSwin10\symlinks.ps1)
;;  or can be called by  $MSwin10\user\Emacs\initPoint.el

;; notes for the curious
;; ---------------------
;; $Env:AppData\.emacs.d  directory
;; don't symlink it from Dropbox - some packages will fail to load
;;  just let it get populated from your  ~/.emacs.d/init.el
;;   (If using  straight.el  this takes a long time...)
;; robocopy /mir $Env:AppData\.emacs.d $ITstack\MSwin-emacsd/RC /NP

;; I began here by adapting code from
;;  literatemacs  https://github.com/joseph8th/literatemacs - with thanks

;; I'm coming at this as a competent Vim user
;; so I'm managing this file from gVim with code folding implemented by
;; $vimfiles/ftplugin/lisp.vim
;;  https://github.com/harriott/vimfiles/blob/master/ftplugin/lisp.vim

;;;; 1 package management option 1 bootstrap  straight.el
;; 0 requires  $Env:AppData\.emacs.d\early-init.el  to undefine  package-enable-at-startup
(setq straight-check-for-modifications 'nil)

;; 1 install straight.el
(defvar bootstrap-version)
(setq package-enable-at-startup nil)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; 2 install use-package
(straight-use-package 'use-package)

;; 3 configure use-package to use straight.el by default
(use-package straight
   :custom (straight-use-package-by-default t))

; ;;;; 1 package management option 2 bootstrap  use-package
; (require 'package)

; ;;; set package archives
; (setq package-check-signature nil)  ; because GNU ELPA keeps choking on the sigs
; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
; (setq package-enable-at-startup nil)

; (package-initialize)
; (unless package-archive-contents
;     (package-refresh-contents))

; ;;; bootstrap use-package
; (unless (package-installed-p 'use-package)
;     (package-refresh-contents)
;     ;; this extra line was needed
;     (package-install 'use-package))

; (setq use-package-verbose t)
; (setq use-package-always-ensure t)
; (eval-when-compile (require 'use-package))
; (use-package auto-compile
;     :config (auto-compile-on-load-mode))
; (setq load-prefer-newer t)

; ;;;; 2 use-package-ensure
; ;; ensure all packages are installed
; (require 'use-package-ensure)
; (setq use-package-always-ensure t)

; ;;;; 2 auto-package-update
; (use-package auto-package-update
;     :config
;     (setq auto-package-update-delete-old-versions t)
;     (setq auto-package-update-hide-results t)
;     (setq auto-package-update-show-preview t)
;     (auto-package-update-maybe))

;;;; 3 Paradox
;; for alternative package searches
(use-package paradox)
(setq paradox-github-token t) ; don't bother with integrated GitHub starring

;;;; 4 Custom auto-created
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file)

;;;; 5 settings 0 prepare
;; general.el - not entirely sure why...
(use-package general)

;; local lisp
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/harriott-zenburn-emacs/")

;;;; 5 settings 1
;; Calendar
(general-define-key "C-x c" 'calendar)

;; ESUP
(use-package esup)

;; set locale to UTF8
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;; auto-save backup lock
;; auto-save filess (= /home/user/#foo.txt#)
(when (eq system-type 'gnu/linux)
    (setq auto-save-file-name-transforms '(("\\`/.*/\\([^/]+\\)\\'" "~/.emacs_autosave/\\1" t))))
(when (eq system-type 'windows-nt)
    (setq auto-save-file-name-transforms '(("\\`/.*/\\([^/]+\\)\\'" "c:/Users/troin/.emacs_autosave/\\1" t))))
    ;; doesn't have any effect
(setq auto-save-interval 20) ; default is 300 characters

;; backup files (= /home/user/foo.txt~)
; (setq backup-directory-alist '(("." . "~/.emacs_backups/")))
; - auto generated as needed on  linux
(setq make-backup-files nil)  ; I don't want to manage them

;; lock files (= /home/user/.#foo.txt)
(setq create-lockfiles nil)  ; I don't need them

;;; Calendar-mode
;; European style
(add-hook 'calendar-load-hook
    (lambda ()
    (calendar-set-date-style 'european)))

;; French holidays
(require 'french-holidays)
(setq calendar-holidays holiday-french-holidays)

;; geophysical location
(setq calendar-latitude 48.9)
(setq calendar-longitude 2.4)
(setq calendar-location-name "Paris, France")

;; tweaks to  $GHrUse/emacs/emacs-mirror-emacs/lisp/calendar/calendar.el
(defun bright-diary-day ()
  (face-remap-add-relative 'diary '(:weight ultra-bold)))
(add-hook 'calendar-mode-hook 'bright-diary-day)
; (defun bright-today ()
  ; (face-remap-add-relative 'calendar-today '(:weight ultra-bold)))
; (add-hook 'calendar-mode-hook 'bright-today)
(add-hook 'calendar-today-visible-hook 'calendar-mark-today)
(setq calendar-mark-diary-entries-flag t)

;;; coding
;; PowerShell Mode
(use-package powershell)

;; vimrc-mode
(use-package vimrc-mode)
(add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode))

;;; coding - Markdown Mode
(use-package markdown-mode
    :mode ("\\.gfm\\'" "\\.markdown\\'" "\\.md\\'")
    :preface (defun my/markdown-OVERVIEW () (markdown-cycle t))
    :init
        ; (add-hook 'markdown-mode-hook #'my/markdown-OVERVIEW) ; open in OVERVIEW
        (add-hook 'markdown-mode-hook 'variable-pitch-mode)
    (setq markdown-command "pandoc"))

;;; column & line numbers
; in mode line
(column-number-mode t)
(line-number-mode t)

; relative numbers in gutter
(global-display-line-numbers-mode t)
(setq display-line-numbers-type `relative)

;;; directories files
;; edit the file, not the link
(setq vc-follow-symlinks t)

;; emacs-neotree
(use-package neotree)
(global-set-key (kbd "C-c n") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; full file-path into kill-ring
(global-set-key (kbd "C-c f") (lambda () (interactive) (kill-new buffer-file-name)))

;; recentf
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(run-at-time nil (* 5 60) 'recentf-save-list)

;; Speedbar
(global-set-key (kbd "C-#") 'sr-speedbar-toggle)
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t) ; show all files

;;; directories files - Dired
;; all-the-icons-dired
(use-package all-the-icons-dired
    :config
    (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
    :if (display-graphic-p))

;; Dired+
(when (eq system-type 'windows-nt)
    (use-package dired+)
    ) ;; some extra functionality

;; Dirvish
(when (eq system-type 'gnu/linux)
    (use-package dirvish)
    (dirvish-override-dired-mode)
    ) ;; loads of extra functionality

;;; directories files - reverting
;; Global Auto Revert mode
(global-auto-revert-mode t) ; only if no local changes to a file
;; revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; https://emacs.stackexchange.com/a/172/26821
(global-set-key (kbd "C-c v") (lambda ()
    (interactive)
    (revert-buffer t t t)
    (message "buffer is reverted")))

;; Revert Buffer All
(use-package revert-buffer-all
    :commands (revert-buffer-all))
(global-set-key (kbd "C-S-M-r") 'revert-buffer-all)

;;; editing
;; all-the-icons-completion
(use-package all-the-icons-completion)
(all-the-icons-completion-mode)
(add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup)

;; anzu
(use-package anzu)
(global-anzu-mode +1)
(global-set-key [remap query-replace] 'anzu-query-replace)
(global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
(setq anzu-cons-mode-line-p nil)  ; for Spaceline

;; autopair
(electric-pair-mode 1)

;; Company
(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

;; cycle-spacing
(bind-key "M-SPC" 'cycle-spacing)  ; needs some other keybind in Openbox

;;; editing - undo
;; bigger undo (thanks to  ideasman42)
(setq undo-limit 6710886400) ;; 64mb.
(setq undo-strong-limit 100663296) ;; 96mb.
(setq undo-outer-limit 1006632960) ;; 960mb.

;; Undo Fu
(use-package undo-fu
    :config
    (global-set-key (kbd "C-M-z") 'undo-fu-only-undo)
    (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

;;; interface
;; Evil
(setq evil-default-state 'emacs)
(setq evil-shift-width 0)
(use-package evil :init (setq evil-undo-system 'undo-fu))
(evil-mode 1)
(evil-set-initial-state 'dired-mode 'normal)
(evil-set-initial-state 'dokuwiki-mode 'normal)
(evil-set-initial-state 'emacs-lisp-mode 'normal)
(evil-set-initial-state 'markdown-mode 'normal)
(evil-set-initial-state 'sh-mode 'normal) ; Shell-script mode

;; flash not beep
(setq visible-bell 1)

;; full path in frame title
(setq frame-title-format
    (list '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Helpful
(use-package helpful)
(global-set-key (kbd "C-h Y") #'helpful-key) ; alternative to describe-key
(global-set-key (kbd "C-h V") #'helpful-variable) ; alternative to describe-variable

;; Hydra
(use-package hydra)

;; ts.el - more convenient date and time library
(use-package ts)

;; which-key
(use-package which-key)
(which-key-mode)

;; Windmove
(use-package windmove
  :bind
  (("<f2> <right>" . windmove-right)
   ("<f2> <left>" . windmove-left)
   ("<f2> <up>" . windmove-up)
   ("<f2> <down>" . windmove-down)
   ))

;;; layout
(global-hl-line-mode 1) ;; HL Mode
(setq-default word-wrap t) ;; don't break words
(show-paren-mode t) ;; highlight corresponding parentheses when cursor is on one
(use-package minimap) ;; Minimap

;; DokuWiki
(add-hook 'dokuwiki-mode-hook 'variable-pitch-mode)
(use-package dokuwiki-mode :mode ("\\.dw\\'")) ;; emacs-dokuwiki-mode

;; Emacs Dashboard
(setq dashboard-items '((recents  . 25)))
(use-package dashboard
    :ensure t
    :config
    (dashboard-setup-startup-hook))

;; git-gutter.el
(use-package git-gutter)
(global-git-gutter-mode t)

;; highlight nested parentheses
(use-package rainbow-delimiters
    :config
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; Narrowing allowed
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; no menu along the top
(menu-bar-mode -1)
;; no shortcut buttons along the top
(tool-bar-mode 0)

;; Org-mode
(add-hook 'org-mode-hook 'variable-pitch-mode)
(setq org-startup-with-inline-images t) ;; display referenced images

;; Origami
(use-package origami)
(global-origami-mode)

;; show color codes
(use-package rainbow-mode
    :config
    (setq rainbow-x-colors nil)
    (add-hook 'prog-mode-hook 'rainbow-mode))

;; spaceline-config
(use-package spaceline)
    (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)  ; yellow = evil
    (spaceline-emacs-theme)  ; can comment out

;;; layout - cursor
(setq-default cursor-type 'bar) ;; has little effect

;; beacon
(use-package beacon)
(beacon-mode 1)

;;; layout - font
;; all-the-icons
(use-package all-the-icons :if (display-graphic-p))

;; defaults (thanks to Protesilaos Stavrou)
(when (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil :family "Ubuntu Mono" :height 100)
    (set-face-attribute 'fixed-pitch nil :family "Ubuntu Mono")
    (set-face-attribute 'variable-pitch nil :family "Ubuntu"))
(when (eq system-type 'windows-nt)
    (set-face-attribute 'default nil :family "Lucida Console" :height 100)
    (set-face-attribute 'fixed-pitch nil :family "Lucida Console")
    (set-face-attribute 'variable-pitch nil :family "Arial"))

; ;;; layout - gruvbox-theme
; (use-package gruvbox-theme)
;   (load-theme 'gruvbox-dark-soft t)

;;; layout - GUI frame size
(if (display-graphic-p) (when (string= (system-name) "sbMb")
        ; (progn (setq default-frame-alist '( (height . 59) (width . 106)))))) ; for default font
        (progn (setq default-frame-alist '( (height . 72) (width . 106)))))) ; for Ubuntu 100

(if (display-graphic-p) (when (string= (system-name) "HPEB840G36")
        (progn (setq default-frame-alist '( (height . 48) (width . 106))))))
; further increasing the height can cause the frame to shoot off below the screen

(if (display-graphic-p) (when (string= (system-name) "HPEB840G37")
        (progn (setq default-frame-alist '( (height . 65) (width . 120))))))
; further increasing the height can cause the frame to shoot off below the screen

; ;;; layout - Modus themes
; (use-package emacs
;     :init
;     ;; Add all your customizations prior to loading the themes
;     (setq modus-themes-italic-constructs t
;           modus-themes-bold-constructs nil
;           modus-themes-region '(bg-only no-extend))
;     :config
;     ;; Load the theme of your choice:
;     (load-theme 'modus-vivendi) ;; OR (load-theme 'modus-vivendi)
;     :bind ("<f5>" . modus-themes-toggle))

;;; layout - Zenburn
(setq zenburn-use-variable-pitch t) ;; use variable-pitch fonts for some headings and titles
(setq zenburn-scale-org-headlines t) ;; scale headings in org-mode
(setq zenburn-scale-outline-headlines t) ;; scale headings in outline-mode
(use-package zenburn-theme)  ; gets the original
; (require 'zenburn-theme)  ; gets my version
  (load-theme 'zenburn t)

;;; minibuffer - Consult
(use-package consult
    :bind (
          ("C-c m" . consult-mode-command)
          ("C-c k" . consult-kmacro)
          ("C-x M-:" . consult-complex-command)  ; replaces  repeat-complex-command
          ("C-x b" . consult-buffer)  ; replacement for  switch-to-buffer
                                      ; includes file history and preview
          ;; M-g bindings (goto-map)
           ("M-g i" . consult-imenu)
           ("M-g k" . consult-global-mark)
           ("M-g m" . consult-mark)
           ("M-g o" . consult-outline)  ; shows headings, if available
          ;; M-s bindings (search-map)
           ("M-s e" . consult-isearch-history)
           ("M-s l" . consult-line)  ; jump to line containing regex
          ("M-y" . consult-yank-pop)
          ("<help> a" . consult-apropos)
          ;; isearch integration
           :map isearch-mode-map
           ("M-e" . consult-isearch-history)    ; replaces  isearch-edit-string
           ("M-s e" . consult-isearch-history)  ; replaces  isearch-edit-string
          ;; Minibuffer history
           :map minibuffer-local-map
           ("M-s" . consult-history)   ; replaces  next-matching-history-element
           ("M-r" . consult-history)  ; replaces  previous-matching-history-element
           ; not sure what's the benefit
          )
    :hook (completion-list-mode . consult-preview-at-point-mode)  ; does what?
    :init)

;;; minibuffer - Embark
(use-package embark
  :bind
  (("C-c e" . embark-act)
   ("C-c d" . embark-dwim)
   ("C-h B" . embark-bindings))  ; alternative for  describe-bindings
  :init
  ; replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  ; :config
  ;; hide the mode line of the Embark live/completions buffers
  ; (add-to-list 'display-buffer-alist
               ; '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 ; nil
                 ; (window-parameters (mode-line-format . none))))
  )
(use-package embark-consult :after (embark consult))

;;; minibuffer - history
(save-place-mode 1)
(savehist-mode 1)
(setq history-delete-duplicates t)
(setq history-length t) ; = no limit
(setq isearch-resume-in-command-history 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

;;; minibuffer - Marginalia
(use-package marginalia
    :general
    (:keymaps 'minibuffer-local-map
              "M-A" 'marginalia-cycle)
    :custom
    (marginalia-max-relative-age 0)
    (marginalia-align 'right)
    :init
    (marginalia-mode))

;;; minibuffer - Orderless
(setq orderless-matching-styles '(orderless-flex))
(use-package orderless
    :ensure t
    :custom
    (completion-styles '(orderless basic))
    (completion-category-overrides '((file (styles basic partial-completion)))))

;;; minibuffer - vertico
(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-count 16) ; number of candidates to display
  (setq vertico-resize t)
  (setq vertico-cycle nil) ; Go from last to first candidate and first to last (cycle)?
  :general
  (:keymaps 'vertico-map
            "<tab>" #'vertico-insert  ; insert selected candidate into text area
            "<escape>" #'minibuffer-keyboard-quit  ; close minibuffer
            "C-M-n" #'vertico-next-group
            "C-M-p" #'vertico-previous-group)
  )

;;; open in gVim
(when (eq system-type 'gnu/linux)
    (global-set-key (kbd "C-c g") (lambda () (interactive)
        (call-process "gvim" nil 0 nil buffer-file-name (format "+%d" (line-number-at-pos nil t)))
        (message "opened in gVim"))))

(when (eq system-type 'windows-nt)
    (global-set-key (kbd "C-c g") (lambda () (interactive)
        (call-process "C:/Vim/vim90/gvim.exe" nil 0 nil buffer-file-name)
        (message "opened in gVim"))))

