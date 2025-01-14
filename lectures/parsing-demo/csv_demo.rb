require "csv"

# TODO - let's read/write data from beatles.csv
filepath = "data/beatles.csv"

# PARSING

CSV.foreach(filepath, headers: :first_row) do |row|
  # puts "#{row[0]} #{row[1]} plays the #{row[2]}"
  puts "#{row["First Name"]} #{row["Last Name"]} plays the #{row["Instrument"]}" # This is order-proof (more robust implementation)
  puts '====='
end

# STORING

beatles = [
  ["John", "Lennon", "Guitar"],
  ["Paul", "McCartney", "Bass Guitar"]
]

filepath = "data/new_beatles.csv"

CSV.open(filepath, "wb", force_quotes: true) do |csv|
  csv << ["First Name", "Last Name", "Instrument"]
  beatles.each do |beatle|
    csv << beatle
  end
end