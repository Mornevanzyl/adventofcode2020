input_data = File.read("input.txt").split

moves = [[1,1], [3,1], [5,1], [7,1], [1,2]]
total = 1
moves.each do |rd|
  col = row = trees_hit = 0
  col_r = rd[0]
  row_d = rd[1]
  while row < input_data.length do
    if input_data[row][col] == '#'
      trees_hit += 1
    end
    # puts (row+1).to_s + ' ' + input_data[row] + ', col=' + col.to_s + ' char=' + input_data[row][col] + ' score=' + trees_hit.to_s
    col += col_r
    if col > input_data[row].length - 1
      col -= input_data[row].length
    end
    row += row_d
  end
  puts trees_hit
  total = total * trees_hit
end

puts total
