# The number, 197, is called a circular prime because all rotations of the
# digits: 197, 971, and 719, are themselves prime.
# 
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
# 73, 79, and 97.
# 
# How many circular primes are there below one million?
 
require 'mathn'

require 'sieve'
prime_array = sieve(1_000_000)
primes = prime_array.inject({}){ |pr, n| pr[n] = true; pr }

PRIMES = primes

class Integer
  def circular?
    digits = self.to_s.split('')
    rotations = [self]
    (digits.length - 1).times do
      rotations.push digits.unshift(digits.pop).join('').to_i
    end
    all_prime = rotations.all?{ |n| PRIMES[n] }
  end
end

num_circular = 0
circular_primes = []
primes.keys.each do |prime|
  if prime.circular?
    circular_primes.push prime
    num_circular += 1 
  end
end

puts num_circular

