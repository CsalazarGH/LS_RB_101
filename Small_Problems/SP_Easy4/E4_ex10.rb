# Convert a Signed Number to a String!

def integer_to_string(integer)
  matcher = {1 => '1',
             2 => '2',
             3 => '3',
             4 => '4',
             5 => '5',
             6 => '6',
             7 => '7',
             8 => '8',
             9 => '9',
             0 => '0' }
   
   string_array =  integer.digits.reverse.map do |digit|
                   matcher[digit]
                   end
   string_array.join
end

def sign(integer)
  case integer <=> 0
  when +1 then return '+'
  when -1 then  return '-'
  end
end

def without_sign(integer)
  integer < 0 ? integer * -1 : integer
end

def signed_integer_to_string(signedinteger)
  positive_or_negative = sign(signedinteger) # '+' 

  integer_without_sign = without_sign(signedinteger) # 4231

  integer_string = integer_to_string(integer_without_sign) # '4321'

  final_string = case positive_or_negative # '+4321'
                 when '+' then return '+' + integer_string
                 when '-' then return '-' + integer_string
                 else return integer_string
                 end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'