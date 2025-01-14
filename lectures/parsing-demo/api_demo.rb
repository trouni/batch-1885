require "json"
require "open-uri"

# TODO - Let's fetch name and bio from a given GitHub username
print '> GitHub username? '
username = gets.chomp
url = "https://api.github.com/users/#{username}" # API Endpoint

serialized_json = URI.parse(url).read

user = JSON.parse(serialized_json)

puts "#{user["name"]} works at #{user["company"]} in #{user["location"]} and has #{user["public_repos"]} public repos."

