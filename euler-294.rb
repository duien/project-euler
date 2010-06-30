# For a positive integer k, define d(k) as the sum of the digits of k in its
# usual decimal representation. Thus d(42) = 4+2 = 6.
# 
# For a positive integer n, define S(n) as the number of positive integers k <
# 10^n with the following properties :
# - k is divisible by 23 and
# - d(k) = 23
#
# You are given that S(9) = 263626 and S(42) = 6377168878570056.  Find S(11^12)
# and give your answer mod 10^9.

class Integer
  def d
    self.to_s.split('').map(&:to_i).inject{ |sum, i| sum + i }
  end

  def d2

  end

  def s
    max = 10 ** self
    selected = 0
    i = 23
    while i < max
      selected += 1 if i.d == 23
      i += 207
    end
    selected
  end
end

[8].each do |i|
  puts format "%2d : %s", i, i.s
end

