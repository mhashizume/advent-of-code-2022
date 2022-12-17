instructions = File.readlines('input', chomp: true).map!(&:split).map! { |i| [i[0], i[1].to_i] }

cycle = 0
register = 1
total_strength = 0

instructions.each do |instruction|
  case instruction[0]
  when 'noop'
    cycle += 1
    if cycle == 20 || ((cycle - 20) % 40).zero?
      signal_strength = cycle * register
      total_strength += signal_strength
    end
  when 'addx'
    counter = 2
    while counter != 0
      cycle += 1
      counter -= 1
      if cycle == 20 || ((cycle - 20) % 40).zero?
        signal_strength = cycle * register
        total_strength += signal_strength
      end
      register += instruction[1] if counter.zero?
    end
  end
end

p "The sum of the six signal strengths is #{total_strength}"
