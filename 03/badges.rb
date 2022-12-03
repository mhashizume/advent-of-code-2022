input_file = File.readlines('./input')
count_hash = Hash.new(0)

input_file.each_slice(3) do |group|
  group_array = []

  group.each do |elf|
    group_array.push(elf.strip.chars)
  end

  badge =  group_array[0] & group_array[1] & group_array[2]

  badge.each {|char| count_hash[char] += 1}
end

lower_case = ('a'..'z').to_a
upper_case = ('A'..'Z').to_a
points = (1..52).to_a

score_hash = Hash[lower_case.zip points[0..25]]
score_hash.merge!(Hash[upper_case.zip points[26..51]])

sum = 0

count_hash.each {|key, value| sum += value * score_hash[key] }

puts sum