# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# 
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out
# in words, how many letters would be used?
# 
# 
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
# forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
# letters. The use of "and" when writing out numbers is in compliance with
# British usage.
 
def in_words( num )
  ones  = %w{ one two three four five six seven eight nine }
  teens = %w{ ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen }
  tens  = %w{ twenty thirty forty fifty sixty seventy eighty ninety }
  case num
  when 1000
    'one thousand'
  when 100..999
    spelled = ones[ (num / 100) - 1 ] + ' hundred'
    spelled = spelled + " and " + in_words( num % 100 ) unless num % 100 == 0
    spelled
  when 20..99
    spelled = tens[ (num / 10) - 2 ]
    spelled = spelled + '-' + in_words( num % 10 ) unless num % 10 == 0
    spelled
  when 10..19
    teens[ num % 10 ]
  when 1..9
    ones[ num - 1 ]
  when 0
    ''
  end
end

puts (1..1000).to_a.inject(0){ |sum, i| sum + in_words(i).gsub(/\W/, '').length }
