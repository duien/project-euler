# Euler published the remarkable quadratic formula:
# 
# n^2 + n + 41
# 
# It turns out that the formula will produce 40 primes for the consecutive
# values n = 0 to 39. However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is
# divisible by 41, and certainly when n = 41, 41^2 + 41 + 41 is clearly
# divisible by 41.
# 
# Using computers, the incredible formula  n^2 - 79n + 1601 was discovered,
# which produces 80 primes for the consecutive values n = 0 to 79. The product
# of the coefficients, 79 and 1601, is 126479.
# 
# Considering quadratics of the form:
# 
# n^2 + an + b, where |a|  1000 and |b|  1000
# 
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |-4| = 4
# 
# Find the product of the coefficients, a and b, for the quadratic expression
# that produces the maximum number of primes for consecutive values of n,
# starting with n = 0.
 
require 'extensions'
require 'sieve'
$max_prime = 1_000
$primes = sieve( $max_prime )

class Integer
  def prime?
    if self > $max_prime
      $max_prime *= 10
      $primes = sieve( $max_prime )
      self.prime?
    end
    $primes.include? self
  end
end

def quadratic( a, b )
  lambda{ |n| n**2 + a * n + b }
end

def primes_produced( quad )
  i = 0
  while quad.call(i).prime?
    i += 1
  end
  i
end

def primes_produced( a, b )
  i = 0
  while ( i**2 + a*i + b ).prime?
    i += 1
  end
  i
end

max_primes_produced = [ 0, 0, 0 ] # num produced, a, b

# -1000.upto(1000) do |a|
#   -1000.upto(1000) do |b|
#     primes = primes_produced( quadratic( a, b ) )
#     if primes > max_primes_produced[0]
#       max_primes_produced = [ primes, a, b ]
#     end
#   end
# end

# it seems that large numbers of primes are produced when a and b are prime
my_nums = $primes.dup
my_nums.each do |a|
  my_nums.each do |b|
    [[1,1],[-1,1],[1,-1],[-1,-1]].each do |am, bm|
      # primes = primes_produced( quadratic( am * a, bm * b ) )
      primes = primes_produced( am * a, bm * b )
      if primes > max_primes_produced[0]
        max_primes_produced = [ primes, am * a, bm * b ]
      end
    end
  end
end


puts max_primes_produced[1] * max_primes_produced[2]
