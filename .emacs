(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; For making emacs transparent
;; (set-frame-parameter (selected-frame) 'alpha '(85 . 50))
;; (add-to-list 'default-frame-alist '(alpha . (85 . 50)))

;; (define-globalized-minor-mode global-hs-minor-mode
;;  hs-minor-mode hs-minor-mode)

;; Solarized theme stuff
;; (setq solarized-distinct-fringe-background t)

;; Emacs Hide Show Mode Enabled by default
(add-hook 'python-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C-u") 'comment-or-uncomment-region)
(global-set-key (kbd "C-M-h") 'hs-hide-all)
(global-set-key (kbd "C-h") 'hs-toggle-hiding)
(global-set-key (kbd "C-h") 'hs-toggle-hiding)
(global-set-key (kbd "C-o") 'comment-line)

;; Adjust font size
(set-face-attribute 'default nil :height 150)

;; (global-hs-minor-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("b264fb24d37564511ca04b2fdcc2478fd414aef96b30489af6bb5c320669b093" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages (quote (nova-theme solarized-theme)))
 '(solarized-distinct-fringe-background t t)
 '(solarized-emphasize-indicators t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (load-theme 'nova t)
;; (nova-set-faces
;;   (some-face :foreground cyan)
;;   (some-other-face :background blue :inherit 'unspecified))

;; MELPA stuff
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
