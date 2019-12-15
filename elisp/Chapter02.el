;; 定义变量 let
(defun circle-area (radix)
  (let ((pi 3.1415926)
        area)
    (setq area (* pi radix radix))
    (message "直径为%.2f 的圆面积是 %.2f" radix area)))

(defun circle-area2 (radix)
  (let* ((pi 3.1415926)
         (area (* pi radix radix)))
    (message "直径为%.2f 的圆面积是 %.2f" radix area)))
(circle-area2 3)
;; funcall 调用 "匿名函数" lambda
(funcall (lambda (stu_name)
           (message "My name is %s!" stu_name)) "EvanMeek")

(setq foo (lambda (fun_name)
           (message "My function name is %s!" fun_name)))
(funcall foo "foo")
;; 顺序执行多条S表达式
(defun test ()
  (setq foo 3)
  (defun test2 ())
  (message "%d 的平方是 %d" foo (* foo foo)))
(progn
  (setq foo 3)
  (message "%d 的平方是 %d" foo (* foo foo)))
;; if 选择结构 条件表达式
(defun my-max (a b)
  (if (> a b)
      a b))
(my-max 10 20)
;; cond 选择结构 条件表达式 类switch
(defun fib (n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (t (+ (fib (- n 1)) (fib (- n 2))))))
(fib 3)
;; while循环
(defun factorial (n)
  (let ((res 1))
    (while (> n 1)
      (setq res (* res n)
            n (- n 1)))
    res))
(factorial 10)
;; 逻辑运算

;; or "或"

(defun hello-world (&optional name)
  (or name (setq name "Emacser"))
  (message "Hello, %s!" name))

(hello-world)
(hello-world "EvanMeek")

;; and "与"

(defun square-number-p (n)
  (and (>= n 0)
       nil
       (= (/ n (sqrt n) (sqrt n)))))

(square-number-p -2)
(square-number-p 25)

;; 上面所学函数列表

"
(defun NAME ARGLIST [DOCSTRING] BODY...) (defvar SYMBOL &optional INITVALUE DOCSTRING) (setq SYM VAL SYM VAL ...)
(let VARLIST BODY...)
(let* VARLIST BODY...)
(lambda ARGS [DOCSTRING] [INTERACTIVE] BODY) (progn BODY ...)
(if COND THEN ELSE...)
(cond CLAUSES...)
(when COND BODY ...)
(unless COND BODY ...)
(when COND BODY ...)
(or CONDITIONS ...)
(and CONDITIONS ...)
(not OBJECT)
"
