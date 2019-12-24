(car '(+ 1 (+ 2 3)))
fill-column
(+ 2 2)

(concat "My name is:" "EvanMeek")
(concat "Nice to meet " (substring "fuck you" 5 8))
(message "Should you sleep now?")
(message "The name of this buffer is: %s" (buffer-name))
(message "The value of fill-column is %d" fill-column)
(message "我想吃%s，各来%d斤!" (concat "苹果、" "梨子、" "葡萄") (+ 1 1))

(set 'flowers (rose violet daisy buttercup))
flowers
'flowers
(setq flowers '(菊花 百合 玫瑰))

(setq 学生 '(学号 地址 姓名 电话)
      老师 '(教师号 地址 姓名 电话))

(setq count 0) ;; 初始器
(setq count (+ 2 count)) ;; 递增器
count ;;输出

一个不存在的变量

(又一个不存在的符号)

(message "这段消息是要输出至%s%s的" '回显 "区")

;; 当前buffer的名称
(buffer-name)
;; 当前buffer所对应文件的完整路径
(buffer-file-name)
;; 最近最常打开过的buffer对象
(other-buffer)
;; 最近最常打开过的buffer对象的名称
(buffer-name (other-buffer))
;; 最近最常打开过的buffer对象所对应文件的完整路径
(buffer-file-name (other-buffer))
;; 获取当前buffer对象
(current-buffer)
;; 在表达式之后键入键序列C-u C-x C-e可以将返回值打印至当前buffer的当前光标前。
(buffer-name)"test.el"
;; 根据最近最常打开过的buffer对象切换buffer
(switch-to-buffer (other-buffer))
;; 根据最近最常打开过的buffer对象的名称切换buffer
(switch-to-buffer (buffer-name (other-buffer)))
;; 根据最近最常打开过的buffer对象所对应文件的完整路径切换buffer
(switch-to-buffer (buffer-file-name (other-buffer)))
;; 获取当前buffer的字符数(包括空格)
(buffer-size)
;; 获取当前光标在当前buffer的位点。
(point)
;; 获取当前光标中位点的最小可能值。默认是1,除非设置了变窄,毕竟默认是从第一个字符开始
(point-min)
;; 获取当前光标中位点的最大可能值。默认是最后一个字符的point,除非设置了增宽。
(point-max)

