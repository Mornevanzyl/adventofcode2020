input_data = File.read("input.txt").split

col = row = trees_hit = 0
while row < input_data.length do
  if input_data[row][col] == '#'
    trees_hit += 1
  end
  # puts (row+1).to_s + ' ' + input_data[row] + ', col=' + col.to_s + ' char=' + input_data[row][col] + ' score=' + trees_hit.to_s
  col += 3
  if col > input_data[row].length - 1
    col -= input_data[row].length
  end
  row += 1
end

puts trees_hit
