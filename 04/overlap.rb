assignments = File.read('input').split("\n")
count = 0

def to_range(input_array)
  Range.new(input_array[0], input_array[1])
end

assignments.each do |pairings|
  one, two = pairings.split(',').map {|x| to_range(x.split('-').map(&:to_i)) }

  count += 1 if one.cover?(two) || two.cover?(one)
end

puts count