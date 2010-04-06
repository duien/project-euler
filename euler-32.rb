# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
# through 5 pandigital.
# 
# The product 7254 is unusual, as the identity, 39 * 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.
# 
# Find the sum of all products whose multiplicand/multiplier/product identity
# can be written as a 1 through 9 pandigital.
# 
# HINT: Some products can be obtained in more than one way so be sure to only
# include it once in your sum.
 
require 'extensions'

class Integer
  def to_ch
    self.to_s.split('')
  end

  def pandigital?( n )
    # if there's duplicate digits, it's definitely not
    return false unless self.to_ch == self.to_ch.uniq

    all_digits = (1..n).to_a.collect{ |i| i.to_s }
    
    divs = self.divisors

    divs.delete( 1 )
    divs.delete( self )

    divs.each do |divisor|
      result = self / divisor
      divs.delete( result )

      digits = self.to_ch + divisor.to_ch + result.to_ch
      if digits.sort == all_digits
        return true
      end
    end
    false
  end

end

sum = 0
1.upto( 7654321 ) do |number|
  sum += number if number.pandigital?(7)  
end
puts sum

# obvious improvements:
#   there's duplicate divisor loops
