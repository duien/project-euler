require 'factor'

def divisors( num )
  # all possible combinations of the factors
  factors = factor( num )
  divisors = power_set( factors ).collect do |set| 
    set.inject{ |prod, i| prod * i }
  end
  divisors.push( 1 )
  divisors.reject{ |i| i == num }.uniq
end

def power_set( set )
  # all possible subsets of a set
  original_set = set
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
