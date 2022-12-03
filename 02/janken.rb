score = 0
shapes = {'X' => 1, 'Y' => 2, 'Z' => 3}
win_regex = 'A Y|B Z|C X'
draw_regex = 'A X|B Y|C Z'

input_file = File.readlines('./input')

shapes.each {|key,val| score += input_file.count {|i| i.match(key) } * val }
score += input_file.count {|i| i.match(win_regex) } * 6
score += input_file.count {|i| i.match(draw_regex) } * 3

puts score