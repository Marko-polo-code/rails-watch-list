# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

response = URI.open("https://tmdb.lewagon.com/movie/top_rated")
json = JSON.parse(response.read)

puts "Cleaning database in progress..."
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts "Creating movies..."

json['results'].each do |entry|
  movie = Movie.create!(
    title: entry['title'],
    overview: entry['overview'],
    rating: entry['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/original#{entry['backdrop_path']}"
  )
  puts "Created #{movie.title}"
end
