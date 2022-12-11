input_file = File.readlines('input')

primary_array = []

# Create arrays of integers for each row of trees
input_file.each do |line|
  line_array = []
  line.strip.each_char { |i| line_array.push(i.to_i) }
  primary_array.push(line_array)
end

# Count the trees on the perimeter, then subtract the corners which are double-counted
visible_trees = primary_array.size * 2 + primary_array[0].size * 2 - 4

# Iterate through all the rows of trees except for the top and bottom, which are already counted
primary_array[1..-2].each do |tree_row|
  counter = 1

  # Exclude the edges of each row, which are already counted
  tree_row[1..-2].each do |tree|
    # Index the row for later
    tree_row_index = primary_array.index(tree_row)

    # If either side of the row is all shorter than the selected tree, increment the tree counter
    if (tree_row[0..counter - 1].all? { |i| i < tree }) || (tree_row[counter + 1..].all? { |i| i < tree })
      visible_trees += 1
    # If the columns above or below are all shorter than the selected tree, increment the tree counter
    elsif ((primary_array[0..tree_row_index - 1].map { |i| i[counter] }).all? { |i| i < tree }) || ((primary_array[tree_row_index + 1..].map { |i| i[counter] }).all? { |i| i < tree })
      visible_trees += 1
    end

    counter += 1
    counter = 1 if counter == tree_row[1..-2].length + 1
  end
end

p visible_trees
