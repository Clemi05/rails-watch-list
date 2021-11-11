# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin

puts 'Cleaning db'
Movie.destroy_all

puts 'Create movies'

Movie.create(title: "Berlin Calling", overview: "A man tours clubs around the globe with his manager and girlfriend. On the eve of their largest album release he is admitted to a psychiatric clinic after overdosing at a gig.", poster_url: "https://www.themoviedb.org/t/p/w1280/7QqBiTfCm4gBg7WPYismTjCIsGJ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Pulp Fiction", overview: "A burger-loving hit man, his philosophical partner, a drug-addled gangster's moll and a washed-up boxer converge in this sprawling, comedic crime caper.", poster_url: "https://www.themoviedb.org/t/p/w1280/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg", rating: 7.9)
Movie.create(title: "Dune", overview: "Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people.", poster_url: "https://www.themoviedb.org/t/p/w1280/d5NXSklXo0qyIYkgV94XAgMIckC.jpg", rating: 9.0)
Movie.create(title: "The Lord of the Rings: The Return of the King", overview: "Aragorn is revealed as the heir to the ancient kings as he, Gandalf and the other members of the broken fellowship struggle to save Gondor from Sauron's forces.", poster_url: "https://www.themoviedb.org/t/p/w1280/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg", rating: 8.5)

puts 'Done!'
=end

require 'open-uri'

puts 'Cleaning db'
Movie.destroy_all

puts 'Start seeding'

url = 'http://tmdb.lewagon.com/movie/top_rated'
url_serialized = URI.open(url).read
top = JSON.parse(url_serialized)
all_movies = top['results']
all_movies.each do |movie|
  params = {
    title: movie['title'],
    overview: movie['overview'],
    rating: movie['vote_average'],
    poster_url: "https://www.themoviedb.org/t/p/w1280#{movie['poster_path']}"
  }
  Movie.create!(params)
end

puts 'Seeding done'
