# The following iterative sequence is defined for the set of positive integers:
# 
# n -> n/2 (n is even) n -> 3n + 1 (n is odd)
# 
# Using the rule above and starting with 13, we generate the following
# sequence:
# 
# 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
# 
# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem), it
# is thought that all starting numbers finish at 1.
# 
# Which starting number, under one million, produces the longest chain?
# 
# NOTE: Once the chain starts the terms are allowed to go above one million.
 
def sequence( start, cached = { 1 => [ 1 ] } )
  # cached[start] || case
  case
  when start == 1
    [ 1 ]
  when start & 1 == 0 # even
    # cached[start] = 
    [start, *sequence( start/2, cached ) ]
  else # odd
    # cached[start] = 
    [start, *sequence( 3*start + 1, cached ) ]
  end
end

def sequence_length( start )
  case when start == 1
    1
  when start & 1 == 0
    1 + sequence_length( start/2 )
  else # odd
    1 + sequence_length( 3*start + 1 )
  end
end

start_time = Time.now
max_length = 0
num_with_max_length = nil
1.upto( $*.first.to_i ) do |i|
  next if i%2 == 0
  # seq = sequence(i)
  # puts "#{i} #{seq.inspect}"
  # s = seq.length
  s = sequence_length( i )
  if s > max_length
    max_length = s
    num_with_max_length = i
  end
end

end_time = Time.now

puts "It took: #{end_time - start_time} seconds"

puts "Max length: #{max_length}"
puts "Number producing it: #{num_with_max_length}"
