;;; green-on-black-theme.el --- Green on black -*- lexical-binding: t; -*-

(deftheme green-on-black "Green on black, matching Sway.")

(let ((bg     "#0c100c")
      (bg-alt "#141a14")
      (bg-hl  "#1f2b1f")
      (fg     "#8fc98f")
      (fg-mid "#6fa86f")
      (fg-dim "#4a6b4a")
      (bright "#c8f0c8")   ; bold
      (teal   "#86c9b7")   ; italic
      (red    "#c86464")
      (yellow "#b8c77a"))
  (custom-theme-set-faces
   'green-on-black
   ;; Base
   `(default ((t (:background ,bg :foreground ,fg))))
   `(cursor ((t (:background ,fg))))
   `(fringe ((t (:background ,bg :foreground ,fg-dim))))
   `(region ((t (:background ,bg-hl :extend t))))
   `(highlight ((t (:background ,bg-hl))))
   `(hl-line ((t (:background ,bg-alt :extend t))))
   `(vertical-border ((t (:foreground ,fg-dim))))
   `(minibuffer-prompt ((t (:foreground ,fg :weight bold))))
   `(link ((t (:foreground ,fg :underline t))))
   `(shadow ((t (:foreground ,fg-dim))))
   `(error ((t (:foreground ,red :weight bold))))
   `(warning ((t (:foreground ,yellow))))
   `(success ((t (:foreground ,fg))))
   ;; Emphasis (Org *bold*, /italic/, _underline_)
   `(bold ((t (:foreground ,bright :weight bold))))
   `(italic ((t (:foreground ,teal :slant italic))))
   `(bold-italic ((t (:foreground ,bright :weight bold :slant italic))))
   `(underline ((t (:foreground ,bright :underline t))))
   ;; Line numbers
   `(line-number ((t (:background ,bg :foreground ,fg-dim))))
   `(line-number-current-line ((t (:background ,bg-alt :foreground ,fg :weight bold))))
   ;; Mode line
   `(mode-line ((t (:background ,bg-alt :foreground ,fg :box (:line-width 1 :color ,fg-dim)))))
   `(mode-line-inactive ((t (:background ,bg :foreground ,fg-dim :box (:line-width 1 :color ,bg-alt)))))
   ;; Search / parens
   `(isearch ((t (:background ,fg :foreground ,bg :weight bold))))
   `(lazy-highlight ((t (:background ,bg-hl :foreground ,fg))))
   `(show-paren-match ((t (:background ,bg-hl :foreground ,fg :weight bold))))
   `(show-paren-mismatch ((t (:background ,red :foreground ,bg))))
   ;; Syntax
   `(font-lock-keyword-face ((t (:foreground ,fg :weight bold))))
   `(font-lock-builtin-face ((t (:foreground ,fg))))
   `(font-lock-function-name-face ((t (:foreground ,fg))))
   `(font-lock-variable-name-face ((t (:foreground ,fg-mid))))
   `(font-lock-type-face ((t (:foreground ,fg :slant italic))))
   `(font-lock-constant-face ((t (:foreground ,yellow))))
   `(font-lock-string-face ((t (:foreground ,fg-mid))))
   `(font-lock-comment-face ((t (:foreground ,fg-dim :slant italic))))
   `(font-lock-doc-face ((t (:foreground ,fg-dim))))
   `(font-lock-warning-face ((t (:foreground ,red))))
   ;; Completion (vertico)
   `(vertico-current ((t (:background ,bg-hl :foreground ,fg :weight bold :extend t))))
   `(completions-common-part ((t (:foreground ,fg :weight bold))))
   ;; Org
   `(org-level-1 ((t (:foreground ,fg :weight bold :height 1.2))))
   `(org-level-2 ((t (:foreground ,fg-mid :weight bold))))
   `(org-level-3 ((t (:foreground ,fg-mid))))
   `(org-block ((t (:background ,bg))))
   `(org-code ((t (:foreground ,yellow))))
   ;; Org tables
   `(org-table ((t (:foreground ,fg))))
   `(org-table-header ((t (:foreground ,bright :weight bold))))))

(provide-theme 'green-on-black)

;;; green-on-black-theme.el ends here
