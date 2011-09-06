# The nth term of the sequence of triangle numbers is given by, t(n) = ½n(n+1);
# so the first ten triangle numbers are:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its
# alphabetical position and adding these values we form a word value. For
# example, the word value for SKY is 19 + 11 + 25 = 55 = t(10). If the word
# value is a triangle number then we shall call the word a triangle word.

# Using words.txt, a 16K text file containing nearly two-thousand common
# English words, how many are triangle words?

require 'csv'

class String
  def to_num
    self.split('').map{ |c| c[0] - 64 }.inject(&:+)
  end
end

def triangle(n)
  0.5 * n * (n+1)
end

words = CSV.open('words.txt', 'r').first
largest_value = words.map(&:to_num).max

triangles = []
n = 1
while (t = triangle(n)) < largest_value
  triangles << t
  n += 1
end

triangle_word_count = 0
words.each do |word|
  triangle_word_count += 1 if triangles.include? word.to_num
end
puts triangle_word_count
