input_file = File.read('input')

counter = 4
sequence = input_file.slice!(0, 4).chars

while sequence != sequence.uniq do 
  sequence.shift
  sequence.push(input_file.slice!(0, 1))
  counter += 1
end

puts counter
