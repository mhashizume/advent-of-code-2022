score = 0
shapes = { 'X' => 1, 'Y' => 2, 'Z' => 3 }
win_regex = 'A Y|B Z|C X'
draw_regex = 'A X|B Y|C Z'

input_file = File.readlines('./input')

shapes.each { |key, val| score += input_file.count { |i| i.match(key) } * val }
score += input_file.count { |i| i.match(win_regex) } * 6
score += input_file.count { |i| i.match(draw_regex) } * 3

puts score

pt2_score = 0
game_state = { 'X' => 0, 'Y' => 3, 'Z' => 6 }
rock_regex = 'A Y|B X|C Z'
paper_regex = 'A Z|B Y|C X'
scissors_regex = 'A X|B Z|C Y'

game_state.each do |key, val|
  pt2_score += input_file.count { |i| i.match(key) } * val
end
pt2_score += input_file.count { |i| i.match(rock_regex) }
pt2_score += input_file.count { |i| i.match(paper_regex) } * 2
pt2_score += input_file.count { |i| i.match(scissors_regex) } * 3

puts pt2_score
