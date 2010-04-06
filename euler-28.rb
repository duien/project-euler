# Starting with the number 1 and moving to the right in a clockwise direction a
# 5 by 5 spiral is formed as follows:
# 
#_21_22 23 24_25_
# 20 _7_ 8 _9_10
# 19  6 _1_ 2 11
# 18 _5_ 4 _3_12
#_17_16 15 14_13_
# 
# It can be verified that the sum of the numbers on the diagonals is 101.
# 
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
# formed in the same way?

size = 1001

sum = 1
last_num = 1
add = 2
while add <= size - 1
  nums_on_round = [ last_num + add, last_num + add*2, last_num + add*3, last_num + add*4 ]
  last_num = nums_on_round.last
  sum = nums_on_round.inject(sum){ |s, i| s + i }
  add += 2
end
puts sum
