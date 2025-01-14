require "open-uri"
require "nokogiri"

# Let's scrape recipes from https://www.bbcgoodfood.com

url = "https://www.bbcgoodfood.com/search?q=mushroom"
html_file = URI.parse(url).read
html_doc = Nokogiri::HTML.parse(html_file)

# pp html_doc.search("h2.heading-4").first.text
# pp html_doc.search("h2.heading-4").first.attributes['class'].value # "heading-4"

html_elements = html_doc.search("h2.heading-4").first(10) # array
html_elements.each_with_index do |html_element, index|
  puts "#{index + 1}. #{html_element.text}"
end 

