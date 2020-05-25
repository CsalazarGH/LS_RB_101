def featured_number?(int)
  int_digits = int.digits.reverse
  booleans = [(int.odd?), (int % 7 == 0 ), (int_digits.uniq.size == int_digits.size)]

  if booleans.uniq == [true]
    true 
  else
    false
  end
end

def featured(int)
  loop do
    int += 1
    break if featured_number?(int)
  end
  int
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
