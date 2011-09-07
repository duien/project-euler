# By starting at the top of the triangle below and moving to adjacent numbers
# on the row below, the maximum total from top to bottom is 23.
# 
#   _3_
#  _7_4
#  2_4_6
# 8 5_9_3
# 
# That is, 3 + 7 + 4 + 9 = 23.
# 
# Find the maximum total from top to bottom of the triangle below:
# 
#                             75
#                           95  64
#                         17  47  82
#                       18  35  87  10
#                     20  04  82  47  65
#                   19  01  23  75  03  34
#                 88  02  77  73  07  63  67
#               99  65  04  28  06  16  70  92
#             41  41  26  56  83  40  80  70  33
#           41  48  72  33  47  32  37  16  94  29
#         53  71  44  65  25  43  91  52  97  51  14
#       70  11  33  28  77  73  17  78  39  68  17  57
#     91  71  52  38  17  14  91  43  58  50  27  29  48
#   63  66  04  68  89  53  67  30  73  16  69  87  40  31
# 04  62  98  27  23  09  70  98  73  93  38  53  60  04  23
# 
# NOTE: As there are only 16384 routes, it is possible to solve this problem by
# trying every route. However, Problem 67, is the same challenge with a
# triangle containing one-hundred rows; it cannot be solved by brute force, and
# requires a clever method! ;o)
 
triangle = [                  [75],
                            [95, 64],
                          [17, 47, 82],
                        [18, 35, 87, 10],
                      [20,  4, 82, 47, 65],
                    [19,  1, 23, 75,  3, 34],
                  [88,  2, 77, 73,  7, 63, 67],
                [99, 65,  4, 28,  6, 16, 70, 92],
              [41, 41, 26, 56, 83, 40, 80, 70, 33],
            [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
          [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
        [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
      [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
    [63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
  [ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23]]

# you can define a route by a series of 0s and 1s (0 = left, 1 = right) as coming from the top
# you don't even need to do that. working up fro the bottom, keep only the
# larger of the routes that exist from that point

# triangle = [[3],[7,4],[2,4,6],[8,5,9,3]]

prev_row_values = []
triangle.reverse.each_with_index do |row, i|
  this_row_values = []
  if i == 0
    this_row_values = row
  else
    row.each_with_index do |val, j|
      this_row_values.push( val + [prev_row_values[j], prev_row_values[j+1]].max )
    end
  end
  prev_row_values = this_row_values
end
puts prev_row_values.first
