"
cons cell 是两个顺序的元素,第一个叫做CAR第二叫做CDR

CAR和CDR的历史由来是最初在IBM 704机器上，有一种取址模式，其中存储地址分为地址部分和减量部分，CAR就是取地址部分(Contents of Address party of Register)，CDR则是取出地址的减量部分(Contents of the Decrement part of Register)。而cons cell为construction of cells。
"

;; cons cell的读入语法
'(1 . 2)    ;; => (1 . 2)
'(?a . 1)   ;; => (97 . 1)
'(1 . "a")  ;; =>  (1 . "a")
'(1 . nil)  ;; => (1)
'(nil . nil) ;; => (nil)
"
可以看到前面的每一个表达式前都加上了单引号，首先我们C-x C-e所调用的函数是eval-last-sexp，那么这个函数的作用是: 首先读入前一个S-表达式，然后对读入的S-表达式求值，并且会将第一个元素作为函数调用。可是这里第一个元素并不是函数，那么为什么不会出错(如果出错会出现 invalid-function)呢?因为它们是一类特殊的S-表达式，称为自求值表达式(求值前后不变)。而单引号'是一个特殊函数quote的别名，它的作用就是让它的参数返回但是不求值。
"

;; 可以使用read函数验证，cons cell的读入语法就是其输出形式。
(read "(1 . 2)")

;; 上面众多列表中有一个特殊的元素: nil 它被称为空表。 空表不是一个cons cell，因为空表内不包含任何内容，所以也就没有CAR 和 CDR之说。


;; 我们可以对列表最后的cons cell的CDR部分进行类型划分，可以分为三类，分别是

;; 真列表(true list)----为nil时
'(1 2 3)

;; 点列表(dotted list)---既不为nil也不是cons cell
'(1 2 . 3)

;; 环形列表(circular list)-它指向列表中之前的一个cons cell
'(1 . #1=(2 3 . #1#))

;; Tips: 上面三种列表只有环形列表的输出形式与输入语法不同。


;; 测试函数

;; 可以使用consp函数测试一个对象是否为cons cell
(consp '(1 2 . 3)) ;; => t
(consp '(1 2 . (3 . nil))) ;; => t
(consp '()) ;; => nil
(consp '(nil)) ;; => t
(consp nil) ;; => nil

;; 可以使用listp函数测试一个对象是否为列表
(listp '(1 2 . 3)) ;; => t
(listp '(1 2 3)) ;; => t
(listp '()) ;; => t
(listp '(1 . (2 . nil))) ;; => t

;; 构造函数

;; 可以使用cons函数产生一个cons cell
(cons 1 2) ;; => (1 . 2)
(cons 1 '(2 3)) ;; => (1 2 3)

;; 也可以使用cons在列表前添加元素
(setq foo '(a b)) ;; => (a b)
(cons 'car foo) ;; => (car a b)

;; 但实际上foo的值并没有发生改变，我们可以使用宏:push在添加元素的同时改变列表值。
foo ;; => (a b)
(push 'car foo) ;; => (car a b)
foo ;; => (car a b)

;; 想要生成一个列表可以使用函数list
(list 1 2 3 (list 4 5 6)) ;; => (1 2 3 (4 5 6))

;; 在这里可以引发一个问题,quote函数生成的列表和cons以及list生成的列表有何不同?

;; quote生成的列表是直接返回，不进行求值的，而cons和list是会求值的，看例子。
'(1 (+ 1 1) 3) ;; => (1 (+ 1 1) 3)
(list 1 (+ 1 1) 3) ;; => (1 2 3)

;; 把列表当数组使用

;; 获取列表的第n个CDR

(defun nthcdr (n lst)
  (if (or (null lst) (= n 0))
      (car lst)
    (nthcdr (1- n) (cdr lst))))
(nthcdr 3 (list 1 2 3 (list 4 5 6)))

