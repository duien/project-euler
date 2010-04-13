# The fraction 49/98 is a curious fraction, as an inexperienced mathematician
# in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which
# is correct, is obtained by cancelling the 9s.
# 
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
# 
# There are exactly four non-trivial examples of this type of fraction, less
# than one in value, and containing two digits in the numerator and
# denominator.
# 
# If the product of these four fractions is given in its lowest common terms,
# find the value of the denominator.

require 'mathn'

curious_num, curious_den = 1,1

10.upto(99) do |numerator|
  10.upto(99) do |denominator|
    next if numerator == denominator or numerator/10 == denominator/10 or (numerator%10 == 0 and denominator%10 == 0) or (numerator / denominator) > 1
    num_chars = numerator.to_s.split('')
    den_chars = denominator.to_s.split('')
    if (repeat = (num_chars & den_chars)) and not repeat.empty?
      # there's a common digit
      repeat.each do |rep|
        next if rep == 0 or (den_chars - [rep]).join('').to_i == 0
        new_frac = ((num_chars - [rep]).join('').to_f / (den_chars - [rep]).join('').to_f)
        old_frac =  numerator.to_f / denominator.to_f
        if new_frac == old_frac
          # puts "curious fraction #{(num_chars - [rep]).join('').to_i}/#{(den_chars - [rep]).join('').to_i} = #{numerator}/#{denominator} (#{new_frac} == #{old_frac})"
          curious_num *= numerator
          curious_den *= denominator
        end
      end
    end
  end
end

gcd = curious_num.gcd2(curious_den)
puts curious_den/gcd
