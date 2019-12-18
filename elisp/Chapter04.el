;; 字符串取值大小 0-524287

;; 读入字符语法 在字符前加上问号
?a
?B

;; 读入标点符号字符时最好加上转义字符'\'
?\a
?\'
?\?
?\\

;; 测试是否为字符串用stringp
(stringp "hello")

;; string-or-null-p函数测试当对象为字符或nil时返回t
(string-or-null-p nil)
(string-or-null-p "c")

;; 想要测试字符串是否为空，可以自己写，原理是空字符串小于任何字符串
(defun string-emptyp (str)
  (not (string< "" str)))

(string-emptyp "not empty") ;; => nil
(string-emptyp "") ;; => t

"可能是因为书太老的缘故，现在emacs26.3版本已经有测试字符串是否为空的函数"
(string-empty-p "") ;; => t
(string-empty-p "not empty") ;; => nil

;; 构造函数

;; 想要产生一个连续相同的字符串可以使用make-string
(make-string 3 ?i) ;; => "iii"

;; 想要产生不同的字符串可以使用string
(string ?I ?\s ?l ?o ?v ?e ?\s ?y ?o ?u) ;; => "I love you"

;; 另外，还可以在已有字符串之上生成新的字符串

;; substring 第二和第三个参数是新字符串的开始起点和结束位置
;; 需要注意的是: 起点不能小于且大于参数1长度;结束位置相同，但结束位置可以省略，默认为参数1的长度。
(substring "I Love You" 2 6) ;; => "Love"

;; concat 简单，是将多个参数拼接起来。
(concat "I" " " "Love" " " "You")

;; 字符串比较

;; 字符之间可以使用char-equal进行比较，但它不区别大小写。是否区别大小写取决于变量case-fold-search，默认为t（不区分大小写）
(char-equal ?a ?A) ;; => t

;; 字符串之间的比较使用string=，它还有个别名----string-equal
(string= "a" "A") ;; => nil

;; 转换函数

;; 字符转字符串
(char-to-string ?I) ;; => "I"

;; 字符串转为字符，只显示字符串的第一个
(string-to-char "I Love You") ;; => 73

;; 数字转换为字符串 只能转换10的数字
(number-to-string 256) ;; => "256"

;; 字符串转换为数字，可以设置进制2~16
(string-to-number "256" 10) ;; => 256

;; 想要将8进制和16进制的数字转换为汉字可以使用format函数

;; 八进制
(format "%#o" 7) ;; => "07"
;; 十六进制
(format "%#x" 15) ;; => "0xf"
;; 二进制
(number-to-bin-string 2) ;; => "10"

;; 有些版本的elisp可能没有这个函数，例如原书中所讲就没有，他是使用了calculator库写的
(defun number-to-bin-string-calculator (number)
  (require 'calculator)
  (let ((calculator-output-radix 'bin)
        (calculator-radix-grouping-mode t))
    (calculator-number-to-string number)))

(number-to-bin-string-calculator 256) ;; => "1'0000'0000"

;; 另外，concat等函数可以将一些高级数据类型与字符串互相转换。

;; concat:将由字符组成的列表或向量转换成字符串;
(concat '(?a ?b ?c ?d ?e)) ;; => "abcde"
(concat [?a ?b ?c ?d ?e]) ;; => "abcde"

;; vconcat:将字符串转换成向量;
(vconcat "aAbB") ;; => 97 65 98 66

;; append:将字符串转换成列表
(append "aAbB" nil) ;; => 97 65 98 66

;; 大小写转换使用downcase和upcase函数，字符也可以
(downcase "Up to Down") ;; => "up to down"
(downcase ?a) ;; => 97

(upcase "down to up") ;; => "DOWN TO UP"
(upcase ?A) ;; => 65

;; 首字母大写，其余小写
(capitalize "my nAme iS eVAn MeEK") ;; => "My Name Is Evan Meek"

;; 首字母大写，其余字母不变
(upcase-initials "mY nAme is evan meek") ;; => "MY NAme Is Evan Meek"



