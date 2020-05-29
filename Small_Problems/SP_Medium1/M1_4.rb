#1000 Lights

def toggle(str)
  str == 'ON' ? 'OFF' : 'ON'
end

def divisible?(idx, num)
  (idx+1) % (num+1) == 0
end

def light_toggler(n)
  lights = Hash.new

  (1..n).to_a.each { |num| lights[num] = 'off' }

  n.times do |num|
    lights.each_with_index { |(k,v), idx| lights[k] = toggle(v) if divisible?(idx, num) }
  end
  
  lights.select { |_, v| v == 'ON' }.keys
end

p light_toggler(10)

