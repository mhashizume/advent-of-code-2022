require 'debug'
input_file = File.readlines('input')

move_array = []

# First value in the array is the X axis, second is Y axis
positional_hash = { H: [0, 0], T: [0, 0] }

input_file.each do |move|
  direction, str_number = move.strip.split(' ')
  number = str_number.to_i

  while number.positive?
    case direction
    when 'R'
      positional_hash[:H][0] += 1
    when 'L'
      positional_hash[:H][0] -= 1
    when 'U'
      positional_hash[:H][1] += 1
    when 'D'
      positional_hash[:H][1] -= 1
    end

    x_diff = positional_hash[:H][0] - positional_hash[:T][0]
    y_diff = positional_hash[:H][1] - positional_hash[:T][1]

    if x_diff == 1 && y_diff == 2
      positional_hash[:T][0] += 1
      positional_hash[:T][1] += 1
    elsif x_diff == 1 && y_diff == -2
      positional_hash[:T][0] += 1
      positional_hash[:T][1] -= 1
    elsif x_diff == 2 && y_diff == 1
      positional_hash[:T][0] += 1
      positional_hash[:T][1] += 1
    elsif x_diff == 2 && y_diff == -1
      positional_hash[:T][0] += 1
      positional_hash[:T][1] -= 1
    elsif x_diff == -1 && y_diff == 2
      positional_hash[:T][0] -= 1
      positional_hash[:T][1] += 1
    elsif x_diff == -1 && y_diff == -2
      positional_hash[:T][0] -= 1
      positional_hash[:T][1] -= 1
    elsif x_diff == -2 && y_diff == 1
      positional_hash[:T][0] -= 1
      positional_hash[:T][1] += 1
    elsif x_diff == -2 && y_diff == -1
      positional_hash[:T][0] -= 1
      positional_hash[:T][1] -= 1
    elsif x_diff > 1
      positional_hash[:T][0] += 1
    elsif y_diff > 1
      positional_hash[:T][1] += 1
    elsif x_diff < -1
      positional_hash[:T][0] -= 1
    elsif y_diff < -1
      positional_hash[:T][1] -= 1
    end

    move_array.push(positional_hash[:T].dup)

    number -= 1
  end
end

p move_array.uniq!.size
