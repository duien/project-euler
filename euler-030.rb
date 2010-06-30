# Surprisingly there are only three numbers that can be written as the sum of
# fourth powers of their digits:
# 
# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# 
# As 1 = 1^4 is not a sum it is not included.
# 
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# 
# Find the sum of all the numbers that can be written as the sum of fifth
# powers of their digits.

i = 1
while 10**i < i * 9**5
  i += 1
end

to_sum = []
2.upto(10**i) do |num|
  sum_of_powers = num.to_s.split('').inject(0){ |sum, i| sum + i.to_i**5 }
  to_sum.push num if num == sum_of_powers
end
puts to_sum.inject{ |sum, i| sum + i }
