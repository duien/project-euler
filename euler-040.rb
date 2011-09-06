# An irrational decimal fraction is created by concatenating the positive
# integers:

# 0.12345678910_1_112131415161718192021...

# It can be seen that the 12th digit of the fractional part is 1.

# If d(n) represents the nth digit of the fractional part, find the value of
# the following expression.

# d(1) * d(10) * d(100) * d(1000) * d(10000) * d(100000) * d(1000000)

irrational = ''
i = 1
while irrational.length < 1000000
  irrational << i.to_s
  i += 1
end

puts [1,10,100,1000,10000,100000,1000000].collect{ |n|
  irrational[n-1].chr.to_i
}.inject(&:*)
