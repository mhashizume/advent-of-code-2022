input_file = File.read('input')

def part_one(input)
  part_one_input = input.dup
  counter = 4
  sequence = part_one_input.slice!(0, 4).chars

  while sequence != sequence.uniq do 
    sequence.shift
    sequence.push(part_one_input.slice!(0, 1))
    counter += 1
  end
  puts counter
end

def part_two(input)
  part_two_input = input.dup
  counter = 14
  sequence = part_two_input.slice!(0, 14).chars

  while sequence != sequence.uniq do 
    sequence.shift
    sequence.push(part_two_input.slice!(0, 1))
    counter += 1
  end
  puts counter
end

part_one(input_file)
part_two(input_file)
