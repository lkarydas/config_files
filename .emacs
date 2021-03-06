(require 'color-theme)
(if window-system
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-gnome2))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Disable menu bar
;(menu-bar-mode -1)
;; Disable scrollbar
(toggle-scroll-bar -1)
;; Disable toolbar
(tool-bar-mode -1)

;; Highlight parenthesis mode
(show-paren-mode)

;; In every buffer, the line which contains the cursor will be fully highlighted
(global-hl-line-mode 1)

;; Send primary selection to clipboard so copy-paste works with other X-applications
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

;; Global key mapping
(global-set-key [f1] 'compile)
(global-set-key [f2] 'kill-compilation)
(global-set-key [f3] 'next-error)
(global-set-key [f4] 'previous-error)

;; GLSL highlighting
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; Overwrite selected text
(delete-selection-mode t)

;; Highlight TODO and FIXME in comments
(add-hook 'c-mode-common-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))
