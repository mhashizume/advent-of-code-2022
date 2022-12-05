input_file = File.readlines('input')

array_hash = {}

input_file.each do |line|
  if line.match?(/[A-Z]/)
    indices = line.enum_for(:scan, /[A-Z]/).map do
      Regexp.last_match.offset(0).first
    end
    adjusted_indices = indices.map { |i| (i + 3) / 4 }

    crate_hash = adjusted_indices.zip(line.scan(/[A-Z]/)).to_h

    crate_hash.each do |index, crate|
      if !array_hash["stack_#{index}"]
        array_hash["stack_#{index}"] = [crate]
      else
        array_hash["stack_#{index}"].unshift(crate)
      end
    end
  end

  if line.match?(/^move/)
    str_qty, src, dest = line.scan(/[0-9]+/)
    int_qty = str_qty.to_i

    array_hash["stack_#{dest}"].push(array_hash["stack_#{src}"].pop(int_qty)).flatten!
  end
end

array_hash.sort.each do |key, value|
  puts "#{key}: #{value[-1]}"
end
