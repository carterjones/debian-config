;; Disable backup files.
(setq-default make-backup-files nil)

;; Use spaces instead of tabs.
(setq-default indent-tabs-mode nil)

;; Set the fill column (for wrapping).
(setq-default fill-column 80)

;; Show the current column.
(setq-default column-number-mode t)

;; Hide menu bar and toolbar.
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)))
(menu-bar-mode -1)

;; Uncomment this line to disable scrollbars.
;(scroll-bar-mode -1)))

;; Cursor settings.
(bar-cursor-mode 1)

;; Make selection get replaced on insert.
(delete-selection-mode 1)

;; Set the default browser to Chrome.
(if (eq system-type 'darwin)
    (setq browse-url-generic-program "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
          browse-url-browser-function 'browse-url-generic)
  (setq browse-url-browser-function 'browse-url-chrome))

;; Load changes from disk into buffer if changes are made outside of Emacs.
(global-auto-revert-mode t)

;; Disable warnings for various settings.
(put 'narrow-to-region 'disabled nil)

;; Disable dired mode on Mac OS.
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; Set search path.
(setq exec-path (append exec-path '("/usr/local/bin")))
(add-to-list 'exec-path (concat (getenv "HOME") "/bin"))

;; Set the mouse pointer shape in non-text contexts.
(setq void-text-area-pointer 'text)

;; Enable tracking recent files.
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Enable pixel scroll mode.
(pixel-scroll-mode 1)