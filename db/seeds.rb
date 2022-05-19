# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'json'

10.times do
  movies = Movie.new(
    title: Faker::TvShows::RickAndMorty.quote,
    overview: Faker::Fantasy::Tolkien.poem,
    poster_url: 'https://api.lorem.space/image?w=150&h=180',
    rating: Faker::Number.decimal(l_digits: 1)
  )
  movies.save
end

5.times do
  lists = List.new(
    name: Faker::Games::Fallout.quote
  )
  lists.save
end

5.times do
  bookmark = Bookmark.new(
    comment: Faker::Movies::HarryPotter.quote,
    movie_id: Faker::Number.between(from: 1, to: 10),
    list_id: Faker::Number.between(from: 1, to: 5)
  )
  bookmark.save
end
