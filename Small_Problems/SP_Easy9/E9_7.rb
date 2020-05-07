def swap_name(name)
  "#{name.split(' ')[1]}, #{name.split(' ')[0]}"
end


# more efficient method

def swap_name2(name)
  name.split(' ').join(', ')
end