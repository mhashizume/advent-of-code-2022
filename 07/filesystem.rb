require 'debug'

input_file = File.readlines('input_example')

filesystem = {}
location = []

input_file.each do |line|
  if line.match?(/^\$ cd ../)
    location.pop
  elsif line.match?(/^\$ cd/)
    location.push(line.strip![-1])
    if filesystem.empty?
      filesystem[location[0]] = {}
    elsif location.size == 2
      filesystem[location[0]].merge!({ location[-1] => {} })
    else
      filesystem[location[0]][location[1]].merge!({ location[-1] => {} })
    end
  elsif line == '$ ls' || line.match?(/^dir/)
    next
  elsif line.start_with?(/\d/)
    line.strip! if line.match?(/\n/)
    str_size, filename = line.split(' ')
    size = str_size.to_i

    puts line
    pp filesystem
    pp location
    pp filesystem[location[-1]]
    filesystem[location[-1]].merge!({ filename => size })

    # if location.size == 1
    #   filesystem[location[0]].merge!({ filename => size })
    # elsif location.size == 2
    #   filesystem[location[0]][location[1]].merge!({ filename => size })
    # elsif location.size == 3
    #   filesystem[location[0]][location[1]][location[2]].merge!({ filename => size })
    # end
  end
end

pp filesystem

# binding.break
