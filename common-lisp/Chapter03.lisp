;; 定义函数创建cd
(defun make-cd (title artist rating ripped)
 (list :title title :artist artist :rating rating :ripped ripped))

;; 定义全局变量
(defvar *db* nil)

;; 新增数据函数
(defun add-record (cd) (push cd *db*))

;; 遍历数据
(defun dump-db ()
  (format t "~{~{~a->~8t~a~%~}~%~}" *db*))

;; 用户录入
(defun prompt-read (prompt)
  (format *query-io* "~a>> " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

;; 用户录入数据
(defun make-cd-for-prompt ()
    (make-cd
     (prompt-read "Title")
     (prompt-read "Arist")
     (parse-integer (prompt-read "rating") :junk-allowed t)
     (y-or-n-p "Ripped? [y/n]: ")))

;; 循环录入
(defun add-cds ()
  (loop (add-record (make-cd-for-prompt))
  (if (not (y-or-n-p "Another? [y/n]: ")) (return))))

;; 保存数据至文件
(defun save-db (filename)
  "with-open-file用于打开一个文件，并且将文件流绑定到out变量上,
然后执行表达式，最后关闭文件流。"
  (with-open-file (out filename
                       ;; direction和output用于指定打开一个用于写入的文件
                       :direction :output
                       ;; 用于说明当文件存在，那么覆盖
                       :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

;; 加载文件数据
(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

(defun select (selector-fn)
  (remove-if-not selector-fn *db*))


(defun update (selector-fn &key title artist rating (ripped nil ripped-p))
  (setf *db*
        (mapcar
         #'(lambda (row)
             (when (funcall selector-fn row)
               (if title (setf (getf row :title) title))
               (if artist (setf (getf row :artist) artist))
               (if rating (setf (getf row :rating) rating))
               (if ripped (setf (getf row :ripped) ripped)))
               row) *db*)))

(defun delete-rows (selector-fn)
  (setf *db* (remove-if selector-fn *db*)))

(defmacro backwards (expr) (reverse expr))

(defun make-comparision-expr (field value)
  `(equal (getf cd ,field) ,value))

(defun make-comparision-list (fields)
  (loop while fields
        collecting (make-comparision-expr (pop fields) (pop fields))))

(defmacro where (&rest clauses)
  `#'(lambda (cd) (and ,@(make-comparision-list clauses))))
