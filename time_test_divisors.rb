require 'extensions'

times = { :factor => [] }
          # :divisors_sum => [],
          # :sum_divisors => [],
          # :other_sum_divisors => [],
          # :broken_sum_divisors => [] }
1.upto(100000) do |num|
  times[:factor].push( time{ num.factors } )
  # times[:divisors_sum].push( time{ num.divisors.sum } )
  # times[:sum_divisors].push( time{ num.sum_of_divisors } )
  # times[:other_sum_divisors].push( time{ num.other_sum_of_divisors } )
  # times[:broken_sum_divisors].push( time{ num.broken_sum_of_divisors } )
end
fs = "%20s : %5f"
puts "                test : sum"
puts '-'*31
total_times = times.inject({}){ |hash,(key,values)| hash[key] = values.sum; hash }.sort_by{ |k,v| v }
total_times.each do |key, value|
  puts format(fs, key.to_s.gsub(/_/, ' ').capitalize, value)
end


#                 test : sum
# -------------------------------
#               Factor : 354.962488 # original
#               Factor : 171.575640 # try factors only up to self - self / 2
#   Other sum divisors : 356.831770 #  1.869282
#         Sum divisors : 357.144856 #  2.182368
#  Broken sum divisors : 357.172235 #  2.209747
#         Divisors sum : 378.663274 # 23.700786
