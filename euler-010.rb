# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.
 
require 'sieve'

puts sieve( $*.first.to_i ).inject{ |sum, i| sum + i }
