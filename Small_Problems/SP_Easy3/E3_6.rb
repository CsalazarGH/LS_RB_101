# Exclusive Or
def xor?(exp1, exp2)
  if exp1 == true && exp2 == true
    return false
  elsif (exp1 == false) && (exp2 == false)
    return false
  else 
    return true
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
