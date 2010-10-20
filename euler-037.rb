# The number 3797 has an interesting property. Being prime itself, it is
# possible to continuously remove digits from left to right, and remain prime
# at each stage: 3797, 797, 97, and 7. Similarly we can work from right to
# left: 3797, 379, 37, and 3.
# 
# Find the sum of the only eleven primes that are both truncatable from left to
# right and right to left.
# 
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
 
require 'sieve'

module TruncPrime
  extend self
  def succ
    if @prime
      # try incrementing the last digit
      if @prime[:last] < last_digit.length - 1
        @prime[:last] += 1
      else
        succ_first = @prime[:middle].length == 0 ? true : false
        @prime[:last] = 0
        new_middle = @prime[:middle].dup.reverse
        new_middle.each_with_index do |digit, index|
          if digit < middle_digit.length - 1
            new_middle[index] += 1
            break
          elsif index == new_middle.length - 1
            # if this is the last (ie first) middle digit and we couldn't increment it
            new_middle[index] = 0
            succ_first = true
          else
            new_middle[index] = 0
          end
        end
        @prime[:middle] = new_middle.reverse
        if succ_first
          if @prime[:first] < first_digit.length - 1
            @prime[:first] += 1
          else
            @prime[:first] = 0
            @prime[:middle].unshift(0)
          end
        end
      end
    else
      @prime = { :first => 0, :middle => [], :last => 0 }
    end
    (first_digit[@prime[:first]] + @prime[:middle].map{ |i| middle_digit[i] }.join('') + last_digit[@prime[:last]]).to_i
  end


  def first_digit
    %w[ 2 3 5 7 ]
  end
  def middle_digit
    %w[ 1 3 7 9 ]
  end
  def last_digit
    %w[ 3 7 ]
  end

end

sieve_max = 100_000
sieve_nums = sieve(sieve_max)
sieve_arry = []
sieve_nums.each do |num|
  sieve_arry[num] = true
end
  
trunc_primes = []
while trunc_primes.length < 11 do
  prime = TruncPrime.succ
  if prime > sieve_max
    print "renerating sieve... "
    sieve_max *= 100
    sieve_nums = sieve(sieve_max)
    sieve_arry = []
    sieve_nums.each do |num|
      sieve_arry[num] = true
    end
    puts "done"
  end
  if sieve_arry[prime]
    prime_chars = prime.to_s.split('').map(&:to_i)
    left_trunc  = (0..prime_chars.length-2).map{ |n| prime_chars[0..n].join('').to_i }
    right_trunc = (1..prime_chars.length-1).map{ |n| prime_chars[n..prime_chars.length].join('').to_i }
    if (left_trunc + right_trunc).all?{ |n| sieve_arry[n] }
      trunc_primes << prime 
      puts prime
    end
  end
end

puts trunc_primes.inspect
puts trunc_primes.inject(&:+)
