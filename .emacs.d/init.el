;; -*- mode: emacs-lisp; tab-width: 2; -*-

(when (version< emacs-version "25.1")
  (error "Pastel requires at least GNU Emacs 25.1, but you're running %s" emacs-version))

(defvar pastel-dir (file-name-directory load-file-name)
  "The root dir of the Emacs Pastel distribution.")

;; always load newest byte code
(setq load-prefer-newer t)

(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '((width . 160) (height . 50))
            default-frame-alist
            '((width . 160) (height . 50)))))

;; set user information
(setq user-full-name "Edward Fitz Abucay"
      user-mail-address "eabucay@vastorigins.net")

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; newline at eof
(setq require-final-newline t)

;; reduce frequency of garbage collection
(setq gc-cons-threshold 50000000)

(setq-default indent-tabs-mode nil)     ;; don't use tabs to indent
(setq-default tab-width 2)              ;; adjust correct appearance

;; smart tab behaviour
(setq tab-always-indent 'complete)

(menu-bar-mode -1)                      ;; remove the menu bar
(global-hl-line-mode t)                 ;; highlight the current line

(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (blink-cursor-mode -1)))

;; disable bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; global variables
(setq
 initial-scratch-message nil
 initial-major-mode 'org-mode
 create-lockfiles nil
 make-backup-files nil
 auto-save-default nil
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; encoding settings
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; buffer local variables
(setq-default c-basic-offset 2)

;; for buffer garbled
;;(add-hook 'isearch-update-post-hook 'redraw-display)

;; suppress ad-redefinition warnings
(setq ad-redefinition-action 'accept)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")
                    ("marmalade" . "http://marmalade-repo.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(require 'diminish)      ;; if :diminish is used
(require 'bind-key)      ;; if any :bind variant is used

(use-package org
  :ensure t
  :pin gnu)

(use-package ensime
  :ensure t
  :pin melpa-stable)

;;(use-package evil
;;  :ensure t
;;  :config
;;  (progn
;;    (define-key evil-normal-state-map [escape] 'keyboard-quit)
;;    (define-key evil-visual-state-map [escape] 'keyboard-quit)
;;    (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;;    (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;;    (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;;    (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;;    (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;;    (evil-mode t)))

;; enable helm
(use-package helm
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    (setq helm-idle-delay 0.0
          helm-input-idle-delay 0.01
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t)

    (use-package helm-ag
      :ensure t
      :bind ("C-c a" . helm-ag))

    (use-package helm-descbinds
      :ensure t
      :bind ("C-h b" . helm-descbinds))

    (use-package helm-projectile
      :ensure t
      :bind ("C-c h" . helm-projectile))

    (use-package helm-swoop
      :ensure t
      :bind ("C-c o" . helm-swoop))

    (helm-mode t))
  :bind (("C-h a" . helm-apropos)
         ("C-x C-b" . helm-buffers-list)
         ("C-x b" . helm-mini)
         ("C-x p" . helm-top)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c SPC" . helm-all-mark-rings)))

;; disables ido mode
(ido-mode -1)

(use-package undo-tree
  :diminish undo-tree-mode
  :ensure t
  :config
  (progn
    (global-undo-tree-mode t)
    (setq undo-tree-visualizer-timestamps t
          undo-tree-visuzlizer-diff t)))

(use-package projectile
  :diminish projectile-mode
  :ensure t
  :config
  (progn
    (setq projectile-enable-caching t
          projectile-verbose nil)
    (projectile-global-mode t)))

(use-package company
  :diminish company-mode
  :ensure t)

(use-package magit
  :ensure t)

(use-package emmet-mode
  :ensure t
  :defer 2)

(use-package smartparens
  :diminish smartparens-mode
  :ensure t
  :init
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode t)))

(use-package uniquify
  :ensure nil
  :config
  (progn
    (setq uniquify-buffer-name-style 'forward
          uniquify-separator "/"
          uniquify-after-kill-buffer-p t
          uniquify-ignore-buffers-re "^\\*")))

(use-package recentf
  :config
  (progn
    (setq recentf-max-saved-items 500
          recentf-max-menu-items 15
          recentf-auto-cleanup 'never)
    (recentf-mode t)))

(use-package saveplace
  :init (save-place-mode t))

(use-package savehist
  :config
  (progn
    (setq savehist-additional-variables
          '(search-ring regexp-search-ring comint-input-ring)
          savehist-autosave-interval 60)
    (savehist-mode t)))

(use-package dired
  :ensure nil
  :config
  (progn
    (put 'dired-find-alternate-file 'disabled nil)
    (setq dired-recursive-deletes 'always
          dired-recursive-copies 'always
          dired-dwim-target t
          dired-use-ls-dired nil)
    (use-package dired-x
      :ensure nil)))

(use-package anzu
  :diminish anzu-mode
  :ensure t
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp))
  :init
  (global-anzu-mode +1)
  :config
  (progn
    (set-face-attribute 'anzu-mode-line nil
                        :foreground nil :weight 'bold)
    (define-key isearch-mode-map [remap isearch-query-replace]  #'anzu-isearch-query-replace)
    (define-key isearch-mode-map [remap isearch-query-replace-regexp] #'anzu-isearch-query-replace-regexp)))

(use-package avy
  :ensure t
  :config
  (avy-setup-default))

(use-package linum-relative
  :ensure t
  :init
  (add-hook 'find-file-hook 'linum-mode)
  :config
  (progn
    (setq linum-format 'linum-relative
          linum-relative-current-symbol "->")))

(use-package rainbow-delimiters
  :ensure t
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))

(use-package whitespace
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup)
  :config
  (progn
    (setq whitespace-line-column 80
          whitespace-style
          '(face tabs empty trailing lines-tail))))

(use-package aggressive-indent
  :ensure t
  :config
  (progn
    (global-aggressive-indent-mode t)
    (add-to-list 'aggressive-indent-excluded-modes 'html-mode)))

(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)

;;(use-package color-theme
;;  :ensure t
;;  :config
;;  (progn
;;    (use-package color-theme-solarized
;;      :ensure t
;;      :init
;;      (load-theme 'solarized t))))

(use-package which-key
  :ensure t
  :config
  (which-key-mode t))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (smartparens org dash evil helm-projectile projectile magit use-package helm evil-visual-mark-mode ensime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
