# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
# 
# A number n is called deficient if the sum of its proper divisors is less than
# n and it is called abundant if this sum exceeds n.
# 
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit
# cannot be reduced any further by analysis even though it is known that the
# greatest number that cannot be expressed as the sum of two abundant numbers
# is less than this limit.
# 
# Find the sum of all the positive integers which cannot be written as the sum
# of two abundant numbers.

require 'extensions'

# First, let's try generating all abundant numbers under 28123
abundant = (12..28123).select{ |num| num.sum_of_divisors > num * 2 }

# puts time{
#   abundant_sum = []
#   abundant.each do |i|
#     abundant.each do |j|
#       abundant_sum.push( i + j )
#     end
#   end
#   no_abundant_sum = (1..28123).to_a - abundant_sum
#   puts no_abundant_sum.inject{ |sum, i| sum + i }
# } # => 26.883394

# puts time{
#   summable = {}
#   abundant.each_with_index do |num, i|
#     abundant[i..abundant.length-1].each do |num2|
#       sum = num + num2
#       break if sum > 28123
#       summable[sum] = true
#     end
#   end
#   puts ((1..28123).to_a - summable.keys).sum
# } # => 12.307444

# puts time{ 
  abundant_sum = []
  abundant.each_with_index do |num, i|
    abundant[i..abundant.length-1].each do |num2|
      sum = num + num2
      break if sum > 28123
      abundant_sum.push sum
    end
  end
  puts ((1..28123).to_a - abundant_sum).sum
# } # => 11.059086
