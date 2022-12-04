assignments = File.read('input').split("\n")
inclusive_count = 0
overlap_count = 0

def to_range(input_array)
  Range.new(input_array[0], input_array[1])
end

assignments.each do |pairings|
  one, two = pairings.split(',').map {|x| to_range(x.split('-').map(&:to_i)) }

  inclusive_count += 1 if one.cover?(two) || two.cover?(one)

  one.each do |x|
    if two.to_a.include?(x)
      overlap_count +=1
      break
    end
  end
end

puts inclusive_count
puts overlap_count