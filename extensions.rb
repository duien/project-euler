require 'mathn'

class Integer
  def factors
    2.upto(Math.sqrt(self)) do |factor|
      if self % factor == 0
        return [ factor, *(self/factor).factors ]
      end
    end
    return self == 1 ? [] : [ self ]
  end

  def divisors
    factors = self.factors
    divisors = factors.power_set.collect do |set|
      set.inject{ |prod, i| prod * i }
    end
    divisors.uniq.push 1
  end

  def proper_divisors
    divisors - [ self ]
  end

  def sum_of_divisors
    # factors.inject(1){ |prod, i| prod * ( ( i**2 - 1 )/( i - 1 ) ) }
    # this doesn't actually work. all must be relatively prime, meaning repeated factors must be dealt with
    factors = self.factors
    factors.uniq.inject(1){ |product, factor|
      power = factors.grep(factor).length
      product * ( ( factor ** ( power + 1 ) - 1 ) / ( factor - 1 ) )
    }
  end

  def factorial
    raise if self < 0
    return 1 if self == 0
    return self if self <= 2
    (2..self).inject(1){ |fac, i| fac * i }
  end

end

class Array
  def power_set
    set = self
    power_set = []
    while item = set.pop
      generated_sets = [ [ item ] ]
      power_set.each do |s|
        generated_sets.push( s + [ item ] )
      end
      power_set.push *generated_sets
    end
    power_set
  end

  def sum
    inject(0){ |sum, i| sum + i }
  end
end

def time
  t1 = Time.now
  yield
  Time.now - t1
end

