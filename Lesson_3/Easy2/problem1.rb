# See if the name spot is in the hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.include?('spot') #  => false
ages.key?('spot') #  => false
ages.member?('spot') #  => false
