def sequence(num1, num2)
  array = []
  accumulator = 0

  num1.times do 
    array << accumulator += num2
  end
array
end

def sequence2(num1, num2)
  (1..(num1 * num2)).to_a.keep_if do |num|
    num % num2 == 0
  end
end

