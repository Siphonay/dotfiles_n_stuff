;;; .emacs --- init file
;;; Commentary:
;; append-tuareg.el - Tuareg quick installation: Append this file to .emacs.

;;; Code:
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(column-number-mode 1)
;;(global-linum-mode 1) ; display line numbers in margin. Emacs 23 only.
;;(cua-mode 1)

(transient-mark-mode 1) ; highlight text selection
(delete-selection-mode 1) ; delete seleted text when typing
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
;;(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
;;(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;(dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi"))
;  (add-to-list 'completion-ignored-extensions ext))
(setq column-number-mode t)
;;(setq line-number-mode t)
(setq user-full-name "Alexis Viguié")
(setq user-mail-address "alexis.viguie@epitech.eu")
(load-file "~/.emacs.d/protection.el")
(load-file "~/.emacs.d/std.el")
(load-file "~/.emacs.d/std_comment.el")

(global-set-key [f11] 'std-file-header)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("274675d734fa3ddc154436ff218bc25bbcf1f550300953fa000aa7541f9f64b1" "3f3dd7246553db24d93a98efb2390a8f861a5b58ae67b3c841db90c03648b9ee" "d290818049c66ac8bdbf312605e2dc0cbb246d74d07a3393780706640929720f" "70403e220d6d7100bae7775b3334eddeb340ba9c37f4b39c189c2c29d458543b" "272048f0f124cdc42689a1e46366a8c7c7785664c35353fa62579a049c335608" "f65f265c85bf4c669eae9f47ffde0b5bfb1ecbeedfbb5b62b88ba2dd8ffe32d0" default)))
 '(fci-rule-color "#424748")
 '(fci-rule-column 80)
 '(flycheck-clang-args (quote ("-fPIC")))
 '(flycheck-clang-include-path
   (quote
    ("/usr/include/x86_64-linux-gnu/qt5/QtWidgets" "/usr/include/x86_64-linux-gnu/qt5/QtCore" "/usr/include/x86_64-linux-gnu/qt5" "../include")))
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-tail-colors
   (quote
    (("#424748" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#424748" . 100))))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (company-c-headers company rust-mode flycheck-rust powerline flycheck-clangcheck fill-column-indicator darkokai-theme d-mode auto-complete-c-headers ac-clang 2048-game)))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff0066")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#63de5d")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#53f2dc")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#06d8ff"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq frame-title-format '(emacs-version "emacs: %b"))

(global-linum-mode t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(load-theme 'arcokai t)

(global-flycheck-mode)

(ac-config-default)

(require 'fill-column-indicator)

  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  (global-fci-mode 1)

(add-hook 'after-init-hook 'global-company-mode)

(provide '.emacs)
;;; .emacs ends here
