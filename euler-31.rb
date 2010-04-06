# In England the currency is made up of pound, £, and pence, p, and there are
# eight coins in general circulation:
# 
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
# It is possible to make £2 in the following way:
# 
# 1*£1 + 1*50p + 2*20p + 1*5p + 1*2p + 3*1p
#
# How many different ways can £2 be made using any number of coins?

# 73682

english_coins = [ 1, 2, 5, 10, 20, 50, 100, 200 ]
total_amount = $*.first.to_i
# 
# ways_to_make = Hash.new{ |h,k| h[k] = Array.new }
# 
# 1.upto( total_amount ) do |amount|
# 
#   if english_coins.include? amount
#     ways_to_make[amount] << [ amount ]
#   end
# 
#   smaller_coins = english_coins.select{ |c| c < amount }
#   smaller_coins.each do |coin|
#     ways_to_make[amount - coin].each do |way|
#       ways_to_make[amount] << [ coin, *way ].sort
#     end
#   end
#   ways_to_make[amount].uniq!
#   puts format( "%-3d: %d", amount, ways_to_make[amount].length )
# end
# 
# puts ways_to_make[total_amount].length

#  1: [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
#  2: [ 1, 1, 1, 1, 1, 1, 1, 1, 2 ]
#  3: [ 1, 1, 1, 1, 1, 1, 2, 2 ]
#  4: [ 1, 1, 1, 1, 2, 2, 2 ]
#  5: [ 1, 1, 2, 2, 2, 2 ]
#  6: [ 2, 2, 2, 2, 2 ]
#  7: [ 1, 1, 1, 1, 1, 5 ]
#  8: [ 1, 1, 1, 2, 5 ]
#  9: [ 1, 2, 2, 5 ]
# 10: [ 5, 5 ]
# 11: [ 10 ]


def iterative_coin_count( english_coins, total_amount )
  this_combination = Array.new( total_amount, 1 )
  total_combinations = 0

  english_coins.each_with_index do |coin, i|
    next if  coin > total_amount
    if coin == 1
      total_combinations += 1
      next
    end
    while this_combination.first(coin).all?{ |c| c == 1 }
      remaining_combination = this_combination.slice(coin..this_combination.length)
      this_combination = remaining_combination + [ coin ]
      total_combinations += 1
      smaller_coins = english_coins.slice( 1..i-1 )
      unless smaller_coins.empty?
        amount = this_combination.select{ |c| c == 1 }.length
        total_combinations += iterative_coin_count( smaller_coins, amount ) unless amount == 0
      end
    end
    this_combination = Array.new( total_amount, 1 )
  end
  total_combinations
end
t1 = Time.now
puts iterative_coin_count( english_coins, total_amount )
puts "Took #{Time.now - t1} sec"

t1 = Time.now
count = 0
200.step(0, -200) {|a|
  a.step(0, -100) {|b|
    b.step(0, -50){|c|
      c.step(0, -20){|d|
        d.step(0, -10){|e|
          e.step(0, -5){|f| 
            f.step(0, -2){|g|
              count += 1}}}}}}}
p count
puts "Took #{Time.now - t1} sec"


