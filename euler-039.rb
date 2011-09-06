# If p is the perimeter of a right angle triangle with integral length sides,
# {a,b,c}, there are exactly three solutions for p = 120.

# {20,48,52}, {24,45,51}, {30,40,50}

# For which value of p <= 1000, is the number of solutions maximised?

require 'set'

def right_triangles_with_perimeter( p )
  tripples = Set.new
  (5..p).each do |c|
    (3..(p-c)).each do |b|
      a = p-c-b
      break if a < b
      tripples << [a,b,c].sort if a**2 + b**2 == c**2
    end
  end
  tripples
end

max = 0
perimeter_with_max = nil 
(3..1000).each do |p|
  triangles = right_triangles_with_perimeter(p)
  if triangles.length > max
    max = triangles.length
    perimeter_with_max = p
  end
end
puts perimeter_with_max


