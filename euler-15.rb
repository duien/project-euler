# Starting in the top left corner of a 2x2 grid, there are 6 routes (without
# backtracking) to the bottom right corner.
# 
# How many routes are there through a 20x20 grid?

size = $*.first.to_i || 2

$routes_already_calculated = []
(0..size).to_a.each do |i|
  $routes_already_calculated[i] = []
end

def routes_from( x, y, max_x, max_y )
  return 1 if x == max_x and y == max_y
  
  total_routes = 0

  calced_routes = $routes_already_calculated[x][y] || $routes_already_calculated[y][x]
  return calced_routes unless calced_routes.nil?
  
  # try going down
  total_routes += routes_from( x, y+1, max_x, max_y ) if y < max_y
  
  # try going righ
  total_routes += routes_from( x+1, y, max_x, max_y ) if x < max_x

  $routes_already_calculated[x][y] = $routes_already_calculated[y][x] = total_routes
end

puts routes_from( 0, 0, size, size )
