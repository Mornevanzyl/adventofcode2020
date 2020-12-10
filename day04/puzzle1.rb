input_data = File.read('input.txt')

# Convert double line-feeds comma-delimited
id2 = input_data.gsub("\n\n", ",")
# Convert inter-passport line-feeds to spaces
id2 = id2.gsub("\n", " ")
# Convert input data array with individual passport strings
a1 = id2.split(",")
# Convert each passport string entry to separate arrays by individual kvp
a3 = []
a1.each do |el|
  a2 = el.split
  a3.push(a2)
end
# Create persons arrary and convert array entries to hashes with searchable kvp
persons = []
a3.each do |el|
  person = {}
  el.each do |info|
    a_kvp = info.split(":")
    person[a_kvp[0]] = a_kvp[1]
  end
  persons.push(person)
end

valid_passports = 0
# Iterate over persons array and validate presence of required fields
persons.each do |pp|
  if pp["byr"] == nil || pp["iyr"] == nil || pp["eyr"] == nil || pp["hgt"] == nil || pp["hcl"] == nil || pp["ecl"] == nil || pp["pid"] == nil
    # invalid passport
  else
    valid_passports += 1
  end
end
puts valid_passports
