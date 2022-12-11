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

scenic_score = 0

# Iterate through all the rows of trees except for the top and bottom, which have automatic zero scenic scores
primary_array[1..-2].each do |tree_row|
  counter = 1

  # Exclude the edges of each row, which will have zero scenic score
  tree_row[1..-2].each do |tree|
    tree_row_index = primary_array.index(tree_row)

    left_counter = 0
    tree_row[0..counter - 1].reverse_each do |left_tree|
      left_counter += 1
      break if left_counter == tree_row[0..counter - 1].size
      break if left_tree >= tree
    end

    right_counter = 0
    tree_row[counter + 1..].each do |right_tree|
      right_counter += 1
      break if right_counter == tree_row[counter + 1..].size
      break if right_tree >= tree
    end

    up_counter = 0
    (primary_array[0..tree_row_index - 1].map { |i| i[counter] }).reverse_each do |up_tree|
      up_counter += 1
      break if up_counter == primary_array[0..tree_row_index - 1].size
      break if up_tree >= tree
    end

    down_counter = 0
    (primary_array[tree_row_index + 1..].map { |i| i[counter] }).each do |down_tree|
      down_counter += 1
      break if down_counter == primary_array[tree_row_index + 1..].size
      break if down_tree >= tree
    end

    tree_score = left_counter * right_counter * up_counter * down_counter

    scenic_score = tree_score if tree_score > scenic_score
    counter += 1
    counter = 1 if counter == tree_row[1..-2].length + 1
  end
end

p "The number of visible trees is #{visible_trees}"
p "The highest scenic score is #{scenic_score}"
