# A unit fraction contains 1 in the numerator. The decimal representation of
# the unit fractions with denominators 2 to 10 are given:
# 
# 1/2	  = 	0.5
# 1/3	  = 	0.(3)
# 1/4	  = 	0.25
# 1/5	  = 	0.2
# 1/6	  = 	0.1(6)
# 1/7	  = 	0.(142857)
# 1/8	  = 	0.125
# 1/9	  = 	0.(1)
# 1/10	= 	0.1
# 
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
# seen that 1/7 has a 6-digit recurring cycle.
# 
# Find the value of d  1000 for which 1/d contains the longest recurring cycle
# in its decimal fraction part.
 
require 'sieve'

class Integer
  def find_unit_fraction_cycle
    numerator = 1
    denominator = self
    result = []

    n = numerator / denominator
    rem = numerator -  denominator * n
    
    while rem != 0
      numerator = rem * 10
      n = numerator / denominator
      rem = numerator - denominator * n
      if i = result.index( [n,rem] )
        return result[i..result.length].collect{ |n,r| n }
      end
      result.push [n,rem]
    end

    nil
  end
end

max_length = [0,0]
# 2.upto(999) do |i|
sieve(1000).each do |i| # nice little optimization suggested in forums -- only primes will have long cycles
  c = i.find_unit_fraction_cycle
  if c and c.length > max_length[1]
    max_length = [ i, c.length ]
  end
end
puts max_length.first
