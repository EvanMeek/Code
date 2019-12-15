;; 定义函数
(defun our-third (x)
  "our-third是函数名 x是函数的参数列表
(car (cdr (cdr x))) 是函数体"
  (car (cdr (cdr x))))

(defun sum-greater (x y z)
  "任意数之和与任意数做比较大小"
  (> (+ x y) z))

(defun our-member (obj lst)
  "判断obj是否为lst列表的一员"
  ;; 判断lst是否为空，如果为空，直接返回nil
  (if (null lst)
      nil
      ;; 取lst的第一元素与obj作相等比较，如果相等则返回lst，否则递归
      (if (eql (car lst) obj)
          lst
          ;; 还是传入obj为第一个参数，第二参数是除了第一个元素之外的元素
          (our-member obj (cdr lst)))))

(our-member 'c '(a b c d))
"
1. lst为(a b c d) obj为 c
2. lst不为空
3. c == a ? 判断是否相等，如果相等返回lst(a b c d)
4. 如果不等，递归(our-merber 'c (cdr lst))
此时的obj为c lst为 (b c d)
然后重复上面的步骤，直到(car lst)为c时返回lst

输出结果为: (C D)
"

(defun askem (str1 str2)
  (format t "~A" str1)
  (read)
  (format t "~A" str2)
  (read))

(let ((x 1) (y 2))
  (+ x y))

(defun ask-number ()
  (format t "Please enter a number:")
  (let((num (read)))
    (if (numberp num)
        num
        (ask-number))))

;; 创建全局变量
(defparameter *global_var* 100)

;; 创建全局常量
(defconstant *global_const* (+ *global_var* 999))

;; 赋值
(let ((x 1))
  (setf x 10000)
  x)

;; 赋值隐式创建全局变量
(setf hide_global_var 10000)




;; 隐式创建全局变量
(progn (setf x (list '(a b c)));
;; setf 将第二个参数插入至第一个参数所引用之处
 (setf (car x) 'n)
 (format t "~A" x))

(defun show-squares (start end)
  (do ((i start (+ i 1)))
      ((> i end) 'DONE)
  (format t "~A ~A ~%" i (* i i))))

(defun show-squares-recurrence (start end)
  (if (> start end)
      'done
      (progn
        (format t "~A ~A~%" start (* start start))
        (show-squares-recurrence (+ start 1) end))))

(defun our-length (lst)
  (let ((len 0))
    (dolist (obj lst)
      (setf len (+ len 1))
      (format t "index:~A   element:~A~%" len obj))
    (format t "lst's len:~A" len)))

(defun our-length-recurrence (lst)
  (if (null lst)
      0
     (+ (our-length-recurrence (cdr lst)) 1)))


;; Chapter02 习题

;; 2. 给出三种不同表示(abc)的cons表达式
(cons 'a '(b c))
(cons 'a (cons 'b '(c)))
(cons 'a (cons 'b (cons 'c nil)))
;; 3. 使用car与cdr，定义一个函数，其返回一个列表的第四个元素
(defun return-four-element (lst)
 (car(cdr(cdr(cdr lst)))))

;; 4.定义一个函数，接收两个参数，返回两者当中较大的那个。
(defun compare-size (num1 num2)
  (if (> num1 num2) num1 num2))

;; 5.这些函数做了什么?
"
A======
(defun enigma (x)
  (and (not (null x))
       (or (null (car x))
           (enigma (cdr x)))))

答:取反enigma
"
"
B======
(defun mystery (x y)
  (if (null y)
      nil
      (if (eql (car y) x)
          0
          (let ((z (mystery x (cdr y))))
            (and z (+ z 1))))))

答:我不会
"

;; 6. 下列表达式，x是? 会得到相同的结果吗?
"
> (car (x (cdr '(a (b c) d))))
B
> (x 13 (/ 1 0))
13
> (x #' list 1 nil)
(1)

答:
"

;; 7.只使用本章所介绍的操作符，定义一个函数，它接受一个列表作为实参，如果
;; 有一个元素是列表时，就返回真。
(defun is-list (lst)
  (if lst
      (or (listp (car lst))
          (is-lisp (cdr lst)))))
;; 8.给出函数的迭代与递归版本：
;; 8.1 接受一个正整数，并打印出数字数量的点。
;; 迭代
(defun print-number-point-iteration (num)
  ;; 变量1 变量初值1 步长列表
  (do ((i 0 (+ i 1)))
  ;; 结束条件
      ((= i num))
  ;; 循环体
    (format t "." )))
;; 递归
(defun print-number-point-recurrence (num)
  ;; 判断是否为数字
  (if (plusp num)
      ;; 复合语句
      (progn
        ;; 打印
        (format t ".")
        ;; 计数
        (print-number-point-recurrence (- num 1)))))
;; 8.2 接受一个列表，并返回 a 在列表里所出现的次数。
;; 迭代
(defun return-a-count-iteration (lst)
  (do ((count 0 ((cdr lst))
                 (n 0 (+ n (if (eq (car count) 'A) 1 0))))
              ((not count) n))))
(defun return-a-count-recurrence (lst)
  ;; 判断lst是否为空列表
  (if lst
      ;; 返回a的数量
      (+
       ;; 如果lst第一个元素为'A那么返回1，否则返回0
       (if (eq (car lst) 'A) 1 0)
       ;; 排除第一个元素，递归操作
       (return-a-count-recurrence (cdr lst)))
      ;; 如果是空列表直接返回数量为0
      0))
"
 9. 一位朋友想写一个函数，返回列表里所有非 nil 元素的和。他写了此函数的两
    个版本，但两个都不能工作。请解释每一个的错误在哪里，并给出正确的版本
    。

(a) (defun summit (lst)
      (remove nil lst)
      (apply #'+ lst))

(b) (defun summit (lst)
      (let ((x (car lst)))
        (if (null x)
            (summit (cdr lst))
            (+ x (summit (cdr lst))))))
"

;; A
"
问题出在(remove nil lst)上，因为remove函数只是将lst的副本中的nil删除了
并没有真正的将 lst中的nil删除，所以在(apply #' + lst)将lst元素的元素相加就会报错。

解决方案:
"
(defun summit (lst)
  (apply #'+ (remove nil lst)))

;; B
"
问题出在: 没有结束递归的操作。

解决方案:
"
(defun summit-recurrence (lst)
  (if lst
      (+ (or (car lst) 0) (summit-recurrence (cdr lst)))
      0))
