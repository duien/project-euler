def sieve( max )
  the_numbers = (2..max).to_a
  prime_index = 0

  while (prime = the_numbers[prime_index])**2 < max
    the_numbers = the_numbers.reject{ |i| i % prime == 0 && i != prime }
    prime_index += 1
  end
  the_numbers
end
