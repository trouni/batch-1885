require "json"

# TODO - let's read/write data from beatles.json
filepath = "data/beatles.json"

serialized_json = File.read(filepath)

json = JSON.parse(serialized_json)

# pp json
# pp json["beatles"][-1]["instrument"]

# STORING
data =
  { beatles: [
    {
      first_name: "John",
      last_name: "Lennon",
      instrument: "Guitar"
    },
    {
      first_name: "Paul",
      last_name: "McCartney",
      instrument: "Bass Guitar"
    },
  ]}

File.open("data/new_data.json", "wb") do |file|
  # file.write("Anything that you want to write in the file")
  file.write(JSON.generate(data))
end