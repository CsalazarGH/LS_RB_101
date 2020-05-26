def transpose(matrix)
  trans_array = []
  3.times do |i|
    matrix.each { |arr| trans_array << arr[i] }
  end
  trans_array.each_slice(3).to_a
end