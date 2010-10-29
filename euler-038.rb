# Take the number 192 and multiply it by each of 1, 2, and 3:
# 
# 192 * 1 = 192
# 192 * 2 = 384
# 192 * 3 = 576
#
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We
# will call 192384576 the concatenated product of 192 and (1,2,3)
# 
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4,
# and 5, giving the pandigital, 918273645, which is the concatenated product of
# 9 and (1,2,3,4,5).
# 
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as
# the concatenated product of an integer with (1,2, ... , n) where n > 1?
 
class Integer
  def to_ch
    self.to_s.split('')
  end

  def pandigital?
    n = self.to_s.length
    pandigital? n
  end
  
  def pandigital?(n)
    return false unless self.to_s.length == n
    !!( self.to_ch == self.to_ch.uniq and self.to_s =~ %r/^[1-#{n}]{#{n}}$/ )
  end
end

def concat_product(number, max_mult)
  (1..max_mult).map do |mult|
    (number  * mult).to_s
  end.join('').to_i
end

puts concat_product(192, 3).pandigital?(9)
puts concat_product(9, 5).pandigital?(9)

largest_possible = 987654321

smallest_product = 0
number = 1
pandigital_products = []
while smallest_product < largest_possible
  smallest_product = concat_product(number, 2)
  products = (3..9).map{ |n| concat_product(number, n) }
  pan = products.push(smallest_product).select{ |n| n.pandigital?(9) }
  pandigital_products.push pan
  
  number += 1
end

puts pandigital_products.flatten.max