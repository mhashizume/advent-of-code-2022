input_file = File.readlines('./input')
count_hash = Hash.new(0)

input_file.each do |rucksack|
  one, two = rucksack.partition(/.{#{rucksack.size / 2}}/)[1, 2]
  common_chars = one.chars & two.chars
  common_chars.each { |char| count_hash[char] += 1 }
end

lower_case = ('a'..'z').to_a
upper_case = ('A'..'Z').to_a
points = (1..52).to_a

score_hash = Hash[lower_case.zip points[0..25]]
score_hash.merge!(Hash[upper_case.zip points[26..51]])

sum = 0

count_hash.each { |key, value| sum += value * score_hash[key] }

puts sum
