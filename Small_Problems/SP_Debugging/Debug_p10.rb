arr = ["9", "8", "7", "10", "11"]


arr =  arr.sort do |x, y|
        y.to_i <=> x.to_i
       end
p arr


# Actual output: ["10", "11", "7", "8", "9"] 