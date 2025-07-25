;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Michael Leibbrandt"
      user-mail-address "mike.leibbrandt@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 16 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 17))

(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dark+)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/dev/sarah")
(setq org-work-directory "~/Dev/srx")


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq fancy-splash-image "~/.config/doom/emacs-dashboard.png")

(setq org-roam-personal-directory "~/Dev/sarah")
(setq org-roam-work-directory "~/Dev/srx")

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t)
  )

(map! :leader
      (:prefix "o"
       :desc "Toggle vterm" "e" #'+vterm/toggle))

(map! :leader
      (:prefix "o"
               "t" nil))  ;; unbind SPC o t

(use-package! lsp-ui
  :init
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse t
        lsp-ui-doc-position 'at-point)) ;; or 'top if you want it floating

;; Ensure .tsx uses the correct mode
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-tsx-mode))

;; Enable LSP and LSP UI in TSX files
(add-hook 'typescript-tsx-mode-hook #'lsp!)
(add-hook 'lsp-mode-hook #'lsp-ui-mode)

;; Optional: Tweak lsp-ui display
(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-position 'at-point
        lsp-ui-sideline-enable t))

(map!
 ;; Super + Tab
 ("<s-tab>" #'+tabs:next-or-goto)

 ;; Ctrl + Shift + Tab (comes through as C-<iso-lefttab>)
 ("<C-iso-lefttab>" #'+tabs:previous-or-goto))

(map! :leader
      :desc "LSP Peek References"
      "g D" #'lsp-ui-peek-find-references)

(setq lsp-ui-peek-list-width 50
      lsp-ui-peek-peek-height 20)

(after! evil
  (define-key evil-normal-state-map (kbd "g D") #'lsp-ui-peek-find-references))

(setq lsp-ui-peek-list-width 90
      lsp-ui-peek-peek-height 40
      lsp-ui-peek-peek-width 100)


(defun my/org-roam-switch-to-personal ()
  "Switch to personal Org-roam directory."
  (interactive)
  (setq org-roam-directory org-roam-personal-directory)
  (org-roam-db-sync)
  (message "Switched to sarah Org-roam directory."))

(defun my/org-roam-switch-to-work ()
  "Switch to work Org-roam directory."
  (interactive)
  (setq org-roam-directory org-roam-work-directory)
  (org-roam-db-sync)
  (message "Switched to srx Org-roam directory."))

;; Optional: Create keybindings under SPC n r (org-roam prefix)
(map! :leader
      :prefix "n r"
      :desc "Switch to sarah" "p" #'my/org-roam-switch-to-personal
      :desc "Switch to srx"     "w" #'my/org-roam-switch-to-work)
