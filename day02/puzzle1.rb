input_data = File.read("input.txt").split

format_data = []
i = 0
while i < input_data.length do
  format_data.push([input_data[i], input_data[i+1], input_data[i+2]])
  i = i + 3
end

valid_passwords = 0
format_data.each do |entry|
  entry[0]["-"] = ".."
  rng = eval(entry[0])
  entry[1][":"] = ""
  occ = entry[2].count(entry[1])
  valid_passwords += 1 if rng.cover?(occ)
end
puts valid_passwords
