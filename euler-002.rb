# Each new term in the Fibonacci sequence is generated by adding the previous
# two terms. By starting with 1 and 2, the first 10 terms will be:
# 
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# 
# Find the sum of all the even-valued terms in the sequence which do not exceed
# four million.
 
last_term = 1
curr_term = 1
sum = 0

while curr_term< 4_000_000
  next_term = last_term + curr_term
  last_term = curr_term
  curr_term = next_term
  sum += curr_term if curr_term % 2 == 0
end
puts sum
