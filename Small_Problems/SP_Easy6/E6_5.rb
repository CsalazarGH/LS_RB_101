def reverse(array)
  new_array = []
  
  array.reverse_each {|ele| new_array << ele}

  new_array
end



p reverse([1,2,3,4]) == [4,3,2,1]         
p reverse(%w(a b e d c)) == %w(c d e b a)
p reverse(['abc']) == ['abc']    
p reverse([]) == []    
