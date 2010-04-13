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
require 'set'

class Integer
  def to_ch
    self.to_s.split('')
  end

  def pandigital?
    n = self.to_s.length
    !!( self.to_ch == self.to_ch.uniq and self.to_s =~ %r/^[1-#{n}]{#{n}}$/ )
  end

end

pandigital_products = Set.new

pandigital = ARGV[0].to_i || 123456798
pandigital_string = pandigital.to_s
pandigital_length = pandigital_string.length

# 1.upto(pandigital) do |multiplier|
#   next unless multiplier.to_ch == multiplier.to_ch.uniq
#   puts multiplier
#   (pandigital/multiplier).to_i.upto(multiplier) do |multiplicand|
#     product = multiplier * multiplicand
#     full_string = "#{product}#{multiplier}#{multiplicand}"
#     next unless full_string.length == pandigital.to_s.length and full_string.to_i.pandigital?
#     puts "PANDIGITAL #{multiplier} * #{multiplicand} = #{product}"
#     pandigital_products.add product
#   end
# end

# (pandigital - pandigital/2).to_i.downto(1) do |panda|
#   next unless panda.to_ch == panda.to_ch.uniq
#   divisors = panda.divisors.dup
#   divisors.each do |div|
#     other_div = panda / div
#     divisors.delete(other_div)
#     panda_string = "#{panda}#{div}#{other_div}"
#     if panda_string.length == pandigital_length and panda_string.to_i.pandigital?
#       puts "PANDA! #{panda} = #{div} x #{other_div}"
#       pandigital_products.add panda
#     end
#     trap :INT do
#       puts "I was on #{panda}"
#       exit
#     end
#   end
# end

class Array
  def permute
    return self if length == 1
    (0 .. length - 1).to_a.inject([]) do |permutations, initial_index|
      array = dup
      initial = array.delete_at(initial_index)
      permutations + array.permute.collect do |p|
        [ initial, *p ]
      end
    end
  end
end

pandigital_array = pandigital_string.split('')
permutations = pandigital_array.permute
multiplier_lengths = pandigital_length % 2 == 0 ? [pandigital_length/2] : [ (pandigital_length-1)/2, (pandigital_length+1)/2]

permutations.each do |perm|
  multiplier_lengths.each do |len|
    product = perm.last(pandigital_length - len).join('').to_i
    multiplier_digits = perm.first(len)
    (1 .. len - 2).each do |n|
      m1 = multiplier_digits[0..n].join('').to_i
      m2 = multiplier_digits[n+1..len-1].join('').to_i
      if m1 * m2 == product
        # puts "PANDA! #{m1} * #{m2} = #{product}"
        pandigital_products.add product
      end
    end
  end
end
# puts pandigital_products.inspect
puts pandigital_products.inject(&:+)
