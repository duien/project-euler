# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 * 99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

max_palindrome = 0
100.upto(999) do |i|
  i.upto(999) do |j|
    prod = i * j
    if prod.to_s.reverse == prod.to_s #it's a palindrome
      if prod > max_palindrome
        max_palindrome = prod
      end
    end
  end
end
puts max_palindrome
