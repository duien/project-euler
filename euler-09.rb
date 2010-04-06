# A Pythagorean triplet is a set of three natural numbers, a < b < c, for
# which,
# 
# a^2 + b^2 = c^2
# 
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
 
1.upto(1000) do |c|
  1.upto(c) do |b|
    1.upto(b) do |a|
      next unless a + b + c == 1000 and a**2 + b**2 == c**2
      puts [a,b,c].inspect
      puts a*b*c
      exit
    end
  end
end
