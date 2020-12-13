input_data = File.read('input.txt')

# Convert double line-feeds comma-delimited
id2 = input_data.gsub("\n\n", ",")

# Remove line-feeds
id2 = id2.gsub("\n", "")

# Convert input data to array with individual group strings
a1 = id2.split(",")

# Convert each string to array with separate individual characters
a3 = []
tot_sum = 0
a1.each do |el|
  a2 = el.chars.uniq
  tot_sum += a2.length
  a3.push(a2)
end
p tot_sum
