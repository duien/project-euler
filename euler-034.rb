# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# 
# Find the sum of all numbers which are equal to the sum of the factorial of
# their digits.
# 
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

# three digit... fac(n%10)

require 'extensions'
@factorials = (0..9).map(&:factorial)
puts @factorials.inspect

def sum_of_factorials(n)
  n.to_s.split('').inject(0){ |sum, digit| sum + @factorials[digit.to_i] }
end

3.upto(100_000_000) do |i|
  puts i if i == sum_of_factorials(i)
end
