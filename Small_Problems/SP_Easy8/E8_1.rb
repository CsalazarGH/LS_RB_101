def sum_of_sums(array)
  array2 = []
  count = array.size

  loop do 
    array2 << array[0..(count-1)]
    count -= 1
    break if count == 0
  end
    
    array2.map do |set|
      set.sum
    end.sum

end




p sum_of_sums([3, 5, 2])



