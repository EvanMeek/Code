sumMe x = x + x
sumUs x y = sumMe x + sumMe y

sumSmallNumber x = if x > 100
                   then x
                   else
                   sumMe x
firstList = [1,20,13,12,512,3,2312]

boomBangs xs = [if x< 10 then "BOOM!" else "BANG!" | x <- xs , odd x]

-- 取10~20之间不等于13,15或19的数

test = [x | x <- [10..20],x /= 13,x/=15,x/=19]

-- 找到满足三边长度为整数、三边长度小于等于10、周长为24的直角三角形

rightTriangle = [(a,b,c) | c <- [1..10] , b <- [1..c] , a <- [1..b], a^2 + b^2 == c^2, a+b+c==24]
