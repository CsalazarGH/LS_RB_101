def find_fibonacci_index_by_length(int)
  hit = false
  numbers = [1, 1]
  last_num = 0

  while hit == false
    numbers << numbers[-2..-1].sum
    last_num = numbers.last
    
    if last_num.to_s.length == int
      hit = true
    end
  end

  numbers.find_index(last_num) + 1
end



p find_fibonacci_index_by_length(2)