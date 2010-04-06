# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
# 
# What is the smallest number that is evenly divisible by all of the numbers
# from 1 to 20?
 
require 'extensions'

each_factors = (1..20).collect{ |i| i.factors }
each_factors_hash = Array.new(each_factors.length){ Hash.new{ |h, k| h[k] = 0 } }
all_factors = Hash.new{ |h, k| h[k] = 0 }
each_factors.each_with_index do |factors, i|
  factors.each do |factor|
    each_factors_hash[i][factor] += 1
  end
end
each_factors_hash.each do |factors|
  factors.each do |factor, num|
    all_factors[factor] = num unless all_factors[factor] > num
  end
end
puts all_factors.inject(1){ |prod, (factor, num)| prod * factor**num }
