# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.new([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.new(name: "Luke", movie: movies.first)
Country.create(title: 'Country 1', description: 'Description 1')
puts 'Creating Country 1'
country1 = Country.create(title: 'Country 1', description: 'Description 1')
puts "Errors: #{country1.errors.full_messages.join(', ')}" if country1.errors.any?

puts 'Creating Country 2'
country2 = Country.create(title: 'Country 2', description: 'Description 2')
puts "Errors: #{country2.errors.full_messages.join(', ')}" if country2.errors.any?