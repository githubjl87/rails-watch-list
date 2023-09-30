# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated'
user_serialized = URI.open(url).read
data = JSON.parse(user_serialized)


data['results'].each do |movie_data|
  Movie.create!(
    title: movie_data['title'], overview: movie_data['overview'], poster_url: "https://image.tmdb.org/t/p/original/#{movie_data['poster_path']}", rating: movie_data['vote_average'])
end
