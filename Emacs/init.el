;; vim: se ft=lisp:

;; $onGH/misc/Emacs/init.el
;; ------------------------
;; linux:
;;  handled in  $bSc/repeatable/Emacs.sh
;; MSwin10:
;;  cpi $MSwin10\user\Emacs\init.el $Env:AppData\.emacs.d\init.el
;;  or symlink to  ~\AppData\Roaming\.emacsd\init.el  ($MSwin10\symlinks.ps1)
;;  or can be called by  $MSwin10\user\Emacs\initPoint.el

;; $Env:AppData\.emacs.d  directory
;; don't symlink it from Dropbox - some packages will fail to load
;;  just let it get populated from your  ~/.emacs.d/init.el
;;   (If using  straight.el  this takes a long time...)
;; robocopy /mir $Env:AppData\.emacs.d $ITstack\MSwin-emacsd/RC /NP

;; I began here by adapting code from
;;  literatemacs  https://github.com/joseph8th/literatemacs - with thanks

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

;;;; 1 package management option 2 bootstrap  use-package
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
(add-to-list 'load-path "~/.emacs.d/TobiasZawada-md-outline-list")

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
        (add-hook 'markdown-mode-hook #'my/markdown-OVERVIEW)
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

;; Dired+
(when (eq system-type 'windows-nt)
    (use-package dired+)
    ) ;; some extra functionality

;; Dirvish
(when (eq system-type 'gnu/linux)
    (use-package dirvish)
    (dirvish-override-dired-mode)
    ) ;; loads of extra functionality

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

;;; directories files - reverting
;; Global Auto Revert mode
(global-auto-revert-mode t) ; only if no local changes to a file
;; revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; https://emacs.stackexchange.com/a/172/26821
(global-set-key (kbd "C-c r") (lambda ()
    (interactive)
    (revert-buffer t t t)
    (message "buffer is reverted")))

;;; editing
;; anzu
(use-package anzu)
(global-anzu-mode +1)
(global-set-key [remap query-replace] 'anzu-query-replace)
(global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)

;; autopair
(electric-pair-mode 1)

;; cycle-spacing
(bind-key "M-SPC" 'cycle-spacing)  ; needs some other keybind in Openbox

;;; interface
;; Evil
(setq evil-default-state 'emacs)
(setq evil-shift-width 0)
(use-package evil)
(evil-mode 1)
(evil-set-initial-state 'dired-mode 'normal)
(evil-set-initial-state 'dokuwiki-mode 'normal)
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
(use-package dashboard
    :ensure t
    :config
    (dashboard-setup-startup-hook))

;; font
(when (member "Ubuntu" (font-family-list))
    (set-frame-font "Ubuntu 9" t t))

;; GUI frame size
(if (display-graphic-p)
    (when (string= (system-name) "sbMb")
        (progn (setq default-frame-alist '( (height . 68) (width . 106)))))
    ) ; assuming Ubuntu 9

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

; ;;; layout - gruvbox-theme
; (use-package gruvbox-theme)
;   (load-theme 'gruvbox-dark-soft t)

; ;;; layout - Smart Mode Line
; (use-package smart-mode-line
;     :init
;     (setq sml/no-confirm-load-theme t)
;     ; Error ... Wrong number of arguments
;     (setq sml/theme)
;     )

;;; layout - Zenburn
(setq zenburn-use-variable-pitch t) ;; use variable-pitch fonts for some headings and titles
(setq zenburn-scale-org-headlines t) ;; scale headings in org-mode
(setq zenburn-scale-outline-headlines t) ;; scale headings in outline-mode
(use-package zenburn-theme)
  (load-theme 'zenburn t)

;;; open in gVim
(when (eq system-type 'gnu/linux)
    (global-set-key (kbd "C-c g") (lambda ()
        (interactive)
        (call-process "gvim" nil 0 nil buffer-file-name)
        (message "opened in gVim"))))

(when (eq system-type 'windows-nt)
    (global-set-key (kbd "C-c g") (lambda ()
        (interactive)
        (call-process "C:/Vim/vim90/gvim.exe" nil 0 nil buffer-file-name)
        (message "opened in gVim"))))

;;; minibuffer - Consult
(use-package consult
    :bind (
          ("M-y" . consult-yank-pop)
          ("<help> a" . consult-apropos)
          )
    :init)

;;; minibuffer - history
(save-place-mode 1)
(savehist-mode 1)
(setq history-delete-duplicates t)
(setq history-length t) ; = no limit
(setq isearch-resume-in-command-history 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

;;; minibuffer - Marginalia
(use-package marginalia
    ; :load-path "elpa/marginalia-20220721.1833"
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
