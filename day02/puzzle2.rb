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

  if entry[2][rng.begin-1] == entry[1] && entry[2][rng.end-1] == entry[1]
    # invalid
  elsif entry[2][rng.begin-1] == entry[1] || entry[2][rng.end-1] == entry[1]
    valid_passwords += 1
    # puts entry
  else
    # invalid
  end

end
puts valid_passwords
