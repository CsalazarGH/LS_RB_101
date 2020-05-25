def bubble_sort!(array)
  loop do
    array.each_with_index do |num, idx|
      break if array[idx+1] == nil
      array[idx], array[idx+1] = array[idx+1], array[idx] if num > array[idx+1]
    end

    break if [array[0], array[-1]] == [array.min, array.max]
  end
    
 array
end
