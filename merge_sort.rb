def merge_sort(ary)
  return ary if ary.size < 2

  # Divide into halves
  left = merge_sort ary.slice(0, ary.size / 2)
  right = merge_sort ary.slice(ary.size / 2, ary.size)

  # Array for storage
  sorted_array = []

  # Once one array is empty, at that point you can then add together
  until left.empty? || right.empty?
    sorted_array << (left[0] < right[0] ? left.shift : right.shift)
  end

  # add all remaining elements
  sorted_array + left + right
end

def get_input
  puts "Enter a series of numbers to be sorted."
  puts "Example: 1, 2, 6, 5, 4, 3, 7, 9, 12, 15, 28"
  puts 'Type quit to exit'
  puts ''
  
  gets.chomp
end

loop do
  input = get_input
  break if input == 'quit'
  
  ary = input.split(/\D+/).map(&:to_i) # Allows for messed up input to be ignored
  
  p merge_sort(ary)
  puts ''
end