require_relative 'scraper'
require 'yaml'

movie_urls = get_top_5_movie_urls
movies = movie_urls.map { |url| fetch_movie_info(url) }

File.open("movies.yml", "w") do |f|
  f.write(movies.to_yaml)
end
