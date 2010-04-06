# A permutation is an ordered arrangement of objects. For example, 3124 is one
# possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
# are listed numerically or alphabetically, we call it lexicographic order. The
# lexicographic permutations of 0, 1 and 2 are:
# 
# 012   021   102   120   201   210
# 
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4,
# 5, 6, 7, 8 and 9?

class Integer
  def factorial
    (1..self).inject(1){ |p,i| p*i }
  end
end
 
# 012 021 102 120 201 210

# 0123 0132 0213 0231 0312 0321
# 1023 1032 1203 1230 1302 1320
# 2013 2031 2103 2130 2301 2310
# 3012 3021 3102 3120 3201 3210

# the first ( length - 1 )! have the same first digit
# and so on down the line

def nth_permutation_of( to_permute, desired_permutation )
  if to_permute.length == 1
    to_permute
  else
    first_char = to_permute.delete_at( (desired_permutation - 1) / (to_permute.length - 1).factorial )
    [ first_char, *nth_permutation_of( to_permute, ((desired_permutation) % to_permute.length.factorial) ) ]
  end
end

puts nth_permutation_of( [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ], 1_000_000 ).join('')
