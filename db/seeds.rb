# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!(name: "World", abbreviation: "world")
Category.create!(name: "U.S.", abbreviation: "u.s.")
Category.create!(name: "Business", abbreviation: "business")
Category.create!(name: "Technology", abbreviation: "technology")
Category.create!(name: "Science", abbreviation: "science")
Category.create!(name: "Health", abbreviation: "health")