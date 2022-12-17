instructions = File.readlines('input', chomp: true).map!(&:split).map! { |i| [i[0], i[1].to_i] }

crt = String.new
cycle = 0
register = 1
row = 0

instructions.each do |instruction|
  case instruction[0]
  when 'noop'
    row = 0 if row == 40
    if (register - 1..register + 1).include?(row)
      crt[cycle] = '#'
    else
      crt[cycle] = '.'
    end
    cycle += 1
    row += 1
  when 'addx'
    counter = 2
    while counter != 0
      row = 0 if row == 40
      if (register - 1..register + 1).include?(row)
        crt[cycle] = '#'
      else
        crt[cycle] = '.'
      end
      cycle += 1
      row += 1
      counter -= 1
    end
    register += instruction[1]
  else
    puts "\"#{instruction}\" is an unknown instruction."
  end
end

pp crt.chars.each_slice(40).map(&:join)
