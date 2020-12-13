input_data = File.read('input.txt')

# Convert double line-feeds comma-delimited
id2 = input_data.gsub("\n\n", ",")

# Remove line-feeds
id2 = id2.gsub("\n", " ")

# Convert input data to array with individual group strings
a1 = id2.split(",")

# Convert each string to array with separate individual characters
a3 = []
tot_sum = 0
a1.each do |el|
  group_count = el.split.length
  full_string = el.gsub(" ", "")
  a2 = full_string.chars.uniq

  yes_count = 0
  a2.each do |char|
    if full_string.count(char) == group_count
      yes_count += 1
    end
  end
  tot_sum += yes_count
end
p tot_sum
