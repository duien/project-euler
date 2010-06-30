# The sum of the squares of the first ten natural numbers is,
# 
# 1^2 + 2^2 + ... + 10^2 = 385
# 
# The square of the sum of the first ten natural numbers is,
# 
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# 
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025 - 385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.

def sum_of_squares( range )
  range.inject(0){ |sum, i| sum + i**2 }
end

def square_of_sums( range )
  range.inject(){ |sum, i| sum + i }**2
end

range = 1..100
puts square_of_sums(range) - sum_of_squares(range)
