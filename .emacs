;;(require 'package)
;;(add-to-list 'package-archives
;;             '("marmalade" . "http://marmalade-repo.org/packages/"))
;;
;;(package-initialize) 
(setq org-src-fontify-natively t)
(setq org-export-html-postamble nil)
;开启org模式下按C-c C-c 执行src中的代码
(org-babel-do-load-languages
   'org-babel-load-languages
    '((dot . t)
      (gnuplot .t)
      (python .t)
      )
    )
(add-to-list 'org-structure-template-alist '("C" "#+begin_comment\n?\n#+end_comment"))

(set-background-color "black") ;; 使用黑色背景
(set-foreground-color "white") ;; 使用白色前景

;(set-face-foreground 'region "green")  ;; 区域前景颜色设为绿色
;(set-face-background 'region "blue") ;; 区域背景色设为蓝色
;(set-face-background 'region "black") ;; 区域背景色设为蓝色

;;(custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; )
;;(custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant oblique :weight normal :height 113 :width normal :foundry "unknown" :family "TlwgTypewriter")))))

;; author: chinazhangjie
;; e-mail: chinajiezhang@gmail.com

;; 指针颜色设置为白色
(set-cursor-color "white")
;; 鼠标颜色设置为白色
(set-mouse-color "white")



;; 一打开就起用 text 模式。 
(setq default-major-mode 'text-mode)

;; 语法高亮
(global-font-lock-mode t)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p) 

;; 显示括号匹配 
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 显示时间，格式如下
(display-time-mode 1) 
(setq display-time-24hr-format t) 
(setq display-time-day-and-date t) 

(transient-mark-mode t) 

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t) 

;; 在标题栏提示你目前在什么位置
(setq frame-title-format "emacs-jimila") 

;; 默认显示 80列就换行 
(setq default-fill-column 80) 

;; 去掉工具栏
(tool-bar-mode nil)

;;去掉菜单栏
;(menu-bar-mode nil)

;; 去掉滚动栏
(scroll-bar-mode nil)

;;鼠标滚轮，把默认滚动改为3行 
(defun up-slightly () (interactive) (scroll-up 3)) 
(defun down-slightly () (interactive) (scroll-down 3)) 
(global-set-key [mouse-4] 'down-slightly) 
(global-set-key [mouse-5] 'up-slightly)

;; 设置字体
;; 方法为: emacs->options->Set Default Font->"M-x describe-font"查看当前使用的字体名称、字体大小
(set-default-font " -bitstream-Courier 10 Pitch-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

;; 显示列号
(setq column-number-mode t)
(setq line-number-mode t)

;; 设置默认tab宽度为2
(setq tab-width 2
indent-tabs-mode t
c-basic-offset 2)

;; 回车缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)

;; 实现全屏效果，快捷键为f11
(global-set-key [f11] 'my-fullscreen) 
(defun my-fullscreen ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_FULLSCREEN" 0))
)
;; 最大化
(defun my-maximized ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)
;; 启动emacs时窗口最大化
(my-maximized)

;; 启动窗口大小
(setq default-frame-alist
'((height . 35) (width . 125) (menu-bar-lines . 20) (tool-bar-lines . 0)))


;;显示行号
(require 'linum)      
(global-linum-mode nil)


;;yes no用y n代替      
(fset 'yes-or-no-p 'y-or-n-p)      
;;不要生成临时文件      
(setq-default make-backup-files nil)

;;括号匹配
;;
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
    (with-current-buffer
            (url-retrieve-synchronously
	             "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
	        (let (el-get-master-branch)
		        (goto-char (point-max))
			      (eval-print-last-sexp))))

(el-get 'sync)

(require 'erlang-start)
(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

;; 默认字体很小，可以在.emacs中添加如下脚本：
;;CTRL+鼠标滚轮即可以缩小或放到字体。
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)


;打开图片显示功能 
;直接用emacs打开图片文件
(auto-image-file-mode t)

; iimage mode
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)

;(defun do-org-show-all-inline-images ()
;  (interactive)
;  (org-display-inline-images t t))
;(global-set-key (kbd "C-c C-x C-v")
;                'do-org-show-all-inline-images)


;(defun org-toggle-iimage-in-org ()
;  "display images in your org file"
;  (interactive)
;  (if (face-underline-p 'org-link)
;      (set-face-underline-p 'org-link nil)
;      (set-face-underline-p 'org-link t))
;  (iimage-mode 'toggle))
;(add-hook 'wiki-mode-hook 'iimage-mode)
(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
      (set-face-underline-p 'org-link t))
  (iimage-mode))

;支持中键粘贴 
(setq mouse-yank-at-point t)


;;auto-complete
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/el-get/pos-tip")
(add-to-list 'load-path "~/.emacs.d/el-get/fuzzy/fuzzy-el")
(add-to-list 'load-path "~/.emacs.d/el-get/popup/popup-el")
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")

(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)

(let ((distel-dir "~/.emacs.d/el-get/distel/elisp"))
    (unless (member distel-dir load-path)
        ;; Add distel-dir to the end of load-path
        (setq load-path (append load-path (list distel-dir)))))

(require 'distel)
(distel-setup)

(setq ac-dwim t)
(setq ac-fuzzy-enable t)

(add-hook 'erlang-mode-hook
  (lambda ()
 
  ;; when starting an Erlang shell in Emacs, default in the node name
 
    (setq inferior-erlang-machine-options '("-sname" "emacs"))
     
    ;; add Erlang functions to an imenu menu
 
    (imenu-add-to-menubar "imenu")))
 
;; prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)
 
;; tell distel to default to that node
(setq erl-nodename-cache
      (make-symbol
       (concat
        "emacs@"
        ;; Mac OS X uses "name.local" instead of "name", this should work
        ;; pretty much anywhere without having to muck with NetInfo
        ;; ... but I only tested it on Mac OS X.
        (car (split-string (shell-command-to-string "hostname"))))))
 
;;跳转要开启node
;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")
 
(add-hook 'erlang-shell-mode-hook
  (lambda ()
;; add some Distel bindings to the Erlang shell
        (dolist (spec distel-shell-keys)
        (define-key erlang-shell-mode-map (car spec) (cadr spec)))))




;;-------------------------------全选--------------------- 
 
 
(defun select-all () 
  "Select the whole buffer." 
  (interactive) 
  (goto-char (point-min)) 
  ;; Mark current position and push it into the mark ring. 
  (push-mark-command nil nil) 
  (goto-char (point-max)) 
  (message "ok.")) 
 
(provide 'select-all) 
 
(autoload 'select-all "select-all" 
  "Select the whole buffer." t nil) 
 
;; user defined keys 
 
(global-set-key "\C-x\C-a" 'select-all) 

;;-------------------glass style------------------ 
;
;(global-set-key [(f12)] 'loop-alpha)
 
;;;(setq alpha-list '((85 55) (100 100)))   
;;;  
;;;(defun loop-alpha ()   
;;;  (interactive)   
;;;  (let ((h (car alpha-list)))                   
;;;    ((lambda (a ab)   
;;;       (set-frame-parameter (selected-frame) 'alpha (list a ab))   
;;;       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))   
;;;       ) (car h) (car (cdr h)))   
;;;    (setq alpha-list (cdr (append alpha-list (list h))))   
;;;    ))
;;;

(require 'color-theme)
(color-theme-gnome2)

;(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))


;;(defun my-erlang-mode-hook ()
;;  (local-set-key "\M-."  'erl-find-source-under-point )
;;  (local-set-key "\M-,"  'erl-find-source-unwind))
;;(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)


;;---------------------YASnippet--------------------
 
;; tabbar
;;(add-to-list 'load-path "~/.emacs.d/tabbar")
(require 'tabbar)
(tabbar-mode t)
(global-set-key [(meta j)] 'tabbar-backward)
(global-set-key [(meta k)] 'tabbar-forward)


(server-start)

(require 'ido)
(ido-mode t)


(add-to-list 'load-path "~/.emacs.d/el-get/emacs-w3m")
(require 'w3m-load)
(setq w3m-home-page "http://www.google.com.hk")
;(setq w3m-default-display-inline-images t)
;(setq w3m-default-toggle-inline-images t)

;;快捷键
;;F4,kill键，习惯设置，关闭当前buffer
(global-set-key [f4] 'kill-this-buffer)

;;定义F7键为激活ecb
(global-set-key [f7] 'ecb-activate) 
(global-set-key [C-f7] 'ecb-deactivate)

;;设置F11为删除其它窗口
(global-set-key [f11] 'delete-other-windows)

(global-set-key (kbd "C-c z") (quote shell))


;;;; 各窗口间切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)


;;--------------------- tabbar----------

;(set-face-attribute 'tabbar-button-face
;nil :inherit 'tabbar-default-face
;:box '(:line-width 1 :color "gray30")
;)
;
;(set-face-attribute 'tabbar-default-face
;nil :family "Courier"
;:background "gray80" :foreground
;"gray30" :height 1.1)
;
;(set-face-attribute 'tabbar-selected-face
;nil :inherit 'tabbar-default-face
;:foreground "DarkGreen"
;:background "LightGoldenrod"
;:box '(:line-width 2 :color "DarkGoldenrod")
;;;:overline "black" :underline "black"
;:weight 'bold)
;
;(set-face-attribute 'tabbar-unselected-face
;nil :inherit 'tabbar-default-face
;:box '(:line-width 2 :color "gray70"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(show-paren-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 128 :width normal)))))

;;;; 自动启动ecb，并且不显示每日提示
;(setq ecb-auto-activate t
;      ecb-tip-of-the-day nil)

(setq ecb-tip-of-the-day nil)


;;;; 使某一ecb窗口最大化
(define-key global-map "\C-c1" 'ecb-maximize-window-directories)
(define-key global-map "\C-c2" 'ecb-maximize-window-sources)
(define-key global-map "\C-c3" 'ecb-maximize-window-methods)
(define-key global-map "\C-c4" 'ecb-maximize-window-history)


;;;; 恢复原始窗口布局
(define-key global-map "\C-c`" 'ecb-restore-default-window-sizes)


(add-to-list 'load-path "~/.emacs.d/el-get/yasnippet")
;(require 'yasnippet-bundle)
(require 'yasnippet)
;(setq yas-snippet-dirs "~/.emacs.d/el-get/yasnippet/")
(setq yas-snippet-dirs "~/.emacs.d/el-get/yasnippet/snippets")
(yas/load-directory "~/.emacs.d/el-get/yasnippet/snippets")
(yas/global-mode 1)
(yas/minor-mode-on)


;;禁用启动信息
(setq inhibit-startup-message t)

;;设置tab为4个空格的宽度
(setq default-tab-width 4)

;;设定删除保存记录为200，可以方便以后无限恢复
(setq kill-ring-max 200)


(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)  
(setq speedbar-use-images nil)  
(setq sr-speedbar-width 30)  
(setq sr-speedbar-right-side nil)

(require 'window-numbering)
(window-numbering-mode 1)
(winner-mode 1)
(global-set-key (kbd "C-x 4 u") 'winner-undo)
(global-set-key (kbd "C-x 4 r") 'winner-redo)

(require 'smex) ; Not needed if you use package.el
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;(global-set-key [(meta x)] (lambda ()
;;                             (interactive)
;;                             (or (boundp 'smex-cache)
;;                                 (smex-initialize))
;;                             (global-set-key [(meta x)] 'smex)
;;                             (smex)))
;;
;;(global-set-key [(shift meta x)] (lambda ()
;;                                   (interactive)
;;                                   (or (boundp 'smex-cache)
;;                                       (smex-initialize))
;;                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
;;                                   (smex-major-mode-commands)))
;;

;;;;可能还会用到
;;;(require 'sdcv)
;;;(global-set-key (kbd "C-c d") 'sdcv-search-pointer)
;;;
;;;(desktop-save-mode 1)
;;;;保存 session 和 desktop . 每次关闭 emacs 后, 在打开 emacs 时,恢复很多很多东西, 就像你没有关闭 emacs 一样
;;;(require 'session) 
;;;(add-hook 'after-init-hook 'session-initialize)
;;;(load "desktop")
;;;(desktop-load-default)
;;;(desktop-read)


;(create-fontset-from-fontset-spec
;"-*-courier-medium-R-normal--17-*-*-*-*-*-fontset-mymono,
;chinese-gb2312:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-gbk:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-gb18030:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;sjis:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-big5-1:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-big5-2:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-cns11643-1:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-cns11643-2:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-cns11643-3:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-cns11643-4:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-cns11643-5:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-cns11643-6:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-cns11643-7:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;chinese-sisheng:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;korean-ksc5601:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;japanese-jisx0213-1:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;japanese-jisx0213-2:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;japanese-jisx0212:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;japanese-jisx0208-1978:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1,
;japanese-jisx0208:-*-wenquanyi bitmap song-medium-*-normal--16-*-*-*-*-*-iso10646-1"
;)
;(setq default-frame-alist (append '((font . "fontset-mymono")) default-frame-alist))
;(set-default-font "fontset-mymono")

;可能还会用到
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'goto-last-change)
(global-set-key (kbd "C-x C-/") 'goto-last-change)





;;(setq tabbar-buffer-groups-function
;;    (lambda (b) (list "All Buffers")))
;;(setq tabbar-buffer-list-function
;;    (lambda ()
;;        (remove-if
;;          (lambda(buffer)
;;             (find (aref (buffer-name buffer) 0) " *"))
;;          (buffer-list))))

;; 设置tabbar外观  
;; 设置默认主题: 字体, 背景和前景颜色，大小  
(set-face-attribute 'tabbar-default nil  
                    ;:family "DejaVu Sans Mono"  
                   :background "gray80"  
                   :foreground "gray30"  
                   :height 1.0  
                    )  
;; 设置左边按钮外观：外框框边大小和颜色  
(set-face-attribute 'tabbar-button nil  
                    :inherit 'tabbar-default  
                    :box '(:line-width 1 :color "yellow70")  
                    )  
;; 设置当前tab外观：颜色，字体，外框大小和颜色  
(set-face-attribute 'tabbar-selected nil  
                    :inherit 'tabbar-default  
                    :foreground "DarkGreen"  
                    :background "LightGoldenrod"  
                   :box '(:line-width 2 :color "DarkGoldenrod")  
                    :overline "black"  
                    :underline "black"  
                    :weight 'bold  
                   )  
;; 设置非当前tab外观：外框大小和颜色  
(set-face-attribute 'tabbar-unselected nil  
                    :inherit 'tabbar-default  
                   :box '(:line-width 2 :color "#00B2BF")  
                   ) 


;;(global-set-key "%" 'match-paren)
;;(defun match-paren (arg)
;;"Go to the matching paren if on a paren; otherwise insert %."
;;(interactive "p")
;;(cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;;((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;;(t (self-insert-command (or arg 1)))))
