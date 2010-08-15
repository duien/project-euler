# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
# 
# Find the sum of all numbers, less than one million, which are palindromic in
# base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include
# leading zeros.)
 
palindromes = []
(0..1_000_000).each do |num|
  num_chars = num.to_s.split('')
  if num_chars.reverse == num_chars
    bin_chars = num.to_s(2).split('')
    if bin_chars.reverse == bin_chars
      palindromes << num
    end
  end
end

puts palindromes.inject(&:+)
