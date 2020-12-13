input_data = File.read('input.txt').split("\n")

# p input_data
seat_map = []
128.times do |i|
  seat_map.push("........" + i.to_s)
end

high_seat = 0
high_row = 0
low_row = 128

input_data.each do |card|

  # Calculate Seat Row
  n1 = 0.0
  n2 = 127.0
  7.times do |n|
    diff = ((n2 - n1) / 2).round
    if card[n] == "F"
      n2 -= diff
    else
      n1 += diff
    end
  end
  row = n1.to_i
  if row < low_row
    low_row = row
  end
  if row > high_row
    high_row = row
  end
  # puts row

  # Calculate Seat Number
  n1 = 0.0
  n2 = 7.0
  3.times do |n|
    diff = ((n2 - n1) / 2).round
    if card[n+7] == "L"
      n2 -= diff
    else
      n1 += diff
    end
  end
  seat = n1.to_i
  # puts seat

  seat_id = row * 8 + seat
  # puts seat_id

  high_seat = seat_id > high_seat ? seat_id : high_seat

  seat_map[row][seat] = "X"

end
puts high_seat

puts "Lowest row = #{low_row}, highest row = #{high_row}"

puts seat_map
