(message "%d" #b101100)

(setq foo (- (+ 1.0 1.0e-3) 1.0))
(setq bar 1.0e-3)
(= foo bar)


(= 1.0 1)
(eql 1.0 1)

"
truncate 转换成靠近0的整数
floor 转换成最接近的不本身大的整数
ceiling 转换成最接近的不比本身小的整数
round 四舍五入后的整数，换句话和说和它的差绝对值最小的整数
"

(eval-when-compile
  (require 'cl))
(setq num_a 10)
(incf num_a)
num_a


