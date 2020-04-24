def string_to_integer(str)
  matcher = {'1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5, 
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  '0' => 0 }

  digit_array = str.chars.map do |char| # [4, 3, 2, 1]
                matcher[char]
                end

  value = 0

  digit_array.each do |digit|
    value = value * 10 + digit
  end
  value      
end

def int_without_sign(string)
  if string.chars[0] == '+' || string.chars[0] == '-'
    string.chars[1..-1].join
  else
    string
  end
end

def int_sign(numstring)
  case numstring[0]
  when '+' then return '+'
  when '-' then return '-'
  else return 'none'
  end
end

def integer_with_sign(int, s)
  case s
  when '+' then return int
  when '-' then return -(int)
  else return int
  end
end



def string_to_signed_integer(mainstring)
  sign = int_sign(mainstring) # collects sign from string
  integer_str = int_without_sign(mainstring) # "4321", "570", "100" # removes sign from string
  integer = string_to_integer(integer_str) # 4321 # converts sign-less string to integer
  final_integer = integer_with_sign(integer, sign) # connects sign to integer
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100