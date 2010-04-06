require 'sieve'
require 'mathn'
#require 'memoize'
#include Memoize

#memoize :sieve

class Integer
  def factors
    2.upto(self - self/2) do |factor|
      if self % factor == 0
        return [ factor, *(self/factor).factors ]
      end
    end
    return self == 1 ? [] : [ self ]
  end

  def new_factors
    primes = sieve( self )
    primes.each do |factor|
      if self % factor == 0
        return [ factor, *(self/factor).factors ]
      end
    end
    return self == 1 ? [] : [ self ]
  end
end

def time
  t1 = Time.now
  yield
  Time.now - t1
end

puts time{ 2.upto(1000){ |i| i.factors } }
puts time{ 2.upto(1000){ |i| i.new_factors } }
puts time{ 2.upto(1000){ |i| i.prime_division } }

