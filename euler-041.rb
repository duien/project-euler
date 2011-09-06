# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
# also prime.

# What is the largest n-digit pandigital prime that exists?

require 'mathn'
require 'sieve'

class Integer
  def to_ch
    self.to_s.split('')
  end

  def pandigital?
    n = self.to_s.length
    !!( self.to_ch == self.to_ch.uniq and self.to_s =~ %r/^[1-#{n}]{#{n}}$/ )
  end
end

# Generate primes, then check for pandigital
# puts sieve(987654321).select{ |p| p.pandigital? }.last

# Generate pandigital then check for primes
def pandigital_prime
  # Numbers with 1..8 and 1..9 can't be prime
  %w(1 2 3 4 5 6 7).permutation.map{ |p| p.join('').to_i }.sort.reverse.each do |permute|
    return permute if permute.prime_division.length == 1
  end
  return false
end

puts pandigital_prime


# Generate primes one at a time
# largest_pandigital = 0
# pf = Prime.new
# while (prime = pf.next) <= 987654321
#   if prime.pandigital?
#     puts prime
#     largest_pandigital = prime 
#   end
# end
# puts largest_pandigital
  

