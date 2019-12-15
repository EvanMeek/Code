(efun our-equal (x y)
  (or (eql x y)
      (and (consp x)
           (consp y)
           (our-equal (car x) (car y)) (our-equal (cdr x) (cdr y)))))

(defun our-copy-list (lst)
  (if (atom lst)
      lst
      (cons (car lst) (our-copy-list (cdr lst)))))
;; 游程编码
(defun compress (x)
  (if (consp x)
      (compr (car x) 1 (cdr x))
      x))

;; elt: 列表的第一部分
;; n: 出现的次数
;; lst: 列表的第二部分
(defun compr(elt n lst)
  ;; 如果第二部分为空
  (if (null lst)
      ;; 那么构建列表
      (list (n-elts elt n))
      ;; 否则定义局部变量 next
      ;; next: 第二部分的第一部分
      (let ((next (car lst)))
        ;; 如果第二部分的第一部分等于第一部分,也就是相邻的元素相同
        (if (eql next elt)
            ;; 那么递归操作
            ;; elt: 还是第一部分
            ;; n: 出现次数+1
            ;; lst: 第二部分的第二部分
            (compr elt (+ n 1) (cdr lst))
            ;; 否则构建cons 的第一部分
            ;; cons:压缩后的列表
            ;; elt: 还是第一部分
            ;; n: 第一部分出现的次数
            (cons (n-elts elt n)
                  ;; 构建cons 的第二部分
                  ;; next: 第二部分的第一部分
                  ;; 1: 第二部分的第一部分出现的次数
                  ;; (cdr lst): 第二部分的第二部分
                  (compr next 1 (cdr lst)))))))
;; 生成压缩列表
;; elt: 列表的第一部分
;; n: 第一部分出现的次数
(defun n-elts (elt n)
;; 如果出现次数大于1次
  (if (> n 1)
      ;; 那么返回 (次数 第一部分)
      (list n elt)
      ;; 否则直接返回第一部分
      elt))

;; 解压缩游程编码
(defun uncompress (lst)
  (if (null lst)
      nil
      (let ((elt (car lst))
            (rest (uncompress (cdr lst))))
        (if (consp elt)
            (append (apply #'list-of elt)
                    rest)
            (cons elt rest)))))

(defun our-list-of (n elt)
  (if (zerop n)
      nil
      (cons elt (our-listof (- n 1) elt))
      ))

(defun our-nthcdr (n lst)
  (if (zerop n)
      lst
      (our-nthcdr (- n 1) (cdr lst))))

(defun our-copy-list (lst)
  (if (consp lst)
      (cons (car lst) (cdr lst))
      lst))
(defun our-copy-tree (tr)
  (if (atom tr)
      tr
      (cons (our-copy-tree (car tr))(our-copy-tree (cdr tr)))))

(defun get-length (lst)
  (if (null lst)
      0
      (+ (get-length (cdr lst)) 1)))
(defun our-member-if (fn lst)
  (and (consp lst)
       (if (funcall fn (car lst))
           lst
           (our-member-if fn (cdr lst)))))
;; 判断是否为回文
(defun mirrorp (lst)
  (let ((len (length lst)))
        ;; 是否为偶数
        (and (evenp len)
             (let ((mid (/ len 2)))
                   (equal (subseq lst 0 mid)
                          (reverse (subseq lst mid)))))))

(defun nthmost (n lst)
  (nth (- n 1)
       (sort (copy-list lst) #'>)))

(defun our-reverse (lst)
  (let ((acc nil))
    (dolist (elt lst)
      (push elt acc))
    acc))

(defun our-assoc (key lst)
  (and (consp lst)
       (let ((x (car lst)))
             (if (equal key (car x))
                 x
                 (our-assoc key (cdr lst))))))

;; Chapter 3 习题
;; 1. 用箱子表示法表示以下列表：
'(a b (c d))
'(a (b (c (d))))
'(((a b) c)d)

;; 2. 写一个保留原本列表中元素顺序的 union 版本：
(defun new-union (a b)
  (let ((ra (reverse a)))
    (dolist (x b)
      (if (not (member x ra))
          (push x ra))
      (reverse ra))))
