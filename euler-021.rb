# Let d(n) be defined as the sum of proper divisors of n (numbers less than n
# which divide evenly into n).
# 
# If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and
# each of a and b are called amicable numbers.
# 
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
# 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
# 71 and 142; so d(284) = 220.
# 
# Evaluate the sum of all the amicable numbers under 10000.

# See also divisors.rb
 
require 'factor'

def divisors( num )
  # all possible combinations of the factors
  factors = factor( num )
  divisors = power_set( factors ).collect do |set| 
    set.inject{ |prod, i| prod * i }
  end
  divisors.push( 1 )
  divisors.reject{ |i| i == num }.uniq
end

def power_set( set )
  # all possible subsets of a set
  original_set = set
  power_set = []
  while item = set.pop
    generated_sets = [ [ item ] ]
    power_set.each do |s|
      generated_sets.push( s + [ item ] )
    end
    power_set.push *generated_sets
  end
  power_set
end

divisor_sums = (1...10000).inject({}){ |hash, num|
  hash[num] = divisors(num).inject(0){ |sum, i| sum + i }
  hash
}
# puts divisor_sums.inspect
amicable_nums = []
divisor_sums.each do |num, sum|
  amicable_nums.push num if divisor_sums[sum] == num and num != sum
end
# puts amicable_nums.inspect
puts amicable_nums.inject{ |sum, i| sum + i }
