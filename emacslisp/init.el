(add-to-list 'load-path "/home/itohdak/.emacs.d/emacs-trr/")
;; (setq TRR:japanese t)
(require 'trr)

(global-set-key "\C-h" 'delete-backward-char)


(add-to-list 'auto-mode-alist '("\\.launch\\'" . nxml-mode))

;; (require 'mozc)
;; (set-language-environment "Japanese")
;; (setq default-input-method "japanese-mozc")
;; (prefer-coding-system 'utf-8)

;; ignore start message
;; (setq inhibit-startup-message t)

;; タブと行末スペースと全角スペースに色付け
(progn
  (require 'whitespace)
  (setq whitespace-style
        '(
          face ; faceで可視化
          trailing ; 行末
          tabs ; タブ
          spaces ; スペース
          space-mark ; 表示のマッピング
          tab-mark
          ))
  (setq whitespace-display-mappings
        '(
          (space-mark ?\u3000 [?\u2423])
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])
          ))
  (setq whitespace-trailing-regexp  "\\([ \u00A0]+\\)$")
  (setq whitespace-space-regexp "\\(\u3000+\\)")
  (set-face-attribute 'whitespace-trailing nil
                      :foreground "SkyBlue"
                      :background "SkyBlue"
                      :underline nil)
  (set-face-attribute 'whitespace-tab nil
                      :foreground "yellow"
                      :background "yellow"
                      :underline nil)
  (set-face-attribute 'whitespace-space nil
                      :foreground "gray60"
                      :background "gray60"
                      :underline nil)
  (global-whitespace-mode t)
  )

;; launchファイルを開いた時に自動でxml-modeにする
(setq auto-mode-alist
      (append '(
                ("\\.launch\\'" . xml-mode)
                )
              auto-mode-alist))
