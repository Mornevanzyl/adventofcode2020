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

# Passport field validation method
def valid(field, val)

  return false if val == nil

  if field == 'byr' && val.to_i.between?(1920, 2002)
    return true
  elsif field == 'iyr' && val.to_i.between?(2010, 2020)
    return true
  elsif field == 'eyr' &&  val.to_i.between?(2020, 2030)
    return true
  elsif field == 'hgt' && val =~ /\d+cm/
    hgt = val.gsub("cm", "").to_i
    if hgt.between?(150, 193)
      return true
    end
  elsif field == 'hgt' && val =~ /\d+in/
    hgt = val.gsub("in", "").to_i
    if hgt.between?(59, 76)
      return true
    end
  elsif field == 'hcl' && val =~ /\#[0-9a-f]{6}$/
    return true
  elsif field = 'ecl' && val =~ /(amb|blu|brn|gry|grn|hzl|oth)$/
    return true
  elsif field = 'pid' && val =~ /^\d{9}$/
    return true
  end
  return false
end

# Iterate over persons array and validate individual passport entries
valid_passports = 0
persons.each do |pp|
  if valid("byr", pp["byr"]) && valid("iyr", pp["iyr"]) && valid("eyr", pp["eyr"]) && valid("hgt", pp["hgt"]) &&
    valid("hcl", pp["hcl"]) && valid("ecl", pp["ecl"]) && valid("pid", pp["pid"])
    valid_passports += 1
  end
end
puts valid_passports
