input_data = File.read("input.txt").split

i = 0
input_length = input_data.length

while i < input_length do
  j = i + 1
  while true do
    if input_data[j] == nil
      break
    end
    if input_data[i].to_i + input_data[j].to_i == 2020
      puts input_data[i] + " * " + input_data[j] + " = " + (input_data[i].to_i * input_data[j].to_i).to_s
    end
    j += 1
  end

  i += 1
end
