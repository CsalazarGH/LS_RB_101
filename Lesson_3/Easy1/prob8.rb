# Turn this into an array containing only two elements: Barney's name and Barney's number

flintstones = { "Fred" => 0,
                "Wilma" => 1,
                "Barney" => 2,
                "Betty" => 3,
                "BamBam" => 4,
                "Pebbles" => 5 }

array = []

flintstones.delete_if {|name, value| name != 'Barney'}

p flintstones
# => {"Barney"=>2}

flintstones.each do |name, value|
  array.push(name)
  array.push(value)
end

p array
# => 
