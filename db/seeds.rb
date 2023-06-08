# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding..."
SubCategory.create(name: 'ClassBook', category_id: 1)
SubCategory.create(name: 'ModuleBooK', category_id: 1)
SubCategory.create(name: 'ModelBook', category_id: 1)
SubCategory.create(name: 'RootBook', category_id: 2)
SubCategory.create(name: 'SQLBook', category_id: 2)
SubCategory.create(name: 'NoSQLBok', category_id: 3)
SubCategory.create(name: 'OOPWithRuby', category_id: 4)
SubCategory.create(name: 'NothingBook', category_id: 5)
puts "Seeding done."