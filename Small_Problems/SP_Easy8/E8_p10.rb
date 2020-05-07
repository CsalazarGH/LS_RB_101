def center_of(string)
  length = string.length 
  
  if length.odd? 
    return string[(length - 1) / 2]
  else
    return string[((length - 1) / 2)..((length - 1) / 2)+1]
  end
end


p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'