  require "open-uri"
  require "nokogiri"

def get_top_5_movie_urls
  # Get the top 5 movies on this page: https://www.imdb.com/chart/top/
  url = 'https://www.imdb.com/chart/top/'

  html_file = URI.parse(url).read(
    "User-Agent" => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'
  )
  html_doc = Nokogiri::HTML.parse(html_file)

  html_doc.search(".ipc-title-link-wrapper").first(5).map do |element|
   "https://www.imdb.com#{element.attribute("href").value.split("?").first}"
  end
end

def fetch_movie_info(url)
  # Fetch the cast, director, summary, title and year for one movie
  html_file = URI.parse(url).read(
    "User-Agent" => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
    "Accept-Language" => 'en'
  )
  html_doc = Nokogiri::HTML.parse(html_file)

  director = html_doc.search('.ipc-metadata-list-item__list-content-item.ipc-metadata-list-item__list-content-item--link')[0].text.strip
  cast = html_doc.search('ul.ipc-metadata-list--dividers-all li:last-child li').first(3).map { |el| el.text.strip }
  year = html_doc.search('.joVhBE li').first.text.strip.to_i
  title = html_doc.search('.hero__primary-text').text.strip
  summary = html_doc.search('.sc-3ac15c8d-0').text.strip

  {
    director: director,
    cast: cast,
    year: year,
    title: title,
    summary: summary
  }
end