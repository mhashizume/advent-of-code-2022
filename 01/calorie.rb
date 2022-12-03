def sanitize_input
  input_file = File.open('./input')
  input_array = input_file.read.split("\n\n")
  array_of_arrays = input_array.map {|x| x.split("\n") }
  int_arrays = array_of_arrays.map {|y| y.map {|z| z.to_i } }
  int_arrays
end

def calculate_calories(input)
  combined_array = []
  input.each {|array| combined_array.push(array.sum) }
  combined_array
end

puts calculate_calories(sanitize_input).max

puts calculate_calories(sanitize_input).max(3).sum