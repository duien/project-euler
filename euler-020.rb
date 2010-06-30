# n! means n * (n - 1) * ... * 3 * 2 * 1
# 
# Find the sum of the digits in the number 100!
 
def factorial( num )
  (1..num).inject{ |prod, i| prod * i }
end

puts factorial(100).to_s.split('').inject(0){ |sum, i| sum + i.to_i }
