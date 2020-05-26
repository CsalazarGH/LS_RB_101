def transpose(matrix)
  count = matrix[0].size
  count2 = matrix.size
  trans_array = []

  count.times do |i|
    matrix.each { |arr| trans_array << arr[i] }
  end
  trans_array.each_slice(count2).to_a
end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]