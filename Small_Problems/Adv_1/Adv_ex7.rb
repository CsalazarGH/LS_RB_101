def merge(arr1, arr2)
  (arr1 | arr2).sort
end

p merge([1, 5, 9], [2, 6, 8]) 