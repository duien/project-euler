def factor( num )
  2.upto(num) do |factor|
    if num % factor == 0
      return [ factor, *factor(num/factor) ]
    end
  end
  return []
end
